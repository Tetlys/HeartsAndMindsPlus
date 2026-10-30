/*
    Function: btc_vbeid_fnc_spawner

    VBEID - Automatic Spawner
    Hearts and Minds Plus

    Spawn distribution:
    50% enemy-controlled towns
    30% roads / countryside
    20% cleared towns

    Server-side only.
*/

if (!isServer) exitWith {};

// Spawn distribution (must total 100)
private _enemyTownChance = 50;
private _elsewhereChance = 30;
private _clearedTownChance = 20;

// Spawn settings
private _maxActiveVBEIDs = 1;
private _spawnInterval = 0; // TEST ONLY - 30 seconds
private _activationDistance = 1000; // Starts chasing within 1000m
private _minimumPlayerDistance = 200; // Minimum spawn distance
private _maximumPlayerDistance = 800; // Maximum spawn distance

diag_log "[VBEID] Automatic spawner initialized";
// Find alive players on the friendly side
private _getEligiblePlayers = {
    allPlayers select {
        isPlayer _x &&
        {alive _x} &&
        {side group _x isEqualTo btc_player_side} &&
        {!captive _x}
    }
};
// Get towns based on their current occupation status
private _getTownsByOccupation = {
    params ["_occupied"];

    (values btc_city_all) select {
        (_x getVariable ["occupied", false]) isEqualTo _occupied &&
{(_x getVariable ["type", ""]) in [
            "NameVillage",
            "NameCity",
            "NameCityCapital",
            "NameLocal"
        ]}
    }
};

// Find nearby road positions suitable for VBEID spawning
private _getNearbyRoads = {
    params ["_players"];

    private _roads = [];

    {
        private _player = _x;

        {
            private _road = _x;
            private _pos = getPosATL _road;

            private _nearEnough = (_players findIf {
    _x distance2D _pos <= _maximumPlayerDistance
}) >= 0;

private _farEnough = (_players findIf {
    _x distance2D _pos < _minimumPlayerDistance
}) isEqualTo -1;

private _validDistance = _nearEnough && _farEnough;

private _roadClear = (nearestObjects [
    _pos,
    ["Car", "Tank", "Truck", "WheeledAPC", "TrackedAPC"],
    8
]) isEqualTo [];

if (
    _validDistance &&
    {!surfaceIsWater _pos} &&
    {_roadClear}
) then {
    _roads pushBackUnique _road;
};
        } forEach (_player nearRoads _maximumPlayerDistance);

    } forEach _players;

    _roads
};
// Select a random valid road position
private _getRoadSpawnPosition = {
    params ["_players"];

    private _roads = [_players] call _getNearbyRoads;

// Keep only roads outside registered town boundaries
private _towns = values btc_city_all;

_roads = _roads select {
    private _roadPos = getPosATL _x;

    (_towns findIf {
        private _town = _x;
        private _radius = _town getVariable ["cachingRadius", 100];

        _roadPos distance2D _town <= _radius
    }) isEqualTo -1
};

    if (_roads isEqualTo []) exitWith {
        []
    };

    private _road = selectRandom _roads;
    private _pos = getPosATL _road;

    _pos
};
// Find a suitable road inside a selected town
private _getTownRoadPosition = {
    params ["_town", "_players"];

    private _townPos = getPosATL _town;
    private _townRadius = _town getVariable ["cachingRadius", 100];

    private _roads = [_players] call _getNearbyRoads;

    _roads = _roads select {
        (getPosATL _x) distance2D _townPos <= _townRadius
    };

    if (_roads isEqualTo []) exitWith {
        []
    };

    getPosATL (selectRandom _roads)
};
// Select VBEID spawn category using 50/30/20 distribution
private _selectSpawnCategory = {
    private _roll = random 100;

    if (_roll < _enemyTownChance) exitWith {
        "enemy"
    };

    if (_roll < (_enemyTownChance + _elsewhereChance)) exitWith {
        "elsewhere"
    };

    "cleared"
};
// Find a spawn position for the selected category
private _getSpawnPosition = {
    params ["_category", "_players"];

    if (_category isEqualTo "elsewhere") exitWith {
        [_players] call _getRoadSpawnPosition
    };

    private _occupied = _category isEqualTo "enemy";

    private _towns = [_occupied] call _getTownsByOccupation;

     if (_towns isEqualTo []) exitWith {
    []
};

// Find all suitable roads in eligible towns
private _validPositions = [];

{
    private _pos = [_x, _players] call _getTownRoadPosition;

    if (_pos isNotEqualTo []) then {
        _validPositions pushBack _pos;
    };
} forEach _towns;

// No valid town roads found
if (_validPositions isEqualTo []) exitWith {
    []
};

// Select a random valid town road position
selectRandom _validPositions
};
// Create and activate monitoring for a VBEID
private _spawnVBEID = {
    params ["_pos"];

    if (_pos isEqualTo []) exitWith {objNull};

    private _vehicle = [
        _pos
    ] call btc_vbeid_fnc_create;

    if (isNull _vehicle) exitWith {objNull};

    // Track this vehicle for cleanup and spawn limits
    _vehicle setVariable ["btc_vbeid_spawned", true, true];

    // Start checking for nearby players
    [
        _vehicle,
        _activationDistance
    ] call btc_vbeid_fnc_monitor;

    diag_log format [
        "[VBEID] Spawned vehicle at %1",
        _pos
    ];

    _vehicle
};
// Track VBEIDs created by the automatic spawner
private _activeVBEIDs = [];

// Remove destroyed, detonated, or deleted vehicles from tracking
private _cleanupVBEIDList = {
    _activeVBEIDs = _activeVBEIDs select {
        !isNull _x &&
        {alive _x} &&
        {!(_x getVariable ["btc_vbeid_detonated", false])}
    };
};
// Automatic VBEID spawning cycle


    // Remove destroyed vehicles from tracking
    call _cleanupVBEIDList;

    // Only spawn if we're below the vehicle limit
    if (count _activeVBEIDs < _maxActiveVBEIDs) then {

        private _players = call _getEligiblePlayers;

        if (_players isNotEqualTo []) then {

            private _category = call _selectSpawnCategory;
            private _pos = [_category, _players] call _getSpawnPosition;

if (_pos isEqualTo []) then {
    diag_log format [
        "[VBEID] No valid spawn road found | Category: %1",
        _category
    ];
};

            if (_pos isNotEqualTo []) then {

                private _vehicle = [_pos] call _spawnVBEID;

                if (!isNull _vehicle) then {
                    _activeVBEIDs pushBack _vehicle;

                    diag_log format [
                        "[VBEID] Category: %1 | Active: %2/%3",
                        _category,
                        count _activeVBEIDs,
                        _maxActiveVBEIDs
                    ];
                };
            };
        };
    };
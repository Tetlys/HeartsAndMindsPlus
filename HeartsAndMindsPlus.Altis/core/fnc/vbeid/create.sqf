
/*

    Function: btc_vbeid_fnc_create

    VBEID - Vehicle-Borne Explosive Device
    Creates a parked civilian vehicle with an AI driver.
    The vehicle will remain stationary until activated.
*/

params [
    ["_pos", [0, 0, 0]],
    ["_vehicleType", [] call btc_flag_fnc_randomFlagVehicle, [""]]
];

if (!isServer) exitWith {objNull};

private _vehicle = createVehicle [_vehicleType, _pos, [], 0, "NONE"];
_vehicle setDir random 360;

private _group = createGroup [civilian, true];
_group setVariable ["no_cache", true];
_group setVariable ["acex_headless_blacklist", true];

private _driver = _group createUnit [SelectRandom btc_civ_type_units, _pos, [], 0, "NONE"];

private _group = createGroup [btc_enemy_side, true];
[_driver] joinSilent _group;

_driver moveInDriver _vehicle;
_vehicle engineOn false;

_group setBehaviour "CARELESS";
_group setSpeedMode "FULL";

_vehicle setVariable ["btc_vbeid_active", false, true];

_vehicle

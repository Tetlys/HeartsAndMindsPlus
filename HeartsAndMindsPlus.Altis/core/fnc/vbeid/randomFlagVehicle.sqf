/* ----------------------------------------------------------------------------
Function: btc_flag_fnc_randomFlagVehicle

Description:
    Return a random vehicle class from a list that can display a flag
    (has a flag proxy) and has at least btc_flag_minSeats seats.
    Results are cached per vehicle class.

Parameters:
    _classes - Vehicle classnames to choose from. [Array]

Returns:
    _class - Random valid classname, or "" if none are valid. [String]

Examples:
    (begin example)
        ["B_MRAP_01_F", "B_Quadbike_01_F", "B_APC_Wheeled_01_cannon_F"] call btc_flag_fnc_randomFlagVehicle;
    (end)

---------------------------------------------------------------------------- */

params [
    ["_classes", btc_civ_type_veh, [[]]]
];

if (isNil "btc_flag_vehicleCache") then {
    btc_flag_vehicleCache = createHashMap;
};

// Manual overrides (classnames, isKindOf so parents work too)
private _forceAllowed = missionNamespace getVariable ["btc_flag_forceAllowed", []];
private _forceDenied = missionNamespace getVariable ["btc_flag_forceDenied", []];
private _minSeats = missionNamespace getVariable ["btc_flag_minSeats", 4];

private _valid = _classes select {
    private _type = _x;
    private _canHaveFlag = btc_flag_vehicleCache get _type;

    if (isNil "_canHaveFlag") then {
        _canHaveFlag = switch (true) do {
            case !(isClass (configFile >> "CfgVehicles" >> _type)): {false};
            case (_forceDenied findIf {_type isKindOf _x} > -1): {false};
            case (_forceAllowed findIf {_type isKindOf _x} > -1): {true};
            case (([_type, true] call BIS_fnc_crewCount) < _minSeats): {false};
            default {
                // Spawn a temporary local copy to read the model's proxies
                private _tmp = createVehicleLocal [_type, [0, 0, 0], [], 0, "CAN_COLLIDE"];
                _tmp enableSimulation false;
                private _hasProxy = (selectionNames _tmp) findIf {
                    private _name = toLowerANSI _x;
                    _name find "proxy" > -1 && {_name find "flag" > -1}
                } > -1;
                deleteVehicle _tmp;
                _hasProxy
            };
        };
        btc_flag_vehicleCache set [_type, _canHaveFlag];
    };

    _canHaveFlag
};

if (_valid isEqualTo []) exitWith {""};

selectRandom _valid
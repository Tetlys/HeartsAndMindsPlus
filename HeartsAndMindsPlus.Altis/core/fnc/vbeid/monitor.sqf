/*
    Function: btc_vbeid_fnc_monitor

    VBEID - Proximity Monitor
    Detects nearby players and activates the vehicle.

    Parameters:
        _vehicle - VBEID vehicle to monitor. [Object]
        _activationDistance - Distance at which players activate the vehicle. [Number]

    Returns:
        Nothing.

    Examples:
        [_vehicle, 1000] call btc_vbeid_fnc_monitor;
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_activationDistance", 1000, [0]]
];

if (!isServer) exitWith {};
if (isNull _vehicle) exitWith {};

[_vehicle, _activationDistance] spawn {
    params ["_vehicle", "_activationDistance"];

    while {
        alive _vehicle &&
        {!(_vehicle getVariable ["btc_vbeid_active", false])}
    } do {
        private _players = allPlayers select {
            alive _x &&
            {side group _x isEqualTo btc_player_side} &&
            {!captive _x} &&
            {_x distance _vehicle <= _activationDistance}
        };

        if (_players isNotEqualTo []) then {
            [_vehicle, _players select 0] call btc_vbeid_fnc_activate;
        } else {
            if (allPlayers findIf {
                alive _x &&
                {side group _x isEqualTo btc_player_side} &&
                {!captive _x} &&
                {_x distance _vehicle <= (_activationDistance + 500)}
            } isEqualTo -1) exitWith {
                {deleteVehicle _x} forEach crew _vehicle;
                deleteVehicle _vehicle;
            };
        };
        
        sleep 5;
    };
};

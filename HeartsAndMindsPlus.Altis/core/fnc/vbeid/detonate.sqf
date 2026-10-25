
/*
    VBEID - Detonation
    Server-side explosion at the vehicle's position.
*/

params [
    ["_vehicle", objNull, [objNull]]
];

if (!isServer) exitWith {};
if (isNull _vehicle || {!alive _vehicle}) exitWith {};
if (_vehicle getVariable ["btc_vbeid_detonated", false]) exitWith {};

_vehicle setVariable ["btc_vbeid_detonated", true, true];

private _pos = getPosATL _vehicle;

btc_ied_power createVehicle _pos;

[_pos] call btc_deaf_fnc_earringing;
[_pos] remoteExecCall [
    "btc_ied_fnc_effects",
    [0, -2] select isDedicated
];

["btc_ied_boom", [_pos]] call CBA_fnc_localEvent;

{
    deleteVehicle _x;
} forEach crew _vehicle;

deleteVehicle _vehicle;


/*
    VBEID - Activation
    Makes the parked vehicle chase a nearby player.
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_target", objNull, [objNull]]
];

if (!isServer) exitWith {};
if (isNull _vehicle || {isNull _target}) exitWith {};
if (!alive _vehicle || {!alive _target}) exitWith {};

private _driver = driver _vehicle;
if (isNull _driver || {!alive _driver}) exitWith {};

_vehicle setVariable ["btc_vbeid_active", true, true];
_vehicle engineOn true;

private _group = group _driver;
_group setBehaviour "CARELESS";
_group setSpeedMode "FULL";

_vehicle forceFlagTexture "\A3\Data_F\Flags\flag_CSAT_CO.paa";

[driver _vehicle] call btc_ied_fnc_suicider_active;

(driver _vehicle) doMove (getPosATL _target);

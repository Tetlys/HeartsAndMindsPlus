
/* ----------------------------------------------------------------------------
Function: btc_ied_fnc_allahu_akbar

Description:
    Play song and trigger suicider bomb if suicider is alive and awake.

Parameters:
    _trigger - Trigger attached to the suicider. [Object]

Returns:

Examples:
    (begin example)
        [trigger] call btc_ied_fnc_allahu_akbar;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_trigger", objNull, [objNull]]
];

private _suicider = _trigger getVariable "suicider";
private _vehicle = vehicle _suicider;

if (alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
    playSound3d [getMissionPath "core\sounds\allahu_akbar.ogg", _suicider, false, getPosASL _suicider, 5, random [0.9, 1, 1.2], 100];
};

if (!isNull (objectParent _suicider)) then {
    [_suicider, objectParent _suicider] spawn {
        params ["_suicider", "_vehicle"];

        while {alive _suicider && {alive _vehicle}} do {
            _suicider forceWeaponFire [
                currentWeapon _vehicle,
                currentWeapon _vehicle
            ];
        };
    };
};

[{
    params ["_suicider"];

    [_suicider, btc_player_side, 10, selectRandom [1, 2], false] call ace_zeus_fnc_moduleSuicideBomber;
}, [_suicider], 2] call CBA_fnc_waitAndExecute;

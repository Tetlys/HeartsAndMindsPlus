
/* ----------------------------------------------------------------------------
Function: btc_mil_fnc_unit_killed

Description:
    Fill me when you edit me !

Parameters:
    _unit - Object the event handler is assigned to. [Object]
    _killer - Object that killed the unit. Contains the unit itself in case of collisions. [Object]
    _instigator - Person who pulled the trigger. [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_mil_fnc_unit_killed;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

if (isPlayer _instigator) then {
_uid = getplayerUID _instigator;
["KILL", _uid, _unit] call tet_ui_setdatascore;
};

if (side group _unit isNotEqualTo btc_enemy_side) exitWith {};

if (random 100 > btc_info_intel_chance) then {
    _unit setVariable ["intel", true];
};


if (isPlayer _instigator) then {
    private _repValue = btc_rep_bonus_mil_killed;
    if (
        _unit getVariable ["ace_captives_isHandcuffed", false] ||
        _unit getVariable ["ace_captives_isSurrendering", false]
    ) then {
        if (_causeOfDeath isNotEqualTo "CardiacArrest:Bleedout") then {
            _repValue = btc_rep_malus_mil_killed;
            private _name = name _instigator;
            [
                [
                    format ["%1 has committed a war crime by killing a POW!", _name]
                ]
            ] remoteExec ["CBA_fnc_notify", 0];
        };
    };
    [_repValue, _instigator] call btc_rep_fnc_change;

    //ECONOMY
    [west, 1, false] call acex_fortify_fnc_updateBudget;
    btc_global_economy = btc_global_economy + 1;
};

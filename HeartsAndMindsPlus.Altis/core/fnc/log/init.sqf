
/* ----------------------------------------------------------------------------
Function: btc_log_fnc_init

Description:
    Fill me when you edit me !

Parameters:
    _obj - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_log_fnc_init;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_obj", objNull, [objNull]]
];

if (btc_log_obj_created pushBackUnique _obj isEqualTo -1) exitWith {};

{
    _x addCuratorEditableObjects [[_obj], false];
} forEach allCurators;

if (isNil {_obj getVariable "btc_EDEN_defaultFuelCargo"}) then {
    _obj setVariable ["btc_EDEN_defaultFuelCargo", _obj call ace_refuel_fnc_getFuel, true];
};
if (isNil {_obj getVariable "btc_EDEN_defaultSupply"}) then {
    _obj setVariable ["btc_EDEN_defaultSupply", _obj call ace_rearm_fnc_getSupplyCount, true];
};

_type = typeOf _obj; 
if (_type in btc_log_def_loadable) then {
    [_obj, round ((sizeOf _type)/1.5)] call ace_cargo_fnc_setSize;
};
if (_type in btc_log_def_can_load) then {
    [_obj, round ((sizeOf _type)*1.5)] call ace_cargo_fnc_setSpace;
};

if (_type in btc_supplies_cargo) then {
    [_obj] call tet_fortify_fill;
};
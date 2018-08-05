params ["_unit", "_order", "_wp_pos"];

private _group = group _unit;

if (_order isEqualTo (_unit getVariable ["order", 0])) exitWith {};

_unit setVariable ["order", _order];

if (_unit isEqualTo vehicle _unit) then {
    [_group] call CBA_fnc_clearWaypoints;
};

private _behaviour = behaviour _unit;

switch (_order) do {
    case 1 : {
        _unit setBehaviour selectRandom ["CARELESS", _behaviour];
        doStop _unit;
    };
    case 2 : {
        doStop _unit;
        [_unit, "", 2] call ace_common_fnc_doAnimation;
        _unit setUnitPos "DOWN";
    };
    case 3 : {
        _unit setUnitPos "UP";
        _unit doMove _wp_pos;
    };
    case 4 : {
        _unit doMove _wp_pos;
    };
};

if (_order isEqualTo 4) then {
    waitUntil {sleep 3; (isNull _unit || !alive _unit || (_unit inArea [_wp_pos, 10, 10, 0, false]))};
} else {
    waitUntil {sleep 3; (isNull _unit || !alive _unit || (count (getPos _unit nearEntities ["SoldierWB", 50]) isEqualTo 0))};
};

if (isNull _unit || !alive _unit) exitWith {};

if (_order isEqualTo 4) then {
    doStop _unit;
    sleep (30 + random 10);
};

_unit setVariable ["order", nil];
_unit setUnitPos "AUTO";
_unit setBehaviour _behaviour;
_unit doMove getPos _unit;

if (_unit isEqualTo vehicle _unit) then {
    [_group] call btc_fnc_civ_addWP;
};

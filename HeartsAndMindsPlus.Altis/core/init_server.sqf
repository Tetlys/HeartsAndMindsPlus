[] call compileScript ["core\fnc\city\init.sqf"];

//["Initialize"] call BIS_fnc_dynamicGroups;
setTimeMultiplier btc_p_acctime;

["btc_m", -1, objNull, "", false, false] call btc_task_fnc_create;
[["btc_dft", "btc_m"], 0] call btc_task_fnc_create;
[["btc_dty", "btc_m"], 1] call btc_task_fnc_create;

if (btc_db_load && {profileNamespace getVariable [format ["btc_hm_%1_db", worldName], false]}) then {
    if ((profileNamespace getVariable [format ["btc_hm_%1_version", worldName], 1.13]) in [btc_version select 1, 22.1, 23]) then {
        [] call compileScript ["core\fnc\db\load.sqf"];
    } else {
        [] call compileScript ["core\fnc\db\load_old.sqf"];
    };
} else {
    if (btc_hideout_n > 0) then {
        for "_i" from 1 to btc_hideout_n do {[] call btc_hideout_fnc_create;};
    } else {
        [] spawn btc_fnc_final_phase;
    };
    
    [] call btc_cache_fnc_init;

    btc_startDate set [3, btc_p_time];
    setDate btc_startDate;

    {
        _x call btc_veh_fnc_add;
    } forEach (getMissionLayerEntities "btc_vehicles" select 0);
    if (isNil "btc_vehicles") then {btc_vehicles = [];};
};

[] call btc_eh_fnc_server;
[btc_ied_list] call btc_ied_fnc_fired_near;
[] call btc_chem_fnc_checkLoop;
[] call btc_chem_fnc_handleShower;
[] call btc_spect_fnc_checkLoop;
[] call btc_db_fnc_autoRestartLoop;

{
    [_x, 30] call btc_veh_fnc_addRespawn;
    if (_forEachIndex isEqualTo 0) then {
        missionNamespace setVariable ["btc_veh_respawnable_1", _x, true];
    };
} forEach (getMissionLayerEntities "btc_veh_respawnable" select 0);
if (isNil "btc_veh_respawnable") then {btc_veh_respawnable = [];};

if (btc_p_side_mission_cycle > 0) then {
    for "_i" from 1 to btc_p_side_mission_cycle do {
        [true] spawn btc_side_fnc_create;
    };
};

{
    ["btc_tag_remover" + _x, "STR_BTC_HAM_ACTION_REMOVETAG", _x, ["#(rgb,8,8,3)color(0,0,0,0)"], "\a3\Modules_F_Curator\Data\portraitSmoke_ca.paa"] call ace_tagging_fnc_addCustomTag;
} forEach ["ACE_SpraypaintRed"];

if (
    btc_p_respawn_ticketsShare &&
    {btc_p_respawn_ticketsAtStart >= 0}
) then {
    private _tickets = btc_respawn_tickets getOrDefault [btc_player_side, btc_p_respawn_ticketsAtStart];
    if (_tickets isEqualTo 0) then {
        _tickets = -1;
    };
    [btc_player_side, _tickets] call BIS_fnc_respawnTickets;
};

//MAP MARKERS
{ 
    if (_y getVariable ["marker", ""] != "") then { 
        deleteMarker (_y getVariable ["marker", ""]); 
    }; 

    private _type = _y getVariable ["type", ""];
    private _cachingRadius = _y getVariable ["cachingRadius", 500]; 
    private _marker = createMarker [format ["city_%1", position _y], position _y]; 
    private _name = _y getVariable ["name",""]; //  _marker setMarkerText _name;

    (switch _type do {
        case "Hill" : {_marker setMarkerType "o_unknown";};
        case "VegetationFir" : {_marker setMarkerType "o_unknown";};
        case "BorderCrossing" : {_marker setMarkerType "o_unknown";};
        case "NameLocal" : {_marker setMarkerType "o_installation";};
        case "StrongpointArea" : {_marker setMarkerType "o_art";};
        case "NameVillage" : {_marker setMarkerType "o_inf";};
        case "NameCity" : {_marker setMarkerType "o_med";};
        case "NameCityCapital" : {_marker setMarkerType "o_motor_inf";};
        case "Airport" : {_marker setMarkerType "o_air";};
        case "NameMarine" : {_marker setMarkerType "o_naval";};
        case "VegetationVineyard" : {_marker setMarkerType "o_unknown";};
        case "Strategic" : {_marker setMarkerType "o_art";};
        default {_marker setMarkerType "o_unknown";};
    });

// OPTION A: Markers have to be investigated
    _marker setMarkerColor "ColorCIV";

// OPTION B: Markers stay correct color
    //if (_y getVariable ["occupied", false]) then { 
    //    _marker setMarkerColor "colorOPFOR";  // CONFIG OBJ Colors - MAIN MARKERS
    //} else {
    //    _marker setMarkerColor "colorBLUFOR";  // CONFIG OBJ Colors - MAIN MARKERS
    //};

    _marker setMarkerAlpha 0.5;
    _marker setMarkerSize [0.8,0.8];
    _y setVariable ["marker", _marker]; 
    
} forEach btc_city_all;

if isServer then
{
	[] spawn
	{
		while {true} do
		{
			{
				_x addCuratorEditableObjects [allPlayers, true];
                _x addCuratorEditableObjects [btc_vehicles, true];
                _x addCuratorEditableObjects [btc_veh_respawnable, true];
			} count allCurators;
        sleep 60;
		};
	};
};

if isServer then
{
	[] spawn
	{
		while {true} do
		{
        publicVariable "btc_global_economy";
        publicVariable "btc_global_reputation";
        publicvariable "BTC_PLAYER_array";
        publicvariable "BTC_UID_array";
        sleep 10;
		};
	};
};



//Object Protector
if isServer then
{
	[] spawn
	{
		while {true} do
		{
			{
				_x removeCuratorEditableObjects [[btc_create_object_point, btc_create_object, btc_gear_object],true]
			} count allCurators;
        sleep 0.25;
		};
	};
};
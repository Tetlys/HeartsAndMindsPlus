
/* ----------------------------------------------------------------------------
Function: tet_ui_init

Description:
    Initiates the UI database

Parameters:


Returns:

Examples:
    (begin example)
        _result = [] call tet_ui_init
    (end)

Author:
    Tetlys

---------------------------------------------------------------------------- */
// Change the 0 to a 1 to enable by default
// NAME, BUILD, SALVAGE, COMMAND, DEATHS, CIV KILLS, MAN KILLS, VEHICLE KILLS, AIR KILLS, BOAT KILLS, REPEFFECT, airperms, tankperms
// [_name,"0:0:0:0:0:0:0:0:0:0:0:0"]

params ["_player"];

_UID = getplayeruid _player; 
_NAME = name _player;
_UIDARRAY = keys BTC_UID_array;
_OUTPUT = [_name,"0:1:0:0:0:0:0:0:0:0:0:0"] joinstring ":";
_ALLKEYS = keys BTC_UID_array;   
_KEYCOUNT = count _ALLKEYS;

_USERKEY = [_UID] call tet_ui_KEY;

_PlayerData = BTC_Player_array getOrDefault [_USERKEY, _OUTPUT, true];
_PlayerUID = BTC_UID_array getOrDefault [_USERKEY, _UID, true];

_index = _PlayerData splitstring ":";

_NAME = _index select 0;
_BUILDPERM = _index select 1;
_SALVAGEPERM = _index select 2;
_COMMANDPERM = _index select 3;
_MANKILLS = _index select 4;
_VICKILLS = _index select 5;
_AIRKILLS = _index select 6;
_SEAKILLS = _index select 7;
_CIVKILLS =  _index select 8;
_DEATHS = _index select 9;
_REPUTATION3 = _index select 10;
_FLIGHTPERM = _index select 11;
_ARMOURPERM = _index select 12;


_player setVariable ["interpreter",true];

if (parseNumber _BUILDPERM == 1) then {_player setVariable ["allow_build",true];};
if (parseNumber _SALVAGEPERM == 1) then {_player setVariable ["allow_salvage",true];};
if (parseNumber _COMMANDPERM == 1) then {_player setVariable ["side_mission",true]; _player setVariable ["APW_initAddaction",true]; [_player,"initPlayer"] call APW_fnc_APWMain;};
if (parseNumber _FLIGHTPERM == 1) then {_player setVariable ["allow_flight",true];};
if (parseNumber _ARMOURPERM == 1) then {_player setVariable ["allow_armour",true];};

publicvariable "BTC_PLAYER_array";
publicvariable "BTC_UID_array"; 
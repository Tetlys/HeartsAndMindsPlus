btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        _location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_respawn_fnc_intro;
[] call btc_int_fnc_shortcuts;
[] call btc_lift_fnc_shortcuts;

[{!isNull player}, {
    [] call compileScript ["core\doc.sqf"];
    execVM "core\fnc\common\empty_vehicles_marker.sqf";
    
    btc_respawn_marker setMarkerPosLocal player;
    player addRating 9999;
    //["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

    [player] call btc_eh_fnc_player;

    // ARSNEAL SCRIPTS
    private _arsenal_trait = player call btc_arsenal_fnc_trait;
    if (btc_p_arsenal_Restrict isEqualTo 3) then {
        [_arsenal_trait select 1] call btc_arsenal_fnc_weaponsFilter;
    };
    [] call btc_int_fnc_add_actions;

    if (player getVariable ["interpreter", false]) then {
        player createDiarySubject ["btc_diarylog", localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG", '\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa'];
    };

    // CAS SCRIPT
    Private _UnitRole = roleDescription player;
    if (_UnitRole == "Squad Leader") then {
    player setVariable ["APW_initAddaction",true];
    [player,"initPlayer"] call APW_fnc_APWMain;
    };


    switch (btc_p_autoloadout) do {
        case 1: {
            player setUnitLoadout ([_arsenal_trait select 0] call btc_arsenal_fnc_loadout);
        };
        case 2: {
            removeAllWeapons player;
        };
        default {
        };
    };

    [] call btc_respawn_fnc_screen;

    if (btc_debug) then {
        addMissionEventHandler ["MapSingleClick", {
            params ["_units", "_pos", "_alt", "_shift"];
            if (
                alive player &&
                !_alt &&
                !_shift
            ) then {
                vehicle player setPos _pos;
            };
        }];
        player allowDamage false;

        [{!isNull (findDisplay 12)}, {
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_debug_fnc_marker];
        }] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_waitUntilAndExecute;

// PLAYER HUD
[] spawn
	{
		while {true} do
		{
            // Define the UI number 

            _myNumber = [west] call acex_fortify_fnc_getBudget;
            _CurrentPlayers = count allPlayers; 
            
            // Get the display and create a new control for the HUD item 
            _myDisplay = uiNamespace getVariable "RscDisplayMission"; 
            _myHudControl = _myDisplay ctrlCreate ["RscText", 69420]; 
            _myHudControl ctrlSetFont "PuristaSemiBold";
            _myHudControl ctrlSetTextColor [1,1,1,1]; 
            
            // Update the HUD item with the latest UI number 
            _myHudControl ctrlSetText format ["Online Players : %2 | Current Funds : $%1 | Current Rep : %3", _myNumber, _currentplayers, btc_global_reputation]; 
            //_myHudControl ctrlSetStructuredText parseText format["<t align='center'>Online Players : %2 | Current Funds : $%1 | Current Rep : %3</t>", _myNumber, _currentplayers, btc_global_reputation];
            _hudX = safeZoneX + 0.35 * safeZoneW; 
            _hudY = safeZoneY; 
            _hudW = safeZoneW * 0.5;
            _hudH = safeZoneH / 40;
            
            // Set the position and size of the HUD item 
            _myHudControl ctrlSetPosition [_hudX, _hudY, _hudW, _hudH]; 
            //_myHudControl ctrlSetBackgroundColor [0, 0, 0, 0.5];  // black background with 50% transparency 
            _myHudControl ctrlCommit 0; 
            _myHudControl ctrlSetShadow 2;

            // Show the HUD item 
            _myHudControl ctrlShow true;

            //SLEEP  CHANGE TO 15/30/60
            sleep 5;

            // Clear the existing HUD item
            _display = uiNamespace getVariable "RscDisplayMission";
            ctrlDelete (_display displayctrl 69420);
	    };
};

btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        //_location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_respawn_fnc_intro;
[] call btc_int_fnc_shortcuts;
[] call btc_lift_fnc_shortcuts;
[] remoteExecCall ["tet_fortify_progress", [2]];

[{!isNull player}, {

// MOD CHECKER 

/*
CODE TO COLLECT MOD HASHES AND NAMES FROM THE LOADED MODS, REQUIRED MODS, AND OPTIONAL MODS (Run local in debug).

 private _mods = (getLoadedModsInfo select { 
    !(_x select 2) && 
    (_x select 5) != "" 
}) apply { 
    [_x select 5, _x select 0] 
}; 
 
_mods

*/
tet_requiredmods = [
    ["22dc683ee7645369b375f5d3a2db51a995658245", "RHS: United States Forces"],
    ["c099f9533a1d61a33bef449594ec01c28661aa62", "RHS: Armed Forces of the Russian Federation"],
    ["191c55263683942147a8ee29b5429d08b598cff4", "Community Base Addons v3.19.0"],
    ["40a576a45eb2d629a9fc05ba543bf905933ce741", "RHS: Serbian Armed Forces"],
    ["d45628bb1168a22a9554c18f8c1458615546af9a", "RHS: GREF"],
    ["b1f79d14fb9d22ed2932595337ba5bf283e4578a", "Advanced Combat Environment 3.21.2"],
    ["e34d59ccbe4cbc59548fec00db4d9cf4979b227f", "CUP Terrains - Core 1.19.3"],
    ["11e2851ba4154d181b57602ebaf0c2c5a8cda84a", "CUP Terrains - Maps 1.16.0"],
    ["fbc1f582c89f11919f9c6ead5d842e6c1aea9b71", "Enhanced Movement"],
    ["e63593dc680abfeeafdc3a5d7d82283a15a48307", "3CB Factions"],
    ["3406e0e8623ef504603dca555775474c6bf83cac", "KAT - Advanced Medical"],
    ["159d9ecca032db4ab5861ff6f9ddb6575097ddfa", "@AI avoids prone"],
    ["ff6e6b2693092b1318010caca04d09e3bf3e9bfa", "@CH View Distance"],
    ["435814883f25ef55474bfe15ac9ebe0dc0cd1780", "cTab - Blue Force Tracking"],
    ["6a00a0ebb5914b10dbb11ae5292e72c13a0d18a2", "DUI - Squad Radar 1.13.1"],
    ["a8b887cc1478eefd7f46f1bb070e0ac8c5ff2a19", "@HeartsAndMindsPlusCompat"],
    ["b87f16fa85a76c4522fe0fe67521f1ab4a7a7fb0", "VET_Unflipping - 1.3.2"],
    ["c9534405bd69ef0a15ab21a36a4ae74df2b5a0bc", "@Immerse"],
    ["7bc28870b81381e659f4d276fc427f2c5984b059", "@Suppress"],
    ["a61552f15b089dd008af93546a21201149fcb5e8", "Zeus Enhanced 1.15.1"],
    ["b17c4a5da26303c1e9234e237259dec5cb5adb40", "TFAR"],
    ["8bf1a91aa4c72d994113cb594e0e57d03fab4f53", "Enhanced Movement Rework"],
    ["c17cc6b1041cc67ee556e4db2d476a40a5d06b0a", "Gruppe Adler Trenches"],
    ["5b2e30cf6c886e4750c23ae131a2a8fd34db261f", "BackpackOnChestRedux"],
    ["cdfb88d6af2188d551e08fd029a54ff2abbc3788", "ACSTG AI Cannot See Through Grass"],
    ["883ad1d73304141eb4bd02e18124f34e38e3ad7d", "Alternative Running"],
    ["915d3cf265b56c3d989b3a2f8e24e733b95c06c7", "@ILBE Assault Pack - Rewrite"],
    ["b97b5af68d9edc0420fd12c0de08aa1ee160788a", "Freestyles Crash Landing"],
    ["4db3ee0e57f02fb58d5519ec13463c2b1756e137", "M224 60mm Mortar (ACE)"],
    ["fc609b445956b7156470911fb884b968879e789f", "3den Enhanced v8.8.3"],
    ["d21f10f9205a2236d6c0b2ce3975dd0048b4e6c0", "LAMBS Suppression"],
    ["8780fa217bf5791806c07cb5b8ed11db8cbb43e8", "LAMBS RPG"],
    ["cabec9c28e83633870177ff61314ef004e79f6e4", "@@75th_Ranger_Regiment_Light_Independence_Package"],
    ["994f101842636b158ad082197ed6348b9f1cf705", "@Goon's Toons"],
    ["90f74ba4565b9fdc6c77260500e33626c81071c0", "@G.O.S Al Rayak"],
    ["06d116f091ec9d10db5bc0fd67ee4c587c988edd", "BRF Faction Pack"],
    ["0462ee5ca5b707354b4fdaf085b619894b0a431f", "TLB Interactions"]
];

tet_optionalmods = [
    ["07f27b642dc965a159997583bba5b8d65dd92f8f", "Better Inventory"],
    ["a21b60c0982eaf6f271f9297002e60f650b36e6f", "BettIR Nightivision"],
    ["874166cd6f15f09a81be820779b3f43d34c3d814", "@Blastcore Murr Edition"],
    ["0bae37ad7c7529e5bd577ba55d8b64f58e34966c", "@Turret Enhanced"],
    ["1b2150d92c725570e88bc6fd51ae7f16ba20e8cf", "Fawks' Enhanced NVGs"],
    ["29da0bc1b2084c08cba724b3233b379ef05cdfd6", "Enhanced Map Ace Version"],
    ["3e5fdda876e51fb920d5281e9d299a8de0d1064f", "@A3 Thermal Improvement"],
    ["fa8db044c2449f15ef7c800065e1ea8eea6c7d41", "@Enhanced Soundscape"],
    ["0735646b6b0a8984ec7b1d410ec79a42972f4960", "@Simple MapTools"],
    ["4cfe87e9086ce0306dcaed4952b0963ff72fcedc", "@Reduced Haze Mod v3.1"],
    ["9c9eb99eb843419b064cd0c5023abd6a8371e74c", "Enhanced GPS"],
    ["34ac3216a87075b9e7cbe6c7386f983cc0e7b991", "Reactive Building Effects PLUS"],
    ["ca1f0b8bc75e193da9a6ef7026b93fadc9d19e7d", "JSRS Soundmod 2025 - Version 4.0.0.12"],
    ["7254b966e432a9ac91b373200d94efc54f951f8f", "A3 Additional Measurements"],
    ["7789a7bf631f51e59c971409e5a466f20ee97acd", "ANZACSAS Enhanced Missile Smoke and Lighting Efx Mod 1.4"],
    ["873f66628150d9a256c7f098a8e53e8f69f901fa", "@Cinematic Lens Flare"],
    ["9752c20582507303c182bcde44d368abb89ee31b", "PDB"],
    ["65e427230e61c8caed49e14f6437093db7940eac", "ReColor"],
    ["453cde79b35716d708ea579a5fbe2b6896cc08c0", "PDD"],
    ["4a84cb1f1af19b20e0fe99bda3438bc7c24cb21c", "GPS Route Plotter PLUS"],
    ["26388a776a69542b979f4416e59b0cbc6417745b", "@Turret Enhanced Plus"],
    ["879086d09e4c28ff876f80081784e41f382ab621", "@「RSS」 Immersive Hud"]
];


private _loadedMods = (getLoadedModsInfo select {
    !(_x select 2)
}) apply {
    [_x select 5, _x select 0]
};

private _loadedHashes = _loadedMods apply {
    _x select 0
};

private _requiredHashes = tet_requiredmods apply {
    _x select 0
};

private _optionalHashes = tet_optionalmods apply {
    _x select 0
};

private _missingMods = tet_requiredmods select {
    !((_x select 0) in _loadedHashes)
};

private _disallowedMods = _loadedMods select {
    !((_x select 0) in _requiredHashes) &&
    !((_x select 0) in _optionalHashes)
};

if (count _missingMods > 0 || count _disallowedMods > 0) then {
    private _message = "The following mod issues were detected:";

    if (count _missingMods > 0) then {
        private _missingNames = _missingMods apply {
            _x select 1
        };

        _message = _message + "<br/><br/><t color='#ff0000'>MISSING REQUIRED MODS:</t><br/>" + (_missingNames joinString "<br/>");
    };

    if (count _disallowedMods > 0) then {
        private _disallowedNames = _disallowedMods apply {
            _x select 1
        };

        _message = _message + "<br/><br/><t color='#ff0000'>DISALLOWED MODS:</t><br/>" + (_disallowedNames joinString "<br/>");
    };

    [_message, "MOD CHECK FAILED"] spawn BIS_fnc_guiMessage;

    private _issueMods = _disallowedMods + _missingMods;

    diag_log format [
    "[MOD CHECK FAILED] The following mod issues were detected: %1",
    _issueMods joinString ", "
    ];

    [] spawn {
        sleep 10;
        ["", "END1"] call BIS_fnc_endMission;
    };

} else {
    [] spawn {
    sleep 10;
    ["SERVER", "All required mods found. Welcome!"] call BIS_fnc_showSubtitle;
};

};

    [] call compileScript ["core\doc.sqf"];
    execVM "core\fnc\common\empty_vehicles_marker.sqf";
    
    btc_respawn_marker setMarkerPosLocal player;
    player addRating 9999;

    //PERMISSIONS
    player addEventHandler ["GetInMan", {[_this select 2] call tet_perms;}];
    player addEventHandler ["SeatSwitchedMan", {[_this select 2] call tet_perms;}];

    //UI
    [player] call tet_ui_init;

    // ACTIONS
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

    // PLAYER HUD
[] spawn
	{
		while {true} do
		{

            // Add a check for "hud enabled" variable on a player, allow player to set variable with radio scrolls

            // Define the UI number 

            _myNumber = [west] call acex_fortify_fnc_getBudget;
            _CurrentPlayers = 0; 
            {if (isPlayer _x) then {_CurrentPlayers = _CurrentPlayers +1;};}forEach allUnits;
            
            // Get the display and create a new control for the HUD item 
            _myDisplay = uiNamespace getVariable "RscDisplayMission"; 
            _myHudControl = _myDisplay ctrlCreate ["RscText", 69420]; 
            _myHudControl ctrlSetFont "PuristaSemiBold";
            _myHudControl ctrlSetTextColor [1,1,1,1]; 
            
            _respawnTickets = [player, nil, true] call BIS_fnc_respawnTickets;

            // IF NOT USING TICKETS USE THE FOLLOWING:

            // _myHudControl ctrlSetText format ["Online Players : %2 | Current Funds : $%1", _myNumber, _CurrentPlayers];
            // _hudX = safeZoneX + 0.4 * safeZoneW;
            // _hudY = safeZoneY; 
            // _hudW = safeZoneW * 0.4;
            // _hudH = safeZoneH / 40;
            
            // END

            // IF USING TICKETS USE THE FOLLOWING: 

            _myHudControl ctrlSetText format ["Online Players : %2 | Current Funds : $%1 | Player Tickets : %3", _myNumber, _currentplayers, _respawnTickets]; 
            
            _hudX = safeZoneX + 0.36 * safeZoneW;
            _hudY = safeZoneY; 
            _hudW = safeZoneW * 0.5;
            _hudH = safeZoneH / 40;
            
            // END
            
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
            true
	    };
};


}] call CBA_fnc_waitUntilAndExecute;



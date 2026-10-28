
btc_version = [
    1,
    22.1,
    8
];
diag_log format (["HEARTS AND MINDS PLUS VERSION %1.%2.%3"] + btc_version);

//Param
//<< Time options >>
btc_p_time = "btc_p_time" call BIS_fnc_getParamValue;
btc_p_acctime = "btc_p_acctime" call BIS_fnc_getParamValue;
btc_db_load = ("btc_p_load" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_auto_db = "btc_p_auto_db" call BIS_fnc_getParamValue isEqualTo 1;
btc_p_db_autoRestartTime = "btc_p_db_autoRestartTime" call BIS_fnc_getParamValue;
btc_p_db_autoRestartHour = [
    "btc_p_db_autoRestartHour1" call BIS_fnc_getParamValue,
    "btc_p_db_autoRestartHour2" call BIS_fnc_getParamValue
];
btc_p_db_autoRestartType = "btc_p_db_autoRestartType" call BIS_fnc_getParamValue;
btc_p_slot_isShare = "btc_p_slot_isShare" call BIS_fnc_getParamValue isEqualTo 1;
btc_p_change_time = ("btc_p_change_time" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_change_weather = ("btc_p_change_weather" call BIS_fnc_getParamValue) isEqualTo 1;


//<< Respawn options >>
btc_p_respawn_location = "btc_p_respawn_location" call BIS_fnc_getParamValue;
btc_p_respawn_fromFOBToBase = ("btc_p_respawn_fromFOBToBase" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_rallypointTimer = "btc_p_rallypointTimer" call BIS_fnc_getParamValue;
btc_p_respawn_arsenal = ("btc_p_respawn_arsenal" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_respawn_ticketsAtStart = "btc_p_respawn_ticketsAtStart" call BIS_fnc_getParamValue;
btc_p_respawn_ticketsLost = 1 - ("btc_p_respawn_ticketsLost" call BIS_fnc_getParamValue);
btc_p_respawn_ticketsShare = ("btc_p_respawn_ticketsShare" call BIS_fnc_getParamValue) isEqualTo 0;
btc_p_respawn_ticketsFromPrisoners = "btc_p_respawn_ticketsFromPrisoners" call BIS_fnc_getParamValue;
btc_p_body_timeBeforeShowMarker = ("btc_p_body_timeBeforeShowMarker" call BIS_fnc_getParamValue) * 60;

//<< Faction options >>
private _p_en = "btc_p_en" call BIS_fnc_getParamValue;
private _p_en_AA = ("btc_p_AA" call BIS_fnc_getParamValue) isEqualTo 1;
private _p_en_tank = ("btc_p_tank" call BIS_fnc_getParamValue) isEqualTo 1;
private _p_civ = "btc_p_civ" call BIS_fnc_getParamValue;
private _p_civ_veh = "btc_p_civ_veh" call BIS_fnc_getParamValue;

//<< IED options >>
btc_p_ied = ("btc_p_ied" call BIS_fnc_getParamValue)/2;
private _p_ied_spot = "btc_p_ied_spot" call BIS_fnc_getParamValue;
btc_p_ied_placement = "btc_p_ied_placement" call BIS_fnc_getParamValue;
btc_p_ied_drone = ("btc_p_ied_drone" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_ied_power = "btc_p_ied_power" call BIS_fnc_getParamValue;

//<< Hideout/Cache options >>
btc_hideout_n = "btc_p_hideout_n" call BIS_fnc_getParamValue;
btc_info_cache_def = "btc_p_cache_info_def" call BIS_fnc_getParamValue;
btc_info_cache_ratio = "btc_p_cache_info_ratio" call BIS_fnc_getParamValue;
btc_info_intel_chance = "btc_p_info_chance" call BIS_fnc_getParamValue;
btc_p_info_houseDensity = "btc_p_info_houseDensity" call BIS_fnc_getParamValue;

//<< Skill options >>
btc_p_set_skill  = ("btc_p_set_skill" call BIS_fnc_getParamValue) isEqualTo 1;
btc_AI_skill = [
    ("btc_p_set_skill_general" call BIS_fnc_getParamValue)/10,//general
    ("btc_p_set_skill_aimingAccuracy" call BIS_fnc_getParamValue)/10,//aimingAccuracy
    ("btc_p_set_skill_aimingShake" call BIS_fnc_getParamValue)/10,//aimingShake
    ("btc_p_set_skill_aimingSpeed" call BIS_fnc_getParamValue)/10,//aimingSpeed
    ("btc_p_set_skill_endurance" call BIS_fnc_getParamValue)/10,//endurance
    ("btc_p_set_skill_spotDistance" call BIS_fnc_getParamValue)/10,//spotDistance
    ("btc_p_set_skill_spotTime" call BIS_fnc_getParamValue)/10,//spotTime
    ("btc_p_set_skill_courage" call BIS_fnc_getParamValue)/10,//courage
    ("btc_p_set_skill_reloadSpeed" call BIS_fnc_getParamValue)/10,//reloadSpeed
    ("btc_p_set_skill_commanding" call BIS_fnc_getParamValue)/10//commanding
];

//<< Spawn options >>
btc_p_density_of_occupiedCity = ("btc_p_density_of_occupiedCity" call BIS_fnc_getParamValue)/100;
btc_p_mil_group_ratio = ("btc_p_mil_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_mil_wp_houseDensity = ("btc_p_wp_houseDensity" call BIS_fnc_getParamValue)/100;
btc_p_mil_static_group_ratio = ("btc_p_mil_static_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_civ_group_ratio = ("btc_p_civ_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_animals_group_ratio = ("btc_p_animals_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_veh_armed_ho = ("btc_p_veh_armed_ho" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_veh_armed_spawn_more = ("btc_p_veh_armed_spawn_more" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_patrol_max = "btc_p_patrol_max" call BIS_fnc_getParamValue;
btc_p_civ_max_veh = "btc_p_civ_max_veh" call BIS_fnc_getParamValue;

//<< Gameplay options >>
btc_p_sea = ("btc_p_sea" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_chem = ("btc_p_chem" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_spect = ("btc_p_spect" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_side_mission_cycle = "btc_p_side_mission_cycle" call BIS_fnc_getParamValue;

//<< Arsenal options >>
btc_p_arsenal_Type = "btc_p_arsenal_Type" call BIS_fnc_getParamValue;
btc_p_arsenal_Restrict = "btc_p_arsenal_Restrict" call BIS_fnc_getParamValue;
btc_p_garage = ("btc_p_garage" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_autoloadout = "btc_p_autoloadout" call BIS_fnc_getParamValue;

//ECONOMY
btc_global_economy = 0;

//<< Other options >>
btc_global_reputation = "btc_p_rep" call BIS_fnc_getParamValue;
btc_p_rep_notify = "btc_p_rep_notify" call BIS_fnc_getParamValue;
btc_city_radiusOffset = ("btc_p_city_radiusOffset" call BIS_fnc_getParamValue) * 100;
btc_p_trigger = if (("btc_p_trigger" call BIS_fnc_getParamValue) isEqualTo 1) then {
    "this && (false in (thisList apply {_x isKindOf 'Plane'})) && (false in (thisList apply {(_x isKindOf 'Helicopter') && ((getPosATL _x) select 2 > 100)})) && (false in (thisList apply {(_x isKindOf 'Helicopter') && (speed _x > 100)}))"
} else {
    "this"
};
private _p_city_free_trigger = "btc_p_city_free_trigger" call BIS_fnc_getParamValue;
btc_p_flag = "btc_p_flag" call BIS_fnc_getParamValue;
btc_p_debug = "btc_p_debug" call BIS_fnc_getParamValue;

switch (btc_p_debug) do {
    case 0 : {
        btc_debug_log = false;
        btc_debug = false;
    };
    case 1 : {
        btc_debug_log = true;
        btc_debug = true;
        btc_debug_graph = false;
        btc_debug_frames = 0;
    };
    case 2 : {
        btc_debug_log = true;
        btc_debug = false;
    };
};

if (!isMultiplayer) then {
    btc_debug_log = true;
    btc_debug = true;
    btc_debug_graph = false;
    btc_debug_frames = 0;
};

private _cfgVehicles = configFile >> "CfgVehicles";
private _allClassVehicles = ("true" configClasses _cfgVehicles) apply {configName _x};
private _allClassSorted = _allClassVehicles select {getNumber (_cfgVehicles >> _x >> "scope") isEqualTo 2};

if (isServer) then {
    btc_final_phase = false;
    btc_delay_time = 0;

    //City
    btc_city_blacklist = [];//NAME FROM CFG
    btc_p_city_free_trigger_condition = if (_p_city_free_trigger isEqualTo 0) then {
        "thisList isEqualTo []"
    } else {
        format ["[thisList, %1] call btc_city_fnc_trigger_free_condition", _p_city_free_trigger]
    };

    //Civ
    btc_civ_veh_active = [];

    //Database
    btc_db_serverCommandPassword = "btc_password"; //Define the same password in server.cfg like this: serverCommandPassword = "btc_password";
    btc_db_warningTimeAutoRestart = 10;
    btc_db_warningTimeAutoRestart1 = 30;
    btc_db_warningTimeAutoRestart2 = 60;

    //Hideout
    btc_hideout_cityID = []; // List of city ID visible in debug mode for custom hideout location
    btc_hideouts = []; publicVariable "btc_hideouts";
    btc_hideouts_radius = 800;
    if (btc_hideout_n isEqualTo 99) then {
        btc_hideout_n = round random 10;
    };
    btc_hideout_safezone = 4000;
    btc_hideout_range = 3500;
    btc_hideout_cap_time = 1800;
    btc_hideout_minRange = btc_hideout_range;

    //IED
    btc_ied_suic_time = 900;
    btc_ied_suic_spawned = - btc_ied_suic_time;
    btc_ied_offset = [0, -0.03, -0.07] select _p_ied_spot;
    btc_ied_list = [];
    btc_ied_range = 10;
    btc_ied_power = ["Bo_GBU12_LGB_MI10", "R_MRAAWS_HE_F"] select btc_p_ied_power;

    //FOB
    btc_fobs = [[], [], []];
    btc_fob_rallypointTimer = 60 * btc_p_rallypointTimer;
    btc_body_deadPlayers  = [];
    btc_log_points = [];
    publicVariable "btc_log_points";

    //Patrol
    btc_patrol_active = [];
    btc_patrol_area = 2000;

    //Rep
    btc_rep_militia_call_time = 600;
    btc_rep_militia_called = - btc_rep_militia_call_time;
    btc_rep_delayed = [0, []];

    //Chem
    btc_chem_decontaminate = [];
    btc_chem_contaminated = []; publicVariable "btc_chem_contaminated"; //Preserve reference

    //Spect
    btc_spect_emp = []; publicVariable "btc_spect_emp"; //Preserve reference

    //Cache
    btc_cache_type = [
        _allClassSorted select {
            _x isKindOf "ReammoBox_F" &&
            {getText(_cfgVehicles >> _x >> "model") isEqualTo "\A3\weapons_F\AmmoBoxes\AmmoBox_F"}
        },
        ["Land_PlasticCase_01_small_black_CBRN_F", "Land_PlasticCase_01_small_olive_CBRN_F", "Land_PlasticCase_01_small_CBRN_F"]
    ];
    private _weapons_usefull = "true" configClasses (configFile >> "CfgWeapons") select {
        getNumber (_x >> 'type') isEqualTo 1 &&
        {getArray (_x >> 'magazines') isNotEqualTo []} &&
        {getNumber (_x >> 'scope') isEqualTo 2}
    };
    btc_cache_weapons_type = _weapons_usefull apply {(toLower getText (_x >> "model")) select [1]};

    btc_type_sleepingbag_folded = _allClassSorted select {_x isKindOf "Land_Sleeping_bag_folded_F"};

    //Hideout classname
    btc_type_campfire = ["MetalBarrel_burning_F"] + (_allClassSorted select {_x isKindOf "Land_Campfire_F"});
    btc_type_Scrapyard = _allClassSorted select {
        _x isKindOf "Scrapyard_base_F" &&
        {!("scrap" in toLower _x)}
    };
    btc_type_bigbox = ["Box_FIA_Ammo_F", "Box_East_AmmoVeh_F", "CargoNet_01_box_F", "O_CargoNet_01_ammo_F"] + btc_type_Scrapyard;
    btc_type_seat = ["Land_WoodenLog_F", "Land_CampingChair_V2_F", "Land_CampingChair_V1_folded_F", "Land_CampingChair_V1_F"];
    btc_type_sleepingbag = _allClassSorted select {_x isKindOf "Land_Sleeping_bag_F"};
    btc_type_tent = ["Land_TentA_F", "Land_TentDome_F"] + (_allClassSorted select {
        _x isKindOf "Land_TentSolar_01_base_F" &&
        {!(_x isKindOf "Land_TentSolar_01_folded_base_F")}
    });
    btc_type_camonet = ["Land_IRMaskingCover_02_F"] + (_allClassSorted select {_x isKindOf "Shelter_base_F"});
    btc_type_satelliteAntenna = _allClassSorted select {_x isKindOf "Land_SatelliteAntenna_01_F"};

    //Side
    btc_side_ID = 0;
    btc_side_list = ["supply", "mines", "get_city", "tower",  "checkpoint", "hostage", "kill", "civtreatment", "EMP", "rescue", "hack", "removeRubbish","convoy", "capture_officer", "massacre"]; //, "vehicle"
    if (btc_p_sea) then {btc_side_list append ["civtreatment_boat", "underwater_generator"]}; // On sea
    if (btc_p_chem) then {btc_side_list append ["chemicalLeak", "pandemic"]};
    btc_side_list_use = [];
    btc_type_tower = ["Land_Communication_F", "Land_TTowerBig_1_F", "Land_TTowerBig_2_F"];
    btc_type_barrel = ["Land_GarbageBarrel_01_F", "Land_BarrelSand_grey_F", "MetalBarrel_burning_F", "Land_BarrelWater_F", "Land_MetalBarrel_F", "Land_MetalBarrel_empty_F"];
    btc_type_canister = ["Land_CanisterPlastic_F"];
    btc_type_pallet = ["Land_Pallets_stack_F", "Land_Pallets_F", "Land_Pallet_F"];
    btc_type_box = ["Box_East_Wps_F", "Box_East_WpsSpecial_F", "Box_East_Ammo_F"] + (btc_cache_type select 0);
    btc_type_generator = _allClassSorted select {_x isKindOf "Land_Device_assembled_F"};
    btc_type_storagebladder = _allClassSorted select {_x isKindOf "StorageBladder_base_F"};
    btc_type_mines = ["APERSMine", "APERSBoundingMine", "APERSTripMine"];
    btc_type_power = ["Land_PowerGenerator_F", "Land_PortableGenerator_01_F"];
    btc_type_cord = ["Land_ExtensionCord_F"];
    btc_type_cones = ["Land_RoadCone_01_F", "RoadCone_F", "RoadCone_L_F"];
    btc_type_fences = ["Land_PlasticNetFence_01_long_F", "Land_PlasticNetFence_01_long_d_F", "RoadBarrier_F", "TapeSign_F"];
    btc_type_barrier = ["Land_CncBarrier_stripes_F", "Land_CncBarrier_F"];
    btc_type_portable_light = _allClassSorted select {_x isKindOf "Land_PortableLight_single_F"};
    btc_type_portableLamp = _allClassSorted select {
        _x isKindOf "Land_PortableLight_02_base_F" ||
        {_x isKindOf "TentLamp_01_standing_base_F"}
    };
    btc_type_tentLamp = _allClassSorted select {_x isKindOf "TentLamp_01_base_F"};
    btc_type_first_aid_kits = ["Land_FirstAidKit_01_open_F", "Land_FirstAidKit_01_closed_F"];
    btc_type_body_bags = _allClassSorted select {
        _x isKindOf "Land_Bodybag_01_base_F" ||
        {_x isKindOf "Land_Bodybag_01_empty_base_F"} ||
        {_x isKindOf "Land_Bodybag_01_folded_base_F"}
    };
    btc_type_signs = _allClassSorted select {_x isKindOf "Land_Sign_Mines_F"};
    btc_type_bloods = _allClassSorted select {_x isKindOf "Blood_01_Base_F"};
    btc_type_medicals = _allClassSorted select {_x isKindOf "MedicalGarbage_01_Base_F"};
    btc_type_table = _allClassSorted select {_x isKindOf "Land_CampingTable_F"};
    btc_type_garbage = ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"];
    btc_type_foodSack = _allClassSorted select {_x isKindOf "Land_FoodSack_01_empty_base_F"};
    btc_type_PaperBox = _allClassSorted select {
        _x isKindOf "Land_PaperBox_01_small_ransacked_base_F" ||
        {_x isKindOf "Land_PaperBox_01_small_open_base_F"} ||
        {_x isKindOf "Land_PaperBox_01_small_destroyed_base_F"}
    };
    btc_type_EmergencyBlanket = _allClassSorted select {_x isKindOf "Land_EmergencyBlanket_01_base_F"};
    btc_type_Sponsor = _allClassSorted select {
        _x isKindOf "SignAd_Sponsor_F" &&
        {"idap" in toLower _x}
    };
    btc_type_PlasticCase = _allClassSorted select {_x isKindOf "PlasticCase_01_base_F"};
    btc_type_MedicalTent = _allClassSorted select {_x isKindOf "Land_MedicalTent_01_base_F"};
    btc_type_cargo_ruins = _allClassSorted select {
        _x isKindOf "Ruins_F" &&
        {
            "cargo40" in toLower _x ||
            "cargo20" in toLower _x
        }
    };
    btc_type_spill = ["Oil_Spill_F", "Land_DirtPatch_01_6x8_F"] + (_allClassSorted select {
        _x isKindOf "Land_DirtPatch_02_base_F" ||
        {_x isKindOf "WaterSpill_01_Base_F"}
    });
    btc_type_tarp = _allClassSorted select {_x isKindOf "Tarp_01_base_F"};
    btc_type_SCBA = _allClassSorted select {_x isKindOf "SCBACylinder_01_base_F"};
    btc_type_brush = _allClassSorted select {_x isKindOf "Brush_01_base_F"};
    btc_type_broom = _allClassSorted select {_x isKindOf "Broom_01_base_F"};
    btc_type_sponge = _allClassSorted select {_x isKindOf "Sponge_01_base_F"};
    btc_type_connectorTentClosed = _allClassSorted select {_x isKindOf "Land_ConnectorTent_01_closed_base_F"};
    btc_type_crossTent = _allClassSorted select {_x isKindOf "Land_ConnectorTent_01_cross_base_F"};
    btc_type_connectorTent = (_allClassSorted select {_x isKindOf "Land_ConnectorTent_01_base_F"}) - btc_type_connectorTentClosed - btc_type_crossTent;
    btc_type_cargoEMP = _allClassSorted select {_x isKindOf "Cargo_EMP_base_F"};
    btc_type_antenna = _allClassSorted select {_x isKindOf "OmniDirectionalAntenna_01_base_F"};
    btc_type_solarPanel = _allClassSorted select {_x isKindOf "Land_SolarPanel_04_base_F"};
    btc_type_sports = (_allClassSorted select {_x isKindOf "SportItems_base_F"}) select {"ball" in _x}; 
    btc_type_bottles = (_allClassSorted select {_x isKindOf "Items_base_F"}) select {"Bottle" in _x and (not ("stack" in _x))};
    // The two arrays below are prefixes of buildings and their multiplier.
    // They will multiply the values of btc_rep_malus_building_destroyed and btc_rep_malus_building_damaged,
    // if a building is not present here it will be multiplied by 1.0.
    // Use 0.0 to disable reputation hit on a specific's building destruction.
    // You can modify this for any other terrain, clearing the table will also make all buildings just have a 1.0 multiplier.
    // If there's a hit in btc_buildings_multiplier, btc_buildings_categories_multipliers will NOT be run
    btc_buildings_multipliers = [
        // Specific buildings that need to have a custom modifier.
        ["Wire", 0]
    ];

    // The multipliers are applied on top of each other, so "Chapel" and "Small" will both multiply the malus value
    btc_buildings_categories_multipliers = [
        ["Shed", 1], ["Slum", 1], ["Small", 0.5], ["Big", 1], ["Villa", 1], ["Main", 1], ["Tower", 1],
        ["HouseBlock", 1], ["Panelak", 1], ["Tenement", 1],
        ["Barn", 1], ["School", 1], ["Office", 1], ["Shop", 1], ["Store", 1], ["Hospital", 1],
        ["Castle", 1], ["Chapel", 1], ["Minaret", 1], ["Mosque", 1], ["Church", 1], ["Kostel", 1],
        ["Lighthouse", 1],
        ["Airport", 1], ["Hangar", 1], ["ControlTower", 1], ["Terminal", 1],
        ["Hopper", 1], ["Tank", 1], ["Factory", 1], ["Transformer", 1],
        ["FuelStation", 1],
        ["Barracks", 1],
        ["spp", 1], ["Powerstation", 1],
        ["Pump", 1]
    ];
    btc_buildings_changed = [];
    tet_buildings_changed = [];
    tet_limiter = false;

    //TAGS
    btc_type_tags = ["Land_Graffiti_01_F", "Land_Graffiti_02_F", "Land_Graffiti_03_F", "Land_Graffiti_04_F", "Land_Graffiti_05_F"];
    btc_type_tags_sentences = [
        "STR_BTC_HAM_TAG_GO",
        "STR_BTC_HAM_TAG_LN",
        "STR_BTC_HAM_TAG_WWKY",
        "STR_BTC_HAM_TAG_BA",
        "STR_BTC_HAM_TAG_GH",
        "STR_BTC_HAM_TAG_IE",
        "STR_BTC_HAM_TAG_DWY",
        "STR_BTC_HAM_TAG_WHY",
        "STR_BTC_HAM_TAG_YGD"
    ];
    btc_tags_player = [];
    btc_tags_server = [];

    //Flowers
    btc_type_flowers = _allClassSorted select {_x isKindOf "FlowerBouquet_base_F"};

    //IED
    private _ieds = ["Land_GarbageContainer_closed_F", "Land_GarbageContainer_open_F", "Land_Portable_generator_F", "Land_WoodenBox_F", "Land_BarrelTrash_grey_F", "Land_Sacks_heap_F", "Land_Wreck_Skodovka_F", "Land_WheelieBin_01_F", "Land_GarbageBin_03_F"] + btc_type_pallet + btc_type_barrel + (_allClassSorted select {
        _x isKindOf "GasTank_base_F" ||
        {_x isKindOf "Garbage_base_F"} ||
        {_x isKindOf "Stall_base_F"} ||
        {_x isKindOf "Market_base_F"} ||
        (_x isKindOf "Constructions_base_F" &&
        {
            "bricks" in toLower _x
        }) ||
        (_x isKindOf "Wreck_base_F" &&
        {
            "car" in toLower _x ||
            "offroad" in toLower _x
        })
    });
    btc_type_ieds = _ieds - ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F", "Land_MarketShelter_F", "Land_ClothShelter_01_F", "Land_ClothShelter_02_F"];
    btc_model_ieds = btc_type_ieds apply {(toLower getText(_cfgVehicles >> _x >> "model")) select [1]};
    btc_type_blacklist = btc_type_tags + btc_type_flowers + ["ace_tagging_texture1m"]; publicVariable "btc_type_blacklist";

    btc_groundWeaponHolder = [];

    //UI

    BTC_Player_array = createHashMap;
    
    BTC_UID_array = createHashMap;

    //Respawn
    btc_respawn_tickets = createHashMap;

    btc_slots_serialized = createHashMap;

    //Delay
    btc_delay_agent = 0.2;
    btc_delay_unit = 0.3;
    btc_delay_vehicle = 0.4;
    btc_delay_exec = 0.2;
};

//Civ
// Get all faction from mod there are currently running
// copyToClipboard str (["CIV"] call btc_fnc_get_class);
private _allfaction = ["CIV_F","DEFAULT","CIV_IDAP_F","UK3CB_ADC_C","UK3CB_CHC_C","UK3CB_MEC_C","UK3CB_TKC_C"]; //All factions
_p_civ = _allfaction select _p_civ; //Select faction selected from mission parameter
_p_civ_veh = _allfaction select _p_civ_veh; //Select faction selected from mission parameter
private _allclasse = [[_p_civ]] call btc_civ_fnc_class; //Create classes from factions, you can combine factions from the SAME side : [[_p_civ, "btc_ac","LOP_TAK_CIV"]] call btc_civ_fnc_class.

//Save class name to global variable
btc_civ_type_units = _allclasse select 0;
_allclasse = [[_p_civ_veh]] call btc_civ_fnc_class;
btc_civ_type_veh = _allclasse select 2;
btc_civ_type_boats = _allclasse select 1;

btc_w_civs = [
    ["srifle_DMR_06_hunter_F", "sgun_HunterShotgun_01_F", "srifle_DMR_06_hunter_khs_F", "sgun_HunterShotgun_01_Sawedoff_F", "Hgun_PDW2000_F", "arifle_AKM_F", "arifle_AKS_F"],
    ["hgun_Pistol_heavy_02_F", "hgun_Rook40_F", "hgun_Pistol_01_F"]
];
btc_g_civs = ["HandGrenade", "MiniGrenade", "ACE_M84", "ACE_M84"];

// ANIMALS
btc_animals_type = ["Hen_random_F", "Cock_random_F", "Fin_random_F", "Alsatian_Random_F", "Goat_random_F", "Sheep_random_F"];

//FOB
btc_fob_mat = "Land_Cargo20_blue_F";
btc_fob_structure = "Land_Cargo_HQ_V1_F";
btc_fob_flag = "Flag_NATO_F";
btc_fob_id = 0;
btc_fob_minDistance = 250;

//FORTIFY
btc_recovery = "Land_RepairDepot_01_green_F";

//IED
btc_type_ieds_ace = ["IEDLandBig_F", "IEDLandSmall_F"];
btc_ied_deleteOn = -1;

//Int
btc_int_ordersRadius = 25;
btc_int_search_intel_time = 4;
btc_int_sirenRadius = 35;
btc_int_beaconRadius = 15;
btc_int_hornRadius = 20;
btc_int_hornDelay = time;

//Info
btc_info_intel_type = [80, 95];//cache - hd - both
btc_info_hideout_radius = 4000;
btc_info_intels = ["Land_Camera_01_F", "Land_HandyCam_F", "Land_File1_F", "Land_FilePhotos_F", "Land_File2_F", "Land_File_research_F", "Land_MobilePhone_old_F", "Land_PortableLongRangeRadio_F", "Land_Laptop_02_unfolded_F"];
private _mapsIntel = switch (worldName) do {
    case "Altis": {["Land_Map_altis_F", "Land_Map_unfolded_Altis_F"]};
    case "Stratis": {["Land_Map_stratis_F", "Land_Map_unfolded_F"]};
    case "Tanoa": {["Land_Map_Tanoa_F", "Land_Map_unfolded_Tanoa_F"]};
    case "Malden": {["Land_Map_Malden_F", "Land_Map_unfolded_Malden_F"]};
    case "Enoch": {["Land_Map_Enoch_F", "Land_Map_unfolded_Enoch_F"]};
    default {["Land_Map_blank_F"]};
};
btc_info_intels append _mapsIntel;

//Supplies
btc_supplies_cargo = "Land_Cargo20_IDAP_F";
btc_supplies_mat = [
    _allClassSorted select {_x isKindOf "Land_FoodSack_01_cargo_base_F"},
    _allClassSorted select {_x isKindOf "Land_WaterBottle_01_stack_F"}
];

//Hazmat
btc_type_hazmat = ["HazmatBag_01_F", "Land_MetalBarrel_F"] + (_allClassSorted select {
    _x isKindOf "Land_GarbageBarrel_02_base_F" ||
    {_x isKindOf "Land_FoodContainer_01_F"} ||
    {_x isKindOf "Land_CanisterFuel_F"} ||
    {_x isKindOf "CBRNContainer_01_base_F"} ||
    {_x isKindOf "PlasticCase_01_base_F"}
});
 
//Player
btc_player_side = west;
btc_respawn_marker = "respawn_west";
btc_player_type = ["SoldierWB", "SoldierEB", "SoldierGB"] select ([west, east, independent] find btc_player_side);

// Setup each vehicle with price into tiers here.

_Tier0Array = [
    ["rhsgref_hidf_canoe", 50],
    ["UK3CB_B_M1030_NATO", 80],
    ["rhsusf_mrzr4_d", 200],
    ["UK3CB_C_V3S_Recovery", 250],
    ["C_Offroad_01_F", 500],
    ["UK3CB_C_LandRover_Open", 500],
    ["UK3CB_C_LandRover_Closed", 500],
    ["B_T_Boat_Transport_01_F", 500],
    ["UK3CB_CW_US_B_EARLY_M151_JEEP_HMG", 600],
    ["rhsusf_m1151_m240_v2_usarmy_wd", 750],
    ["UK3CB_TKA_B_Hilux_Ambulance", 800]
];

_Tier1Array = [
    ["UK3CB_B_M939_Recovery_WDL", 800],
    ["rhsusf_m1151_m2_v2_usarmy_wd", 1000],
    ["rhsusf_M1078A1R_SOV_M2_D_fmtv_socom", 1000],
    ["rhsusf_m1151_mk19_v3_usmc_wd", 1000],
    ["UK3CB_MDF_B_Skiff", 1000],
    ["rhsusf_M1084A1P2_B_WD_fmtv_usarmy", 1200],
    ["rhsusf_m1165a1_gmv_m2_m240_socom_d", 1500],
    ["rhsusf_m113_usarmy_medical", 1500],
    ["B_APC_Tracked_01_CRV_F", 1800],
    ["B_UGV_01_F", 2000],
    ["UK3CB_UN_B_Cessna_T41", 2000]
];

_Tier2Array = [
    ["rhsusf_M1238A1_socom_d", 2500],
    ["rhsusf_M1220_usarmy_wd", 2800],
    ["RHS_M119_WD", 3000],
    ["rhsusf_stryker_m1126_m2_wd", 3000],
    ["rhsusf_m1240a1_usarmy_wd", 3000],
    ["UK3CB_B_MaxxPro_M2_US_W", 3000],
    ["rhsusf_m1240a1_m240_usarmy_wd", 3800],
    ["rhsusf_mkvsoc", 4500],
    ["RHS_MELB_MH6M", 5000],
    ["UK3CB_B_T28Trojan_HIDF_CAS", 6000]
];

_Tier3Array = [
    ["rhsusf_M1220_M2_usarmy_wd", 4000],
    ["rhsusf_m1240a1_m2_uik_usarmy_wd", 4500],
    ["rhsusf_m1240a1_mk19_uik_usarmy_wd", 5000],
    ["UK3CB_B_LAV25_US_WDL", 6000],
    ["RHS_CH_47F", 8000],
    ["RHS_UH60M", 7000],
    ["RHS_UH60M_MEV2", 8000],
    ["RHS_C130J", 8000],
    ["UK3CB_B_AC47_HIDF", 8500],
    ["UK3CB_LDF_B_L39_PYLON", 12000]
];

_Tier4Array = [
    ["rhsusf_m1245_m2crows_socom_d", 6000],
    ["rhsusf_M1238A1_M2_socom_d", 6000],
    ["rhsusf_CH53E_USMC_GAU21", 9000],
    ["RHS_MELB_AH6M", 10000],
    ["B_UGV_01_rcws_F", 12000],
    ["RHS_M2A3_wd", 13000],
    ["rhsusf_m109_usarmy", 15000],
    ["B_UAV_05_F", 15000],
    ["UK3CB_CW_US_B_LATE_AH1Z", 18000]
];

_Tier5Array = [
    ["UK3CB_B_Osprey_IDWS_HMG_USMC_WD", 16000],
    ["rhsusf_M142_usarmy_WD", 18000],
    ["RHS_M2A3_BUSKIII_wd", 18000],
    ["RHS_A10", 19000],
    ["RHS_AH64D_wd", 20000],
    ["rhsusf_m1a2sep1tuskiiwd_usarmy", 20000],
    ["rhsusf_f22", 22000],
    ["UK3CB_B_M270_MLRS_HE_WDL", 25000]
];

_FortsArray = [ // Fortifications
    ["Land_BagFence_End_F",1],
    ["Land_BagFence_Long_F",1],
    ["Land_BagFence_Round_F",1],
    ["Land_BagFence_Short_F",1],
    ["Land_Razorwire_F",5],
    ["Land_Net_Fence_Gate_F",5],
    ["Land_HBarrier_3_F",5],
    ["Land_HBarrier_5_F",5],
    ["Land_HBarrier_Big_F",5],
    ["Land_HBarrier_1_F",5],
    ["Land_Concrete_SmallWall_8m_F",5],
    ["Land_Concrete_SmallWall_4m_F",5],
    ["Land_ConcreteKerb_03_BW_long_F",5],
    ["Land_ConcreteHedgehog_01_F",10],
    ["Land_DragonsTeeth_01_4x2_new_F",10],
    ["BlockConcrete_F",10],
    ["Land_RampConcrete_F",10],
    ["Land_CncShelter_F",10],
    ["Land_HBarrierWall_corridor_F",10],
    ["Land_HBarrierWall_corner_F",10],
    ["Land_HBarrierWall6_F",10],
    ["Land_HBarrierWall4_F",10],
    ["Land_CncWall4_F",10],
    ["Land_CncWall1_F",10],
    ["Land_Camping_Light_F",10],
    ["Land_TyreBarrier_01_line_x6_F",10],
    ["PortableHelipadLight_01_white_F", 10],
    ["PortableHelipadLight_01_blue_F",10],
    ["Land_BagBunker_Small_F",15],
    ["Land_Plank_01_4m_F",25],
    ["Land_Plank_01_8m_F",50]
];

_StaticsArray = [ // Statics
    ["UK3CB_B_Searchlight_NATO",25],
    ["B_Static_Designator_01_F",25],
    ["RHS_M2StaticMG_D",50],
    ["RHS_M2StaticMG_MiniTripod_D",50],
    ["RHS_Stinger_AA_pod_D",100],
    ["RHS_TOW_TriPod_D",100],
    ["B_HMG_01_A_F",300],
    ["B_GMG_01_A_F",500]
];

_AmmoBoxesArray =  [ // Ammo Boxes / Storage Boxes
    ["ACE_medicalSupplyCrate",20],
    ["ACE_medicalSupplyCrate_advanced",25],
    ["ACE_Box_Chemlights",25],
    ["Land_WoodenBox_F",25]
];


_Containers1Array = [ // Storage/Transport Containers
    ["B_Slingload_01_Repair_F",100],
    ["B_Slingload_01_Fuel_F",100],
    ["B_Slingload_01_Ammo_F",100],
    ["B_Slingload_01_Cargo_F",100]
];


_SupplysArray = [ // Side Supplies
    ["Land_Cargo20_IDAP_F",100],
    ["DeconShower_01_F",100],
    ["DeconShower_02_F",100]
];


_FobStuffArray = [ // FOB Crate + FOB Objects
    ["TFAR_Land_Communication_F",100],
    ["Land_Cargo_Patrol_V1_F", 100],
    ["Land_Medevac_house_V1_F",250],
    ["Land_RepairDepot_01_green_F",500],
    ["Land_Cargo20_blue_F",1000]
];


_VehLogisticsArray = [ // Vehicle Logistics
    ["ACE_Track",1],
    ["ACE_Wheel",1], 
    ["FlexibleTank_01_sand_F",10],
    ["ACE_fastropingSupplyCrate",25],
    ["Box_NATO_AmmoVeh_F",50]
];






// LEAVE BLANK!
_CustomPriceOverride = [];

_Tier0 = [];
_Tier1 = [];
_Tier2 = [];
_Tier3 = [];
_Tier4 = [];
_Tier5 = [];

_Forts = [];
_Statics = [];
_AmmoBoxes = [];
_Containers1 = [];
_Supplys = [];
_FobStuff = [];
_vehLogistics = [];

{_obj = _x select 0; _Tier0 pushBackUnique _obj;} foreach _Tier0Array;
{_obj = _x select 0; _Tier1 pushBackUnique _obj;} foreach _Tier1Array;
{_obj = _x select 0; _Tier2 pushBackUnique _obj;} foreach _Tier2Array;
{_obj = _x select 0; _Tier3 pushBackUnique _obj;} foreach _Tier3Array;
{_obj = _x select 0; _Tier4 pushBackUnique _obj;} foreach _Tier4Array;
{_obj = _x select 0; _Tier5 pushBackUnique _obj;} foreach _Tier5Array;

{_obj = _x select 0; _Forts pushBackUnique _obj;} foreach _FortsArray;
{_obj = _x select 0; _Statics pushBackUnique _obj;} foreach _StaticsArray;
{_obj = _x select 0; _AmmoBoxes pushBackUnique _obj;} foreach _AmmoBoxesArray;
{_obj = _x select 0; _Containers1 pushBackUnique _obj;} foreach _Containers1Array;
{_obj = _x select 0; _Supplys pushBackUnique _obj;} foreach _SupplysArray;
{_obj = _x select 0; _FobStuff pushBackUnique _obj;} foreach _FobStuffArray;
{_obj = _x select 0; _vehLogistics pushBackUnique _obj;} foreach _VehLogisticsArray;


_CustomPrices = _Tier0Array + _Tier1Array + _Tier2Array + _Tier3Array + _Tier4Array + _Tier5Array + _FortsArray + _StaticsArray + _AmmoBoxesArray + _Containers1Array + _SupplysArray + _FobStuffArray + _VehLogisticsArray + _CustomPriceOverride;

btc_vehicles = [];

//Log  
btc_construction_array =
[
    [
        "Basic",
        "Standard",
        "Light",
        "Medium",
        "Heavy",
        "Super Heavy",
        "Fortifications",
        "Static",
        "Ammobox",
        "Containers",
        "Side Missions",
        "FOB",
        "Vehicle Logistic"
    ],
    [
        //_GroundVeh,
        //_AirVeh,
        _Tier0,
        _Tier1,
        _Tier2,
        _Tier3,
        _Tier4,
        _Tier5,
        _Forts,
        _Statics,
        _AmmoBoxes,
        _Containers1,
        _Supplys,
        _FobStuff,
        _vehLogistics
    ]
];

// seperate arrays for pricing into seperate variables. Add variables together for pricing. Use the select code to seperate the classnames into modified arrays to build the btc_construction_array

(btc_construction_array select 1) params [
    /*"_cGround_vehicles","_cAir_vehicles",*/"_cTier0", "_cTier1", "_cTier2", "_cTier3", "_cTier4", "_cTier5","_cFortifications", "_cStatics", "_cAmmobox",
    "_cContainers", "_cSupplies", "_cFOB", "_cVehicle_logistic"
];
btc_log_def_loadable = _cContainers + _cFortifications + _cStatics + _cAmmobox + _cSupplies + _cFOB + _cVehicle_logistic + flatten btc_supplies_mat + btc_type_hazmat;
btc_log_def_can_load = _cContainers + _cTier0 + _cTier1 + _cTier2 + _cTier3 + _cTier4 + _cTier5 + _cSupplies;// + _cVehicle_logistic;
btc_log_def_placeable = (_cFortifications + _cContainers + _cSupplies + _cFOB + _cVehicle_logistic + flatten btc_supplies_mat + btc_type_hazmat) select {
    getNumber(_cfgVehicles >> _x >> "ace_dragging_canCarry") isEqualTo 0
};
btc_tow_vehicleTowing = objNull;
btc_log_placing_max_h = 12;
btc_log_placing = false;
btc_log_obj_created = [];
btc_fortify_vehicles = _cTier0 + _cTier1 + _cTier2 + _cTier3 + _cTier4 + _cTier5;
btc_containers_mat = _cContainers;
btc_containers_log = btc_log_def_placeable + _cAmmobox;
btc_all_obj = _cVehicle_logistic + _cFOB + _cSupplies + _cContainers + _cAmmobox + _cStatics + _cFortifications;

btc_log_fnc_get_nottowable = {
    params ["_tower"];

    switch (true) do {
        case (_tower isKindOf "Tank") : {
            [];
        };
        case (_tower isKindOf "Truck_F") : {
            [];
        };
        case (_tower isKindOf "Truck") : {
            [];
        };
        case (_tower isKindOf "Ship") : {
            ["Car", "Truck", "Truck_F", "Tank", "Plane", "Helicopter", "Ship"];
        };
        case (_tower isKindOf "Car") : {
            ["Truck", "Truck_F", "Tank", "Helicopter" ]; //The tower is a car so it can't tow: truck, tank, plane and helicopter
        };
        default {
            ["Car", "Truck", "Truck_F", "Tank", "Plane", "Helicopter", "Ship"];
        };
    };
};

//Lift
btc_lift_fnc_getLiftable = {
    params ["_chopper"];

    private _array = [];
    switch (typeOf _chopper) do {
        case "B_SDV_01_F" : {
            _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + btc_containers_log;
        };
        default {
            private _MaxCargoMass = getNumber (configOf _chopper >> "slingLoadMaxCargoMass");
            switch (true) do {
                case (_MaxCargoMass <= 510) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "Quadbike_01_base_F", "Strategic"];
                };
                case (_MaxCargoMass <= 2100) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + btc_containers_log;
                };
                case (_MaxCargoMass <= 4100) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + btc_containers_log;
                };
                case (_MaxCargoMass <= 14000) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + btc_containers_log;
                    };
                default {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + btc_containers_log;
                };
            };
        };
    };
    _array
};

btc_ropes_deployed = false;
btc_lift_min_h  = 7;
btc_lift_max_h  = 12;
btc_lift_radius = 3;
btc_lift_HUD_x  = 0.874;
btc_lift_HUD_y  = 0.848;

//Mil
btc_hq = objNull;
// Get all faction from mod there are currently running
//copyToClipboard str (["EN"] call btc_fnc_get_class);
private _allfaction = ["IND_F","OPF_F","BLU_CTRG_F","OPF_G_F","IND_G_F","BLU_G_F","IND_E_F","IND_L_F","BLU_F","IND_C_F","BRF_O_AFM_FACTION","BRF_I_AFM_FACTION","BRF_B_AFM_FACTION","BRF_O_AFR_FACTION","BRF_I_AFR_FACTION","BRF_B_AFR_FACTION","BRF_O_BLP_FACTION","BRF_I_BLP_FACTION","BRF_B_BLP_FACTION","BRF_B_KAR_FACTION","BRF_I_MAL_FACTION","BRF_I_SWA_FACTION","BRF_O_SRA_FACTION","BRF_I_SRA_FACTION","BRF_B_SRA_FACTION","BRF_I_TAR_FACTION","BRF_I_TAR_UN_FACTION","OPF_R_F","OPF_T_F","OPF_GEN_F","BLU_GEN_F","BLU_T_F","BLU_W_F","RHS_FACTION_VMF","BRF_O_AGR_FACTION","BRF_O_AGR_WINTER_FACTION","BRF_O_ARD_FACTION","RHS_FACTION_MSV","RHS_FACTION_RVA","RHS_FACTION_TV","RHS_FACTION_VDV","RHS_FACTION_VPVO","RHS_FACTION_VV","RHS_FACTION_VVS_C","RHS_FACTION_VVS","RHSGREF_FACTION_CHDKZ","RHSSAF_FACTION_ARMY","RHSSAF_FACTION_ARMY_OPFOR","RHSSAF_FACTION_AIRFORCE_OPFOR","RHSSAF_FACTION_AIRFORCE","RHSSAF_FACTION_UN","RHS_FACTION_USARMY_D","RHS_FACTION_USARMY_WD","RHS_FACTION_USN","RHS_FACTION_SOCOM","RHS_FACTION_USAF","RHS_FACTION_USMC_D","RHS_FACTION_USMC_WD","RHSGREF_FACTION_UN","RHSGREF_FACTION_HIDF","RHSGREF_FACTION_NATIONALIST","RHSGREF_FACTION_TLA","RHSGREF_FACTION_TLA_G","RHSGREF_FACTION_CDF_GROUND","RHSGREF_FACTION_CDF_GROUND_B","UK3CB_AAF_O","UK3CB_AAF_I","UK3CB_AAF_B","UK3CB_ANA_B","UK3CB_ANP_B","UK3CB_ADA_O","UK3CB_ADA_I","UK3CB_ADA_B","UK3CB_ADR_O","UK3CB_ADR_I","UK3CB_ADR_B","UK3CB_ADG_O","UK3CB_ADG_I","UK3CB_ADG_B","UK3CB_ADC_O","UK3CB_ADC_I","UK3CB_ADC_B","UK3CB_ADE_O","UK3CB_ADE_I","UK3CB_ADM_O","UK3CB_ADM_I","UK3CB_ADM_B","UK3CB_ADP_O","UK3CB_ADP_I","UK3CB_ADP_B","UK3CB_APD_O","UK3CB_APD_I","UK3CB_APD_B","UK3CB_ARD_O","UK3CB_ARD_I","UK3CB_ARD_B","UK3CB_CHD_O","UK3CB_CHD_W_O","UK3CB_CHD_B","UK3CB_CHD_W_B","UK3CB_CHD_I","UK3CB_CHD_W_I","UK3CB_CHC_O","UK3CB_CHC_I","UK3CB_CHC_B","UK3CB_CCM_O","UK3CB_CCM_B","UK3CB_CCM_I","UK3CB_CPD_O","UK3CB_CPD_I","UK3CB_CPD_B","UK3CB_CW_US_B_EARLY","UK3CB_CW_US_B_LATE","UK3CB_CW_SOV_O_EARLY","UK3CB_CW_SOV_O_LATE","UK3CB_CSAT_A_O","UK3CB_CSAT_W_O","UK3CB_CSAT_M_O","UK3CB_CSAT_B_O","UK3CB_CSAT_N_O","UK3CB_CSAT_F_O","UK3CB_CSAT_G_O","UK3CB_CSAT_U_O","UK3CB_CSAT_S_O","UK3CB_FIA_O","UK3CB_FIA_I","UK3CB_FIA_B","UK3CB_GAF_O","UK3CB_GAF_I","UK3CB_GAF_B","UK3CB_TPD_O","UK3CB_TPD_I","UK3CB_TPD_B","UK3CB_ION_O_DESERT","UK3CB_ION_I_DESERT","UK3CB_ION_B_DESERT","UK3CB_ION_O_URBAN","UK3CB_ION_I_URBAN","UK3CB_ION_B_URBAN","UK3CB_ION_O_WINTER","UK3CB_ION_I_WINTER","UK3CB_ION_B_WINTER","UK3CB_ION_O_WOODLAND","UK3CB_ION_I_WOODLAND","UK3CB_ION_B_WOODLAND","UK3CB_KRG_O","UK3CB_KRG_I","UK3CB_KRG_B","UK3CB_KDF_O","UK3CB_KDF_I","UK3CB_KDF_B","UK3CB_LDF_O","UK3CB_LDF_I","UK3CB_LDF_B","UK3CB_LFR_O","UK3CB_LFR_I","UK3CB_LFR_B","UK3CB_LSM_O","UK3CB_LSM_I","UK3CB_LSM_B","UK3CB_LNM_O","UK3CB_LNM_I","UK3CB_LNM_B","UK3CB_MDF_O","UK3CB_MDF_I","UK3CB_MDF_B","UK3CB_MEC_O","UK3CB_MEC_I","UK3CB_MEC_B","UK3CB_MEE_O","UK3CB_MEE_I","UK3CB_MEI_O","UK3CB_MEI_I","UK3CB_MEI_B","UK3CB_NAP_O","UK3CB_NAP_I","UK3CB_NAP_B","UK3CB_NFA_O","UK3CB_NFA_I","UK3CB_NFA_B","UK3CB_NPD_O","UK3CB_NPD_I","UK3CB_NPD_B","UK3CB_PLM_O","UK3CB_PLM_I","UK3CB_PLM_B","UK3CB_TKC_O","UK3CB_TKC_I","UK3CB_TKC_B","UK3CB_TKM_O","UK3CB_TKA_O","UK3CB_TKA_I","UK3CB_TKA_B","UK3CB_TKP_O","UK3CB_TKP_I","UK3CB_TKP_B","UK3CB_TKM_B","UK3CB_TKM_I","UK3CB_TNM_O","UK3CB_TNM_I","UK3CB_TNM_B","UK3CB_UN_I","UK3CB_UN_B","UK3CB_WEI_O","UK3CB_WEI_I","UK3CB_WEI_B","RHSGREF_FACTION_CDF_AIR","RHSGREF_FACTION_CDF_AIR_B","RHSGREF_FACTION_CDF_NG","RHSGREF_FACTION_CDF_NG_B","RHSGREF_FACTION_CHDKZ_G"]; //All factions
_p_en = _allfaction select _p_en; //Select faction selected from mission parameter
_allclasse = [[_p_en], _p_en_AA, _p_en_tank] call btc_mil_fnc_class; //Create classes from factions, you can combine factions like that: [[_p_en , "IND_F"], _p_en_AA, _p_en_tank] call btc_mil_fnc_class;
//Save class name to global variable

btc_enemy_side = _allclasse select 0;
btc_type_units = _allclasse select 1;
btc_type_divers = _allclasse select 2;
btc_type_crewmen = _allclasse select 3;
btc_type_boats = _allclasse select 4;
btc_type_motorized = _allclasse select 5;
btc_type_motorized_armed = _allclasse select 6;
btc_type_mg = _allclasse select 7;
btc_type_gl = _allclasse select 8;

//TempFix
btc_type_gl = btc_type_mg;

//Chem
btc_chem_range = 5;

//Spect
btc_spect_range = 1000;
btc_spect_updateOn = -1;

//Rep
btc_rep_bonus_cache = 30; // WAI
btc_rep_bonus_civ_hh = 0; // DISABLED
btc_rep_bonus_disarm = 20; // WAI
btc_rep_bonus_hideout = 50; // WAI
btc_rep_bonus_mil_killed = 0; // WAI
btc_rep_bonus_IEDCleanUp = 10; // WAI
btc_rep_bonus_removeTag = 5; // WAI
btc_rep_bonus_removeTagLetter = 2; // WAI
btc_rep_bonus_foodGive = 5; // WAI
btc_rep_bonus_vehicle = 0; // WAI
btc_rep_bonus_grave = 5;

btc_rep_malus_veh_killed = 0; // DISABLE
btc_rep_malus_civ_hd = 0 ; // DISABLE
btc_rep_malus_animal_hd = 0 ; // DISABLE
btc_rep_malus_civ_killed = - 50 ; // HIGH
btc_rep_malus_animal_killed = - 10; // MID
btc_rep_malus_civ_suppressed = 0 ; // DISABLED
btc_rep_malus_player_respawn = - 3; // LOW
btc_rep_malus_building_damaged = - 10; // LOW
btc_rep_malus_building_destroyed = - 50; // HIGH
btc_rep_malus_foodRemove = - btc_rep_bonus_foodGive; // WAI
btc_rep_malus_breakDoor = - 0; // WAI
btc_rep_malus_wheelChange = 0; // DISABLED
btc_rep_malus_mil_killed = - 15;

btc_rep_level_veryLow = 0;
btc_rep_level_low = 200;
btc_rep_level_normal = 500;
btc_rep_level_high = 750;

//Headless
btc_units_owners = [];

//Door
btc_door_breaking_time = 2;

//Flag
btc_flag_textures = [
    "\A3\Data_F\Flags\Flag_uno_CO.paa",
    "\A3\Data_F\Flags\flag_rcrystal_CO.paa",
    "\A3\Data_F\Flags\flag_us_CO.paa",
    "\A3\Data_F\Flags\flag_uk_CO.paa",
    "\A3\Data_F\Flags\flag_NATO_CO.paa",
    "res\2.paa"
];

//Respawn
btc_body_bagTicketPlayer = 1;
btc_body_prisonerTicket = 5;

btc_startDate = [1990, 5, 17, 12, 15];

// Object Array builder

_alltoprice = flatten btc_type_boats + flatten btc_type_motorized + flatten btc_type_motorized_armed; 
_alltopricearray = []; 
ALLTOPRICETOTAL = [];

 
for "_i" from 0 to count _customPrices - 1 do { 
_class = (_customprices select _i) select 0; 
if (_class in _alltoprice) then {_alltoprice deleteat (_alltoprice find _class);}; 
}; 
 
{  
    _cfgVehicles = configFile >> "CfgVehicles";  
    _cost = getNumber(_cfgVehicles >> _x >> "armor");
    _finalcost = ((_cost * 8) max 150) min 3000;
    _alltopricearray pushback [_x,_finalcost];
} foreach _alltoprice;

ALLTOPRICETOTAL = _alltopricearray + _customprices;

city_remaining = [];

Points_Active = 0;
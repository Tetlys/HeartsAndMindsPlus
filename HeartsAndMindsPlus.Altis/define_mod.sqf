private _locations = configfile >> "cfgworlds" >> worldname >> "names";

btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool), (count _locations + #)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine", "StrongpointArea", "BorderCrossing", "VegetationFir"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,true,(count _locations + 1)]
*/
[[5191.32,17355.6,0],"Airport","Airport_1",800,true],
[[17011.9,6013.09,0],"Airport","Airport_3",800,true],
[[10909.2,12767.1,0],"BorderCrossing", "Boardercorssing_1",300,true],
[[19519.6,12331.8,0],"BorderCrossing", "Boardercorssing_10",300,true],
[[11876.2,15924.1,0],"BorderCrossing", "Boardercorssing_2",300,true],
[[3843.98,16455.8,0],"BorderCrossing", "Boardercorssing_3",300,true],
[[8740.01,9331.66,0],"BorderCrossing", "Boardercorssing_4",300,true],
[[17002.1,11835.6,0],"BorderCrossing", "Boardercorssing_5",300,true],
[[10203,18533.2,0],"BorderCrossing", "Boardercorssing_6",300,true],
[[13549.5,3068.25,0],"BorderCrossing", "Boardercorssing_7",300,true],
[[15137.3,18525.1,0],"BorderCrossing", "Boardercorssing_8",300,true],
[[11000.6,2874.85,0],"BorderCrossing", "Boardercorssing_9",300,true],
[[8267.72,2870.83,0],"NameCityCapital","NameCityCapital_1",800,true],
[[4215.74,8903.94,0],"NameCityCapital","NameCityCapital_10",800,true],
[[14869.1,2389.43,0],"NameCityCapital","NameCityCapital_11",800,true],
[[5866.62,17879.5,0],"NameCityCapital","NameCityCapital_12",800,true],
[[7303.65,14740.1,0],"NameCityCapital","NameCityCapital_2",800,true],
[[14962.9,15133.1,0],"NameCityCapital","NameCityCapital_3",800,true],
[[12244.7,12966.4,0],"NameCityCapital","NameCityCapital_4",800,true],
[[15037,11174.1,0],"NameCityCapital","NameCityCapital_5",800,true],
[[7627.25,5920.29,0],"NameCityCapital","NameCityCapital_6",800,true],
[[17447.8,14561.1,0],"NameCityCapital","NameCityCapital_7",800,true],
[[16532.2,17335.1,0],"NameCityCapital","NameCityCapital_8",800,true],
[[2427.06,3104.78,0],"NameCityCapital","NameCityCapital_9",800,true],
[[3361.13,14336.7,0],"NameCity","NameCity_1",500,true],
[[767.284,1627.13,0],"NameCity","NameCity_10",500,true],
[[2787.75,6481.56,0],"NameCity","NameCity_11",500,true],
[[1742.74,11957.9,0],"NameCity","NameCity_12",500,true],
[[5608.01,13223.7,0],"NameCity","NameCity_13",500,true],
[[11760.5,10610.1,0],"NameCity","NameCity_14",500,true],
[[12298.9,3589.76,0],"NameCity","NameCity_15",500,true],
[[10754.9,14984,0],"NameCity","NameCity_2",500,true],
[[8848.49,16966.3,0],"NameCity","NameCity_3",500,true],
[[2236.14,18626.4,0],"NameCity","NameCity_4",500,true],
[[13854.5,18133.4,0],"NameCity","NameCity_5",500,true],
[[17521.9,10032.1,0],"NameCity","NameCity_6",500,true],
[[19271.9,7988.39,0],"NameCity","NameCity_7",500,true],
[[12599.5,7938.98,0],"NameCity","NameCity_8",500,true],
[[4045.59,1465.73,0],"NameCity","NameCity_9",500,true],
[[5558.57,12250.6,0],"Hill","Hill_1",500,true],
[[19009,14868.7,0],"Hill","Hill_2",500,true],
[[14243.6,5897.71,0],"Hill","Hill_3",500,true],
[[5334.83,6480.94,0],"Hill","Hill_4",500,true],
[[11892.7,12165.4,0],"NameLocal","NameLocal_1",160,true],
[[15968.5,1125.16,0],"NameLocal","NameLocal_10",160,true],
[[18251.3,12840.7,0],"NameLocal","NameLocal_11",160,true],
[[15551.9,13097,0],"NameLocal","NameLocal_12",160,true],
[[2058.22,15473.8,0],"NameLocal","NameLocal_13",160,true],
[[1586.53,14093.8,0],"NameLocal","NameLocal_14",160,true],
//[[659.078,12892,0],"NameLocal","NameLocal_15",160,true],
[[14580.5,3860.05,0],"NameLocal","NameLocal_16",160,true],
[[15188.1,3946.84,0],"NameLocal","NameLocal_17",160,true],
[[16082.8,9696.87,0],"NameLocal","NameLocal_18",160,true],
[[14682,19083.5,0],"NameLocal","NameLocal_19",160,true],
[[13553.3,11913.2,0],"NameLocal","NameLocal_2",160,true],
[[13890,19211.5,0],"NameLocal","NameLocal_20",160,true],
[[10610.4,19074.7,0],"NameLocal","NameLocal_21",160,true],
[[2624.16,16947.7,0],"NameLocal","NameLocal_22",160,true],
[[6280.36,10323.7,0],"NameLocal","NameLocal_23",160,true],
[[12682,6525.32,0],"NameLocal","NameLocal_24",160,true],
[[11346.9,6242.09,0],"NameLocal","NameLocal_25",160,true],
[[12205.6,7074.9,0],"NameLocal","NameLocal_26",160,true],
[[15337.5,8407.17,0],"NameLocal","NameLocal_27",160,true],
[[14428.6,13884.9,0],"NameLocal","NameLocal_28",160,true],
[[14023.1,13279.2,0],"NameLocal","NameLocal_29",160,true],
[[13796.3,10123.3,0],"NameLocal","NameLocal_3",160,true],
[[13506.9,5721.18,0],"NameLocal","NameLocal_30",160,true],
[[5127.78,15359.7,0],"NameLocal","NameLocal_31",160,true],
[[2727.29,10945.9,0],"NameLocal","NameLocal_32",160,true],
[[19638.6,6942.38,0],"NameLocal","NameLocal_33",160,true],
[[7043.83,8658.03,0],"NameLocal","NameLocal_4",160,true],
[[4777.13,4833.46,0],"NameLocal","NameLocal_5",160,true],
[[3576.4,3972.13,0],"NameLocal","NameLocal_6",160,true],
[[2981.22,4325.63,0],"NameLocal","NameLocal_7",160,true],
[[2221.38,707.837,0],"NameLocal","NameLocal_8",160,true],
[[7989.9,743.776,0],"NameLocal","NameLocal_9",160,true],
[[18732.4,16611.5,0],"StrongpointArea","StrongpointArea_1",500,true],
[[19467.5,11695.9,0],"StrongpointArea","StrongpointArea_2",500,true],
[[17077.3,18207.3,0],"StrongpointArea","StrongpointArea_3",500,true],
[[2471.84,9588.38,0],"StrongpointArea","StrongpointArea_4",500,true],
[[1868.8,4076.34,0],"StrongpointArea","StrongpointArea_5",500,true],
[[8584.62,11952.2,0],"StrongpointArea","StrongpointArea_6",500,true],
[[3823.49,4743.58,0],"StrongpointArea","StrongpointArea_7",500,true],
[[11102.1,12448.4,0],"StrongpointArea","StrongpointArea_8",500,true],
[[15261.1,12395.4,0],"StrongpointArea","StrongpointArea_9",500,true],
[[5686.89,19270.5,0],"VegetationFir","VegetationFir_2",300,true],
[[7805.51,19904.2,0],"VegetationFir","VegetationFir_3",300,true],
[[9934.22,8118.28,0],"VegetationFir","VegetationFir_4",300,true],
[[10696.3,6007.08,0],"VegetationFir","VegetationFir_5",300,true],
[[1431.22,15841.6,0],"NameVillage","NameVillage_1",300,true],
[[18591.2,5160.62,0],"NameVillage","NameVillage_10",300,true],
[[7835.29,12423.1,0],"NameVillage","NameVillage_11",300,true],
[[3851.24,12400.1,0],"NameVillage","NameVillage_12",300,true],
[[11374.2,19130.2,0],"NameVillage","NameVillage_2",300,true],
[[18460.3,19972,0],"NameVillage","NameVillage_3",300,true],
[[16254.8,7853.96,0],"NameVillage","NameVillage_4",300,true],
[[10752.1,6949.61,0],"NameVillage","NameVillage_5",300,true],
[[10114.9,1646.95,0],"NameVillage","NameVillage_6",300,true],
[[13802.7,566.921,0],"NameVillage","NameVillage_7",300,true],
[[17832.9,1191.54,0],"NameVillage","NameVillage_8",300,true],
[[18175.9,2341.47,0],"NameVillage","NameVillage_9",300,true]
];

/*
    Here you can tweak spectator view during respawn screen.
*/
BIS_respSpecAi = false;                  // Allow spectating of AI
BIS_respSpecAllowFreeCamera = false;     // Allow moving the camera independent from units (players)
BIS_respSpecAllow3PPCamera = false;      // Allow 3rd person camera
BIS_respSpecShowFocus = false;           // Show info about the selected unit (dissapears behind the respawn UI)
BIS_respSpecShowCameraButtons = true;    // Show buttons for switching between free camera, 1st and 3rd person view (partially overlayed by respawn UI)
BIS_respSpecShowControlsHelper = true;   // Show the controls tutorial box
BIS_respSpecShowHeader = true;           // Top bar of the spectator UI including mission time
BIS_respSpecLists = true;                // Show list of available units and locations on the left hand side

/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];

btc_custom_arsenal = [_weapons, _magazines, _items, _backpacks];

/*
    Here you can specify which equipment is loaded on player connection.
*/

private _radio = ["tf_anprc152", "ACRE_PRC148"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));
//Array of colored item: 0 - Desert, 1 - Tropic, 2 - Black, 3 - forest
private _uniforms = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1", "U_B_CombatUniform_mcam_wdl_f"];
private _uniformsCBRN = ["U_B_CBRN_Suit_01_MTP_F", "U_B_CBRN_Suit_01_Tropic_F", "U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_Wdl_F"];
private _uniformsSniper = ["U_B_FullGhillie_sard", "U_B_FullGhillie_lsh", "U_B_T_FullGhillie_tna_F", "U_B_T_FullGhillie_tna_F"];
private _vests = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_wdl"];
private _helmets = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk", "H_HelmetSpecB_wdl"];
private _hoods = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat", "G_Balaclava_combat"];
private _hoodCBRN = "G_AirPurifyingRespirator_01_F";
private _laserdesignators = ["Laserdesignator", "Laserdesignator_03", "Laserdesignator_01_khk_F", "Laserdesignator_01_khk_F"];
private _night_visions = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
private _weapons = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F", "arifle_MXC_Black_F"];
private _weapons_machineGunner = ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_Black_F"];
private _weapons_sniper = ["arifle_MXM_F", "arifle_MXM_khk_F", "arifle_MXM_Black_F", "arifle_MXM_Black_F"];
private _bipods = ["bipod_01_F_snd", "bipod_01_F_khk", "bipod_01_F_blk", "bipod_01_F_blk"];
private _pistols = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F", "hgun_P07_khk_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F", "launch_B_Titan_short_tna_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F", "launch_B_Titan_tna_F"];
private _backpacks = ["B_AssaultPack_Kerry", "B_AssaultPack_eaf_F", "B_AssaultPack_blk", "B_AssaultPack_wdl_F"];
private _backpacks_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr", "B_Kitbag_rgr"];
private _backpackCBRN = "B_CombinationUnitRespirator_01_F";

btc_arsenal_loadout = [_uniforms, _uniformsCBRN, _uniformsSniper, _vests, _helmets, _hoods, [_hoodCBRN, _hoodCBRN, _hoodCBRN, _hoodCBRN], _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_backpackCBRN, _backpackCBRN, _backpackCBRN, _backpackCBRN], [_radio, _radio, _radio, _radio]];

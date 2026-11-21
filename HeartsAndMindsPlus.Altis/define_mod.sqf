private _locations = configfile >> "cfgworlds" >> worldname >> "names";

btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool), (count _locations + #)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine", "StrongpointArea", "BorderCrossing", "VegetationFir"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,true,(count _locations + 1)]
*/
[[18865.7,18999.2,0],"Airport","Airport_1",800,true],
[[18505.7,3619.51,0],"Airport","Airport_2",800,true],
[[4817.19,8973.45,0],"Airport","Airport_3",800,true],
[[1175.09,1208.18,0],"Airport","Airport_4",800,true],
[[11023.9,2180.18,0],"BorderCrossing","Boardercorssing_2",500,true],
[[12451.3,8172.63,0],"NameLocal","NameLocal_10",300,true],
[[18709.6,6614.23,0],"NameLocal","NameLocal_11",300,true],
[[13047.2,14826.8,0],"NameLocal","NameLocal_12",300,true],
[[11362.1,15286.3,0],"NameLocal","NameLocal_13",300,true],
[[2197.46,19997.5,0],"NameLocal","NameLocal_14",300,true],
[[1599.94,8953.2,0],"NameLocal","NameLocal_15",300,true],
[[17210.9,12383.7,0],"NameLocal","NameLocal_2",300,true],
[[11552.3,9738.18,0],"NameLocal","NameLocal_3",300,true],
[[10158.2,5707.67,0],"NameLocal","NameLocal_4",300,true],
[[18443.9,9670.14,0],"NameLocal","NameLocal_5",300,true],
[[17091.3,9539.93,0],"NameLocal","NameLocal_6",300,true],
[[8023.83,15509.2,0],"NameLocal","NameLocal_7",300,true],
[[17019,16807.9,0],"NameLocal","NameLocal_8",300,true],
[[13302.9,12832.1,0],"NameLocal","NameLocal_9",300,true],
[[14579.3,8433.28,0],"NameVillage","NameVillage_10",500,true],
[[9501.58,1826.66,0],"NameVillage","NameVillage_11",500,true],
[[6300.32,7653.2,0],"NameVillage","NameVillage_12",500,true],
[[4800.24,5274.43,0],"NameVillage","NameVillage_13",500,true],
[[1423.47,7757.86,0],"NameVillage","NameVillage_14",500,true],
[[1684.2,17973.4,0],"NameVillage","NameVillage_15",500,true],
[[6069.74,16626.9,0],"NameVillage","NameVillage_16",500,true],
[[5621.11,15119.5,0],"NameVillage","NameVillage_17",500,true],
[[14609.5,19507.2,0],"NameVillage","NameVillage_2",500,true],
[[17866,2319.53,0],"NameVillage","NameVillage_3",500,true],
[[18705.9,4881.33,0],"NameVillage","NameVillage_4",500,true],
[[14354.4,2610.7,0],"NameVillage","NameVillage_5",500,true],
[[19697.5,7133.79,0],"NameVillage","NameVillage_6",500,true],
[[17400.1,7457.56,0],"NameVillage","NameVillage_7",500,true],
[[19696.2,10026.7,0],"NameVillage","NameVillage_8",500,true],
[[16030.6,10193.1,0],"NameVillage","NameVillage_9",500,true]
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

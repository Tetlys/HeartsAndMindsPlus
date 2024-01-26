
[compileScript ["core\init.sqf"]] call CBA_fnc_directCall;


//ARSENAL 
[] call compileFinal preprocessFileLineNumbers "core\def\rolearsenal.sqf";

ARSENAL_CRATES = [];
Arsenal_typename = "C_supplyCrate_F"; // CONFIG - ARSENAL TYPE

[Arsenal_typename, "init",
{
    private _box = (_this select 0);
    private _player = player;

    diag_log format ["ROLE ARSENAL EH Role: %1", roleDescription _player];


    ARSENAL_CRATES pushback _box;
    [roleArsenal, [_box, _player], 5] call CBA_fnc_waitAndExecute;
},
true,
[],
true
] call CBA_fnc_addClassEventHandler;

//Economy Prices
[west, btc_global_economy, [
["B_Boat_Transport_01_F",100], 
["rhsusf_mkvsoc",600],
["rhsusf_m966_w",740],  
["RHS_M2A3_BUSKIII_wd",3600], 
["RHS_M6_wd",2900], 
["rhsusf_M1117_W",2000],     
["rhsusf_m1a1aim_tuski_wd",4200], 
["rhsusf_m1a2sep1tuskiiwd_usarmy",4900], 
["rhsusf_m1a2sep2wd_usarmy",3800], 
["rhsusf_mrzr4_d",100],
["UK3CB_B_MTVR_Recovery_WDL",150],
//m240 ~250
["rhsusf_m1151_m240_v2_usarmy_wd",250],
//m2 ~3-500
["CFP_B_USSEALS_HMMWV_SOV_M2_WDL_01",400],  
["rhsusf_m1151_m2_v2_usarmy_wd",300],
["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",500],
["rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd",500],
["rhsusf_M1220_M2_usarmy_wd",500],  
["rhsusf_M1237_M2_usarmy_wd",500],
["UK3CB_B_MaxxPro_M2_US_W",500],
["rhsusf_m113_usarmy",700], 
//mk19 ~$800
["rhsusf_m113_usarmy_MK19",800],
["rhsusf_m1151_mk19_v2_usarmy_wd",400],
["UK3CB_B_MaxxPro_MK19_US_W",600],
["rhsusf_M1237_MK19_usarmy_wd",600],
["rhsusf_M1220_MK19_usarmy_wd",600],
["CFP_B_USSEALS_HMMWV_SOV_Mk19_WDL_01",500],
// Fortifications - 10
["Land_HBarrier_01_big_tower_green_F", 10],
["Land_HBarrier_01_wall_4_green_F", 10],
["Land_HBarrier_01_wall_6_green_F", 10],
["Land_HBarrier_01_wall_corner_green_F", 10],
["Land_HBarrier_01_wall_corridor_green_F", 10],
["Land_HBarrier_01_line_1_green_F", 10],
["Land_HBarrier_01_big_4_green_F", 10],
["Land_HBarrier_01_line_5_green_F", 10],
["Land_HBarrier_01_line_3_green_F",10],
["zed", 10],
["Land_BarbGate", 10],
["Land_New_WiredFence_10m_F", 10],
["Land_New_WiredFence_5m_F", 10],
["Wire", 10],
["Land_New_WiredFence_pole_F", 10],
["Land_Razorwire_F", 10],
["Land_BagFence_01_corner_green_F", 10],
["Land_BagFence_01_end_green_F", 10],
["Land_BagFence_01_long_green_F", 10],
["Land_BagFence_01_round_green_F", 10],
["Land_BagFence_01_short_green_F",10],
// Air Vehicles
["RHS_UH60M", 2000],
["RHS_AH64D_wd", 5000],
["CFP_B_USSEALS_MH_6J_Little_Bird_WDL_01", 1000],
//"Static"
["RHS_Stinger_AA_pod_WD", 100],
["UK3CB_B_Static_M240_Elcan_High_US_W", 50],
["UK3CB_B_Static_M240_Elcan_Low_US_W", 50],
["RHS_M2StaticMG_WD", 50],
["RHS_M2StaticMG_MiniTripod_WD", 50],
["RHS_TOW_TriPod_WD", 100],
["RHS_MK19_TriPod_WD", 100],
["CUP_B_M252_USMC", 50],
["CUP_B_SearchLight_static_USMC", 25],
// Build Stuff
["ACE_medicalSupplyCrate",20],
["ACE_medicalSupplyCrate_advanced",25],
["ACE_Box_Chemlights",25],
["ACE_Box_82mm_Mo_Combo",25],
["ACE_Box_82mm_Mo_Illum",25],
["ACE_Box_82mm_Mo_HE",25],
["ACE_Box_82mm_Mo_Smoke",25],
["Land_WoodenBox_F",25],
["B_Slingload_01_Repair_F",100], // REPAIR
["B_Slingload_01_Fuel_F",100], // FUEL
["B_Slingload_01_Ammo_F",100], // AMMO
["B_Slingload_01_Cargo_F",100], // CONTAINER
["Land_Cargo20_IDAP_F",100],
["Land_Medevac_house_V1_F",250],
["Land_RepairDepot_01_green_F",500], // SALVAGE STATION
["Land_Cargo20_blue_F",1000], // FOB
["ACE_Track",5],
["ACE_Wheel",5],
["FlexibleTank_01_sand_F",10],
["ACE_fastropingSupplyCrate",25],
["Box_NATO_AmmoVeh_F",50],
// Enemy Vics
["rhs_btr60_vmf",450],
["rhs_btr70_vmf",450],
["rhs_btr80_vmf",450],
["rhs_btr80a_vmf",450],
["rhs_2s1_vmf",250],
["rhs_2s1_at_vmf",250],
["RHS_BM21_VMF_01",250],
["rhs_tigr_sts_vmf",250],
["rhs_tigr_sts_3camo_vmf",250],
["rhs_bmp1_vmf",450],
["rhs_bmp1d_vmf",450],
["rhs_bmp1k_vmf",450],
["rhs_bmp1p_vmf",450],
["rhs_bmp2e_vmf",450],
["rhs_bmp2_vmf",450],
["rhs_bmp2d_vmf",450],
["rhs_bmp2k_vmf",450],
["rhs_brm1k_vmf",450],
["rhs_brm1k_vmf",450],
["rhs_prp3_vmf",250],
["rhsgref_BRDM2_vmf",450],
["rhsgref_BRDM2_ATGM_vmf",450],
["rhsgref_BRDM2_HQ_vmf",450],
["rhs_mig29s_vmf",250],
["rhs_mig29sm_vmf",250],
["rhs_gaz66_zu23_vmf",250],
["RHS_Ural_Zu23_VMF_01",250]
]] call acex_fortify_fnc_registerObjects;

["acex_fortify_objectPlaced", {
  params ["_player", "_side", "_objectPlaced"];
    if (_objectPlaced isKindof "AllVehicles")then{
      _objectPlaced call btc_veh_fnc_add;
      _type = typeOf _objectPlaced;
      [_type] call btc_veh_fnc_init;
    };
    if !(_objectPlaced isKindof "AllVehicles")then{
      [_objectPlaced] call btc_log_fnc_init;
    }; 
    if (unitIsUAV _objectPlaced) then {
      createVehicleCrew _objectPlaced;
    };
    btc_global_economy = [west] call acex_fortify_fnc_getBudget;
    clearWeaponCargoGlobal _objectPlaced;
    clearMagazineCargoGlobal _objectPlaced;
    clearBackpackCargoGlobal _objectPlaced;
}] call CBA_fnc_addEventHandler;

["acex_fortify_objectDeleted", {
  params ["_player", "_side", "_objectDeleted"];
   [] spawn { sleep 5; btc_global_economy = [west] call acex_fortify_fnc_getBudget;};
  if (_objectPlaced isKindof "AllVehicles")then{
    btc_vehicles = btc_vehicles - [_objectDeleted];
  };
  if !(_objectPlaced isKindof "AllVehicles")then{
    btc_log_obj_created = btc_log_obj_created - [_objectDeleted];
  }; 
}] call CBA_fnc_addEventHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 1;
    _return
}] call ace_fortify_fnc_addDeployHandler;

["acex_fortify_onDeployStart", {
  params ["_player", "_object", "_cost"];
   _object enableSimulation false;
}] call CBA_fnc_addEventHandler;
 
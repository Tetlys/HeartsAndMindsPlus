roleArsenal = { 
	params ["_box", "_player"];

	Private _UnitRole = roleDescription _player;

	//Clear the inventory
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	clearWeaponCargoGlobal _box;

	_Role = [];

	if (_UnitRole == "Commander") then
	{_Role = "CO"};

	if (_UnitRole == "Rifleman") then
	{_Role = "RIFLEMAN"};

	if (_UnitRole == "Medic") then
	{_Role = "MEDIC"};

	if (_UnitRole == "Autorifleman") then
	{_Role = "AUTORIFLEMAN"};

	if (_UnitRole == "Engineer") then
	{_Role = "ENGINEER"};

	if (_UnitRole == "Pilot") then
	{_Role = "PILOT"};


	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];

	//Define the gear for each Role
	    Private _DefaultGear = [
        //PRIMARY
		"arifle_MX_F",
		"arifle_MX_GL_F",
		"arifle_SPAR_01_blk_F",
		"arifle_SPAR_01_GL_blk_F",
        //SECONDARY
		"hgun_P07_F",
		"ACE_VMH3",
		//LAUNCHER
		"launch_MRAWS_green_F",
		"launch_NLAW_F",
        //HELM
		"H_HelmetB",
		"H_HelmetB_camo",
		"H_HelmetB_snakeskin",
        //UNIFORM
		"U_B_CombatUniform_mcam",
        //VEST
		"V_PlateCarrier1_rgr",
		"V_PlateCarrier2_rgr",
		"V_PlateCarrierSpec_rgr",
        //BACKPACK
		"B_Carryall_mcamo",
		//NVGS		
		"ACE_NVG_Gen4",
        //BINOCULARS
		"Rangefinder",
        //SIGHTS
		"optic_Aco",
		"ACE_optic_Arco_2D",
		"ACE_optic_Arco_PIP",
		"optic_Holosight_blk_F",
		"optic_MRCO",
		"optic_Hamr",
		"optic_ERCO_blk_F",
		//RAIL
		"acc_pointer_IR",	
		"ACE_acc_pointer_green",
		//MUZZLE
		"ACE_muzzle_mzls_H",
		"muzzle_snds_H",
		"ACE_muzzle_mzls_L",
		"muzzle_snds_M",
		//BIPOD
		"bipod_01_F_blk",
		"bipod_01_F_mtp",
		//PRIMARYAMMO
		"30Rnd_65x39_caseless_mag",
		"30Rnd_556x45_Stanag",
		"200Rnd_65x39_cased_Box",
		"MRAWS_HE_F",
		"MRAWS_HEAT55_F",
		"MRAWS_HEAT_F",
		//SECAMMO
		"16Rnd_9x21_Mag",
		"1Rnd_HE_Grenade_shell",
		"UGL_FlareCIR_F",
		"1Rnd_SmokeGreen_Grenade_shell",
		"1Rnd_SmokePurple_Grenade_shell",
		"1Rnd_SmokeRed_Grenade_shell",
		"1Rnd_Smoke_Grenade_shell",
		"1Rnd_SmokeYellow_Grenade_shell",
		//GRENADES
		"ACE_Chemlight_HiGreen",
		"ACE_Chemlight_HiYellow",
		"ACE_Chemlight_IR",
		"B_IR_Grenade",
		"HandGrenade",
		"MiniGrenade",
		"SmokeShellGreen",
		"SmokeShellPurple",
		"SmokeShellRed",
		"SmokeShellYellow",
		//EXPLOSIVES
		"DemoCharge_Remote_Mag",
		"SatchelCharge_Remote_Mag",
		//TOOLS
		"ACE_DefusalKit",
		"ACE_EntrenchingTool",
		"ACE_M26_Clacker",
		"ACE_Flashlight_XL50",
		"ACE_MapTools",
		"ACE_wirecutter",
		//MEDICAL
		"ACE_fieldDressing",
		"ACE_elasticBandage",
		"ACE_packingBandage",
		"ACE_quikclot",
		"ACE_bloodIV",
		"ACE_bloodIV_250",
		"ACE_bloodIV_500",
		"ACE_bodyBag",
		"ACE_epinephrine",
		"ACE_morphine",
		"ACE_splint",
		"ACE_tourniquet",
		"ACE_surgicalKit",
		//MISC
		"ACE_CableTie",
		"ACE_EarPlugs",
		"ACE_IR_Strobe_Item",
		"ItemMap",
		"ItemCompass",
		"ItemWatch",
		"ACE_SpareBarrel",
		"ACE_SpraypaintRed",
		"ACE_Banana"
      ];

    Private _CO = [
      ];

      Private _RIFLEMAN = [
      ];

      Private _MEDIC = [
      ];

      Private _AUTORIFLEMAN = [
			"LMG_Mk200_F"
      ];

      Private _ENGINEER = [
        	"ToolKit"
      ];

      Private _PILOT = [
        	"ToolKit"
      ];

	


	switch (_Role) do {
	case "CO": {
		_GearToAdd = _DefaultGear + _CO;
	};
	case "RIFLEMAN": {
		_GearToAdd = _DefaultGear + _RIFLEMAN;
	};
	case "MEDIC": {
		_GearToAdd = _DefaultGear + _MEDIC;
	};
	case "AUTORIFLEMAN": {
		_GearToAdd = _DefaultGear + _AUTORIFLEMAN;
	};
	case "ENGINEER": {
		_GearToAdd = _DefaultGear + _ENGINEER;
	};
	case "PILOT": {
		_GearToAdd = _DefaultGear + _PILOT;
	};
	default {
		_GearToAdd = _DefaultGear + ["ACE_Banana"];
	};
	};

	[_box, false] call ace_arsenal_fnc_removeBox;
	[_box, _GearToAdd, false] call ace_arsenal_fnc_initBox;
}
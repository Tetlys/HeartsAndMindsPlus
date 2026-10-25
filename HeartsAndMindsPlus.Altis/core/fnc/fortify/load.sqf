
/* ----------------------------------------------------------------------------
Function: tet_fortify_load

Description:
    Changes the selecion category and updates t

Parameters:
    _main_class - [] 
    _sub_class - []

Returns:

Examples:
    (begin example)
        _result = [] call tet_fortify_load;
    (end)

Author:
    Tetlys

---------------------------------------------------------------------------- */ 

lbClear 81;

btc_construction_array params ["_main_class", "_sub_class"]; 
 
_cats = []; 
_cats = _cats + _main_class;
_level = 0;

// note - TO ADJUST UNLOCK LEVELS
//UNLOCK SYSTEM
[] remoteExecCall ["tet_fortify_progress", [2]];
for "_i" from (count _main_class) to 0 step -1 do {
    switch (_i) do {
        case 1: {
            //_level = 10;
            _level = 10;
        };
        case 2: {
            //_level = 25;
            _level = 20;
        };
        case 3: {
            //_level = 40;
            _level = 35;
        };
        case 4: {
            //_level = 55;
            _level = 45;
        };
        case 5: {
            //_level = 70;
            _level = 55;
        };
        default {
            _level = 0;
        };
    };
   if (_level >= VictoryPercentage) then {
       _cats deleteAt _i;
   };
};

// Add categories
for "_i" from 0 to ((count _cats) - 1) do {
    private _lb = lbAdd [81, _cats select _i];
    if (_i isEqualTo 0) then {
        lbSetCurSel [81, _lb];
    };
};

// Title funds bar
_ecom = ["FUNDS: [$", btc_global_economy, "]"] joinString "";
lbAdd [84, _ecom];

// Add items to categories
private _category = _sub_class select 0;
lbClear 82;
for "_i" from 0 to ((count _category) - 1) do {
    private _class = _category select _i;
    private _display = getText (configFile >> "cfgVehicles" >> _class >> "displayName");

	private _classname = _display;

    // Modify display name
    switch (_class) do {
        case "Land_Cargo20_blue_F": {
            _classname = "FOB Deployment Crate";
        };
        case "Land_Cargo20_IDAP_F": {
            _classname = "Side Mission Supplies";
        };
        case "Land_RepairDepot_01_green_F": {
            _classname = "Salvage Station";
        };
        case "C_supplyCrate_F": {
            _classname = "Arsenal";
        };
        default {
            _classname = _display;
        };
    };

        //ICON
    _icon = getText ( configFile >> "cfgVehicles" >> _class >> "icon");
    if(isText  (configFile >> "CfgVehicleIcons" >> _icon)) then {
        _icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
    };
    
    // Modify display to add cost
    _cost = [west, _class] call ace_fortify_fnc_getCost;

    _costdisplay = [" [$", _cost, "]"] joinString "";

    _padString = { 
        params ["_input", "_desiredLength"]; 
        
        private _currentLength = count _input; 
        private _padding = _desiredLength - _currentLength; 
        
        // Create the padding string as an array of spaces 
        private _paddingArray = []; 
        for "_i" from 1 to _padding do { 
            _paddingArray pushBack " "; 
        }; 
        
        private _paddingString = _paddingArray joinString ""; 
        _input = _input + _paddingString; 
        
        _input 
    };

    private _paddedcostdisplay = [(format ["%1", _costdisplay]), 10] call _padString;
    
    _displayout = [_paddedcostdisplay, _classname] joinString "";
    
    private _index = lbAdd [82, _displayout];
    lbSetPictureRight [82, _index, _icon];
    lbSetData [82, _index, _class];
    if (_i isEqualTo 0) then {lbSetCurSel [82, _index];};
};
true


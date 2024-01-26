[player] remoteExec ["requestResupplyFlags", 2];

{
    private _box = _x;
    if (!isNull _box) then 
    {
        [_box, player] call roleArsenal;
    };
} forEach ARSENAL_CRATES;

//SUPPORT CODE
/*
Private _UnitRole = roleDescription player;

if (_UnitRole == "Commander") then {
[player, BIS_requesterMod, BIS_providerMod] call BIS_fnc_addSupportLink;
};
*/
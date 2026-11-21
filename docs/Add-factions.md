# Add an optional faction

The mission includes a list of supported enemy factions. You can extend this list to include factions from optional mods.

The faction mod must be loaded on the server and every player's client. Adding a faction does not automatically add its mod as a mission dependency.

## 1. Find the faction class name

1. Install and load the faction mod alongside the required mods listed in the root [README](../README.md).
2. Start a local test mission with the faction mod loaded.
3. Open the debug console and execute this command locally:

   ```sqf
   copyToClipboard str (["EN"] call btc_fnc_get_class);
   ```

4. Paste the copied result into a text editor.

The command returns four arrays containing faction information:

- **First array:** Author or publisher names.
- **Second array:** Display labels for the mission parameter.
- **Third array:** Faction class names.
- **Fourth array:** Numeric parameter values.

You will use the faction class name, display label and numeric value when editing the mission.

## 2. Add the faction to the mission

Open:

`HeartsAndMindsPlus.Altis/core/def/mission.sqf`

Find the enemy faction list near the end of the file, under the enemy faction configuration section:

```sqf
private _allfaction = ["IND_F","OPF_F","BLU_CTRG_F", ...]; //All factions
```

This is the list of faction class names available to the mission.

Add your new faction's class name to this array. For example, if your faction class is `MY_CUSTOM_FACTION`:

```sqf
private _allfaction = ["IND_F","OPF_F","BLU_CTRG_F", ...,"MY_CUSTOM_FACTION"]; //All factions
```

Do not remove the existing entries. The order of this list must match the entries in the mission parameter.

The mission uses this array to select the faction chosen in the lobby and passes it to `btc_mil_fnc_class`, which builds the unit and vehicle class lists used by the gamemode.

## 3. Add the faction to the mission parameter

Open:

`HeartsAndMindsPlus.Altis/core/def/param.hpp`

Find the `class btc_p_en` section under the faction options heading:

```cpp
class btc_p_en { // Enemy type
```

This section contains two arrays:

- `values[]` — numeric values used to identify each faction option.
- `texts[]` — the labels displayed to players in the mission lobby.

Add your new faction's numeric value to `values[]` and its matching display label to `texts[]`.

For example, if the next available value is `211`:

```cpp
values[]={0,1,2,3, ... ,210,211};

texts[]={
    "0 - Bohemia Interactive: AAF (Side: GUER)",
    "1 - Bohemia Interactive: CSAT (Side: EAST)",
    ...
    "210 - UK3CB: ChDKZ (Side: GUER)",
    "211 - My Mod: My Custom Faction (Side: EAST)"
};
```

The example is abbreviated. Keep all existing entries and add your new entry at the end of both arrays.

The numeric value, display label and faction class name must refer to the same faction and occupy the same position in their respective lists.

## 4. Test the faction

1. Save the edited mission.
2. Make sure the faction mod is loaded on the server and all clients.
3. Start the mission and open the multiplayer lobby parameters.
4. Select the newly added enemy faction.
5. Start the mission and confirm that the faction's units spawn correctly.

If the faction does not appear in the lobby, check the `values[]` and `texts[]` arrays. If the mission starts but units do not spawn correctly, check the faction class name and whether the mod is loaded.

**Important:** Adding a faction to the enemy list does not guarantee that every unit or vehicle category will be populated. The faction must contain compatible class definitions for the gamemode's spawning system.
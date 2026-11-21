# Add an optional faction

The public mission includes faction choices supported by the currently loaded game and mods. Use this guide only when you want to add a faction from an optional mod. The mod must be loaded on the server and every player's client.

## Find a faction's class name

1. Install and load the faction mod alongside the required mods listed in the root [README](../README.md).
2. Start a local test mission and open the debug console. Run this client-side discovery command:

   ```sqf
   copyToClipboard str (['EN'] call btc_fnc_get_class);
   ```

3. Paste the result into a text editor. Identify the faction class name and the text label/value pair for the mission parameter. Do not run this command on a live server; it copies data to your local clipboard.

<!-- Screenshot: local test mission debug console displaying faction class discovery output. Teaches how to collect class names for an optional faction. Optional. -->

## Add it to the mission

1. Back up the mission and open a working copy of `HeartsAndMindsPlus.Altis/core/def/mission.sqf` and `core/def/param.hpp`.
2. Add the faction class to the enemy faction list in [`mission.sqf`](../HeartsAndMindsPlus.Altis/core/def/mission.sqf#L766).
3. Add a matching display label and numeric value to the faction parameter's `texts[]` and `values[]` in [`param.hpp`](../HeartsAndMindsPlus.Altis/core/def/param.hpp#L146).
4. Keep the class, label, and value entries in the same order. Start the edited mission with the faction mod loaded on server and clients, select the new faction in the lobby, and verify its units spawn as intended.

The exact source line can move as the mission changes; use the linked configuration section and confirm its surrounding parameter/list names before editing. For ordinary server setup, choose one of the factions already offered in the lobby instead.

# Change the player faction

This is a mission edit. Make a copy of the mission before changing playable sides and test it locally before publishing.

1. Open a copy of `mission.sqm` in Eden Editor and move the playable slots to the side you intend players to use.
2. Use the respawn marker name that matches that side (for example, the corresponding side's `respawn_*` marker). Make sure the marker exists and is positioned at the intended spawn.
3. In `core/def/mission.sqf`, set [`btc_player_side`](../HeartsAndMindsPlus.Altis/core/def/mission.sqf#L475) and [`btc_respawn_marker`](../HeartsAndMindsPlus.Altis/core/def/mission.sqf#L476) to match the slots and marker in `mission.sqm`.
4. In the mission lobby, select an enemy faction whose side is different from the player side.
5. Start the mission and verify that players can select a slot, respawn at the intended location, and see the correct friendly and enemy factions.

<!-- Screenshot: Eden Editor playable slots and matching respawn marker. Teaches how slot side and respawn location are matched. Optional. -->

**Role-name warning:** If you rename playable units or change their role descriptions in Eden, update the corresponding description mappings in `core/def/rolearsenal.sqf`. Keep the names aligned so each role receives its intended arsenal. See [Arsenal and loadouts](ARSENAL-AND-LOADOUTS.md).

For enemy and civilian faction options, see [Add factions](Add-factions.md).

# Using Hearts and Minds Plus on another map

Hearts and Minds Plus supports most Arma 3 maps. Map location data is not consistent: some maps may use different location types or provide too few named points for the mission to work as intended. A map needs at least some usable location points. When its built-in locations are unsuitable, add points manually through `btc_custom_loc`.

## Start from the current mission

1. Obtain the current public mission from the [H&M Plus releases](https://github.com/Tetlys/HeartsAndMindsPlus/releases).
2. Open the mission in Eden Editor with the target map and its required map content loaded.
3. Save a separate copy of the mission for the target map. Keep the map suffix in the mission folder name consistent with the target terrain, as Arma uses it to identify the mission world.
4. Move the base and check the `btc_base` marker on the target map.
5. Check that the map provides usable named locations. Add custom points if needed, then test city activation, hideout placement, caches, and side missions.
6. Package and install the tested mission on the server.

<!-- Screenshot: Eden Editor showing the target terrain, base, and btc_base marker. Teaches how to position the new map mission. Essential. -->

## Adding custom location points

`btc_custom_loc` is declared in [`define_mod.sqf`](../HeartsAndMindsPlus.Altis/define_mod.sqf#L1-L9). It is an empty array in the public Altis mission. The comments show the expected point fields: position, location type, display name, radius, whether it starts occupied, and a unique location index. Use the location types listed in that file and select indexes that do not collide with map-provided points.

Some maps use location types the hideout logic does not currently select. Review [`core/fnc/hideout/create.sqf`](../HeartsAndMindsPlus.Altis/core/fnc/hideout/create.sqf#L50) and the target map’s available location types before deciding whether to add a custom point or adjust the supported type list. This is a mission edit and should be tested on the target map.

For smaller maps, review the hideout safe-zone configuration in [`core/def/mission.sqf`](../HeartsAndMindsPlus.Altis/core/def/mission.sqf#L169) as well.

<!-- Screenshot: define_mod.sqf custom-location point with position, type, name, radius, occupancy, and index fields identified. Teaches how to add a map point when built-in map data is unsuitable. Essential. -->

For background on the original location system, see the [Bohemia Interactive forums discussion](https://forums.bohemia.net/forums/topic/165948-mp-btc-hearts-and-minds/?page=39&tab=comments#comment-3280136). That discussion describes the upstream project; the current H&M Plus source remains the reference for this mission.

# Performance-related settings

The mission exposes several population controls in the lobby parameters. They affect how much activity the mission attempts to create; the repository does not provide tested player-count recommendations or a universal best setting for every map and server.

| Parameter area | What it controls | Where to inspect |
|---|---|---|
| Occupied city density | Fraction of map locations selected as occupied | `core/def/param.hpp` (`btc_p_density_of_occupiedCity`) and `core/def/mission.sqf` |
| Enemy density and building population | Enemy group ratio and the share of military placed in buildings | `btc_p_mil_group_ratio`, `btc_p_wp_houseDensity` |
| Static enemy and civilian density | Spawn ratios for static groups and civilians | `btc_p_mil_static_group_ratio`, `btc_p_civ_group_ratio` |
| Animal density | Animal spawn ratio | `btc_p_animals_group_ratio` |
| Patrol limits | Maximum military patrols and civilian vehicle patrols | `btc_p_patrol_max`, `btc_p_civ_max_veh` |
| Armed vehicles | Whether armed vehicles can be added to hideouts and other mission sites | `btc_p_veh_armed_ho`, `btc_p_veh_armed_spawn_more` |
| City radius offset | Additional radius applied to city spawning | `btc_p_city_radiusOffset` |

Defaults and allowed values are declared in [`core/def/param.hpp`](../HeartsAndMindsPlus.Altis/core/def/param.hpp); runtime conversions are in [`core/def/mission.sqf`](../HeartsAndMindsPlus.Altis/core/def/mission.sqf). Lower density settings reduce requested population, but the actual performance effect depends on the terrain, player distribution, and active systems. Test one change at a time and compare server RPT/performance observations under similar conditions.

<!-- Screenshot: mission lobby showing spawn-density and patrol options. Teaches which population controls administrators can tune. Optional. -->

For general mission setup, see [Installation](INSTALLATION.md) and [Mission parameters](PARAMETERS.md). Do not publish a recommended player count or fixed parameter preset until it has been tested on representative hardware and maps.

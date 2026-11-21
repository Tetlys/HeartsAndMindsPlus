# Configure your mission

Use this page to find the right setting for your community. Start with the lobby parameters for normal server setup. Edit the mission files only when you need to change mission content or defaults.

## Choose what to configure

| You want to… | Start here |
|---|---|
| Choose campaign, spawning, faction, or gameplay settings | [Mission parameters](PARAMETERS.md) |
| Change role-specific equipment | [Arsenal and loadouts](ARSENAL-AND-LOADOUTS.md) |
| Choose vehicles and build-menu objects | [Build menu and vehicles](Add-vehicle-or-boat-to-H%26M-system.md) |
| Change default player permissions | [Player permissions](PERMISSIONS.md#configure-default-permissions) |
| Choose enemy or civilian factions | [Faction guide](Add-factions.md) |
| Change the playable side or roles | [Player faction and roles](faction_player.md) |
| Run the mission on another map | [Map setup](Change-MAP-of-Hearts-and-Minds.md) |
| Adjust population-related settings | [Performance settings](PERFORMANCE.md) |

## Set lobby parameters

Open the mission lobby and select the options for your server. The parameter names, choices, and defaults are described in [Mission parameters](PARAMETERS.md). Some options are deprecated and marked as such; they are temporary legacy controls and are planned for removal. Avoid relying on them for a new setup.

<!-- Screenshot: lobby parameter group headings and example choices. Teaches where community-facing settings are selected. Essential. -->

## Vehicle and construction progression

The build menu unlocks higher vehicle/construction categories as the campaign's `VictoryPercentage` rises. This value is calculated from the number of occupied locations compared with all registered city locations: as more locations are cleared, campaign progress increases.

The current thresholds are set in `HeartsAndMindsPlus.Altis/core/fnc/fortify/load.sqf`. A category remains locked while `VictoryPercentage` is at or below its threshold; it appears after progress rises above that value.

| Category index | Build-menu category | Unlock threshold |
|---:|---|---:|
| 1 | Standard | More than 10 VictoryPercentage |
| 2 | Light | More than 20 VictoryPercentage |
| 3 | Medium | More than 35 VictoryPercentage |
| 4 | Heavy | More than 45 VictoryPercentage |
| 5 | Super Heavy | More than 55 VictoryPercentage |

These values are points on the mission's 0–100 campaign-progress scale. For example, the Standard category appears once progress is above 10; being exactly at 10 does not unlock it.

To change the thresholds for your community, edit the `_level` value in the matching `case` in `core/fnc/fortify/load.sqf` on a copy of the mission. Category names and their arrays are ordered in `core/def/mission.sqf`; keep those entries aligned if you add or reorder categories. Test the unlock behavior at the threshold boundaries before uploading your mission.

<!-- Screenshot: construction menu showing a newly unlocked category and current campaign progress. Teaches how progression appears to players. Optional. -->

## Edit a mission copy

To change content not exposed as a lobby option, copy the mission folder, open the copy in Eden Editor, make the change, and test it before uploading. Keep a clean release copy so you can compare or restore your work.

**Role-name warning:** If you change a playable unit's name or role description in Eden, update the corresponding description mapping in `HeartsAndMindsPlus.Altis/core/def/rolearsenal.sqf`. The role arsenal matches these descriptions to the equipment lists; mismatched names can result in the wrong or no role-specific arsenal.

The main configuration files are:

| File | Use |
|---|---|
| `HeartsAndMindsPlus.Altis/core/def/param.hpp` | Lobby parameter names and available choices. |
| `HeartsAndMindsPlus.Altis/core/def/mission.sqf` | Mission defaults and configuration lists, including faction and build-menu lists. |
| `HeartsAndMindsPlus.Altis/core/def/rolearsenal.sqf` | Current role arsenal mappings and equipment lists. |
| `HeartsAndMindsPlus.Altis/core/fnc/fortify/load.sqf` | Vehicle/construction category unlock thresholds. |
| `HeartsAndMindsPlus.Altis/core/fnc/ui/init.sqf` | Default permission values for players without an existing permission record; see [Player permissions](PERMISSIONS.md#configure-default-permissions). |
| `HeartsAndMindsPlus.Altis/define_mod.sqf` | Map custom-location points. Do not use its legacy loadout arrays; those are deprecated. |
| `HeartsAndMindsPlus.Altis/mission.sqm` | Eden mission content, playable slots, and markers. |

<!-- Screenshot: Eden Editor open on a working mission copy, with the playable unit attributes visible. Teaches where to edit a role description. Essential. -->

See [Installation](INSTALLATION.md) and [Debugging](DEBUGGING.md).

# Configure your mission

Use this page to find the right setting for your community. Start with the lobby parameters for normal server setup. Edit the mission files only when you need to change mission content or defaults.

## Choose what to configure

| You want to… | Start here |
|---|---|
| Choose campaign, spawning, faction, or gameplay settings | [Mission parameters](PARAMETERS.md) |
| Change role-specific equipment | [Arsenal and loadouts](ARSENAL-AND-LOADOUTS.md) |
| Choose vehicles and build-menu objects | [Build menu and vehicles](Add-vehicle-or-boat-to-H%26M-system.md) |
| Change player permissions | [Player permissions](PERMISSIONS.md) |
| Choose enemy or civilian factions | [Faction guide](Add-factions.md) |
| Change the playable side or roles | [Player faction and roles](faction_player.md) |
| Run the mission on another map | [Map setup](Change-MAP-of-Hearts-and-Minds.md) |
| Adjust population-related settings | [Performance settings](PERFORMANCE.md) |

## Set lobby parameters

Open the mission lobby and select the options for your server. The parameter names, choices, and defaults are described in [Mission parameters](PARAMETERS.md). Some options are deprecated and marked as such; they are temporary legacy controls and are planned for removal. Avoid relying on them for a new setup.

<!-- Screenshot: lobby parameter group headings and example choices. Teaches where community-facing settings are selected. Essential. -->

## Edit a mission copy

To change content not exposed as a lobby option, copy the mission folder, open the copy in Eden Editor, make the change, and test it before uploading. Keep a clean release copy so you can compare or restore your work.

**Role-name warning:** If you change a playable unit's name or role description in Eden, update the corresponding description mapping in `HeartsAndMindsPlus.Altis/core/def/rolearsenal.sqf`. The role arsenal matches these descriptions to the equipment lists; mismatched names can result in the wrong or no role-specific arsenal.

The main configuration files are:

| File | Use |
|---|---|
| `HeartsAndMindsPlus.Altis/core/def/param.hpp` | Lobby parameter names and available choices. |
| `HeartsAndMindsPlus.Altis/core/def/mission.sqf` | Mission defaults and configuration lists, including faction and build-menu lists. |
| `HeartsAndMindsPlus.Altis/core/def/rolearsenal.sqf` | Current role arsenal mappings and equipment lists. |
| `HeartsAndMindsPlus.Altis/define_mod.sqf` | Map custom-location points. Do not use its legacy loadout arrays; those are deprecated. |
| `HeartsAndMindsPlus.Altis/mission.sqm` | Eden mission content, playable slots, and markers. |

<!-- Screenshot: Eden Editor open on a working mission copy, with the playable unit attributes visible. Teaches where to edit a role description. Essential. -->

Before publishing, load the required mods listed in the root [README](../README.md), verify the edited feature in a multiplayer test, and check the server RPT for errors. Keep server passwords and private player or connection details out of public files. See [Installation](INSTALLATION.md) and [Debugging](DEBUGGING.md).

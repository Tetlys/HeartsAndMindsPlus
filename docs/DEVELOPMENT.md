# Development

This guide is for mission editors and contributors working from the public repository. It assumes basic familiarity with Arma 3 and Eden Editor; the guides linked here explain common edits without requiring readers to write SQF for ordinary setup.

## Repository layout

| Path | Contents |
|---|---|
| `HeartsAndMindsPlus.Altis/mission.sqm` | Eden-authored mission world, objects, markers, slots, and layers. |
| `HeartsAndMindsPlus.Altis/init.sqf` | Mission entry point and H&M Plus integrations. |
| `HeartsAndMindsPlus.Altis/core/init*.sqf` | Shared, server, player, and headless-client initialization. |
| `HeartsAndMindsPlus.Altis/core/def/` | Mission defaults, lobby parameters, and active role arsenal definitions. |
| `HeartsAndMindsPlus.Altis/core/fnc/` | Mission gameplay systems and helper functions. |
| `HeartsAndMindsPlus.Altis/define_mod.sqf` | Map-specific custom location points. Its legacy loadout definitions are deprecated. |
| `HeartsAndMindsPlus.Altis/stringtable.xml` | Localized text used by the mission and lobby. |
| `HeartsAndMindsPlus.Altis/VAM_GUI/` | Bundled Virtual Arsenal Manager component and its documentation/license. |
| `docs/` | Public setup, configuration, and customization guides. |

## Initialization overview

The root mission [`init.sqf`](../HeartsAndMindsPlus.Altis/init.sqf) calls `core/init.sqf` through CBA. Core initialization disables ordinary mission saving, loads mission and mod configuration, then starts server and shared initialization. It starts player initialization for interface clients and headless-client initialization for a headless client. The server initialization handles campaign state, cities, tasks, vehicles, and side missions. This summary is for orientation; the source code is authoritative for exact ordering and conditions.

## Editing and packaging

1. Work on a separate copy of the mission and preserve the release copy.
2. Make small changes and record the files changed.
3. Load the required mods from the root README and test in Eden or a local multiplayer server as appropriate.
4. Check the server RPT for new errors and verify the affected behavior in game.
5. Package the mission as a PBO and test that packaged copy before distributing it.

For file-specific setup, see [Configuration](CONFIGURATION.md) and the customization guides in the [documentation index](README.md).

**Role-name warning:** If you change playable unit names or role descriptions in Eden, update the matching role checks in `core/def/rolearsenal.sqf`. The descriptions must stay aligned for players to receive the intended role arsenal.

<!-- Screenshot: Eden Editor with a playable unit's role description and the corresponding rolearsenal.sqf mapping. Teaches editors to keep the descriptions consistent. Essential. -->

## External references

- [Arma 3 Tools](https://community.bistudio.com/wiki/Arma_3%3A_Tools) and [Tools Installation](https://community.bistudio.com/wiki/Arma_3_Tools_Installation)
- [Description.ext](https://community.bistudio.com/wiki/Description.ext)
- [ACE3 installation guide](https://github.com/acemod/ACE3/blob/master/docs/wiki/user/installation-guide.md)
- [CBA_A3 project](https://github.com/CBATeam/CBA_A3)

# Hearts and Minds Plus

Hearts and Minds Plus is a community-developed continuation of the original Arma 3 Hearts and Minds gamemode, created by [vdauphin](https://vdauphin.github.io/HeartsAndMinds/).

Developed by Tetlys, Hearts and Minds Plus builds upon the original work, introducing new gameplay systems, features, improvements and customisation options while continuing to evolve the original experience.

Featuring an expanded economy, custom UI, vehicle and construction progression, enhanced air support, persistent player systems and much more.

Play with us on The EDEN Community server, or explore the project and help develop the gamemode.

[![GitHub Release](https://img.shields.io/github/v/release/Tetlys/HeartsAndMindsPlus?include_prereleases&color=success)](https://github.com/Tetlys/HeartsAndMindsPlus/releases/tag/v1.0.0)
[![Join our Discord](https://img.shields.io/badge/Discord-Join%20The%20EDEN%20Community-5865F2?logo=discord&logoColor=white)](https://discord.gg/7TXaQa7sEv)

## Join The EDEN Community

Players are welcome to join us and experience Hearts and Minds Plus on The EDEN Community server. Join the Discord for the server password, announcements, events, community discussion, and the latest server information.

### Game Server

- **IP:** 92.42.46.91
- **Port:** 2302
- **Password:** See Discord

### TeamSpeak 3

- **IP:** 92.42.46.91

[Join The EDEN Community Discord](https://discord.gg/7TXaQa7sEv)

## Features

### Gameplay and Progression

- **Dynamic Economy:** Earn and spend mission funds through kills, side missions, salvage, and recovery.
- **Vehicle Salvage:** Salvage eligible enemy vehicles to earn funds.
- **Build System:** Construct at FOBs using the mission economy.
- **Vehicle and Construction Progression:** Unlock additional categories in the construction menu as campaign progress increases. Unlock thresholds can be configured in [`core/fnc/fortify/load.sqf`](HeartsAndMindsPlus.Altis/core/fnc/fortify/load.sqf).
- **Dog Tag Trading:** Trade collected dog tags for reputation.
- **Persistent Scoreboard:** Keep track of player kills and reputation.

### Player Systems

- **Custom UI:** Use the mission's custom interfaces to interact with its systems.
- **Role-Specific Arsenal:** Access equipment tailored to different roles.
- **Permissions System:** Manage player permissions for building, salvage, command, flight, and armour.
- **Vehicle Appearance Manager:** Change vehicle appearance at the spawn logic point and keep the selected appearance.

**Default Permissions:** See the [Player Permissions guide](docs/PERMISSIONS.md) for how to configure the defaults in [`core/fnc/ui/init.sqf`](HeartsAndMindsPlus.Altis/core/fnc/ui/init.sqf).

### Combat and Support

- **Close Air Support (CAS):** Air support includes laser, smoke, and tracking effects, with rules of engagement and collateral-damage responses.
- **Vehicle-Borne IEDs (VBIEDs):** VBIEDs can spawn in response to player actions.
- **Improved VIV and Object Loading:** Improvements to vehicle-in-vehicle transport and object loading.

### Mission Improvements

- **Player Scaling:** Mission systems include player-scaling features.
- **Updated String Table and Side Missions:** Updated mission text and side-mission content.
- **Modified and Improved Map Markers:** Map markers are adjusted for larger multiplayer groups.
- **Building Damage Modifiers:** Adjusted for larger full-warfare scenarios.
- **Automation:** Quality-of-life improvements for mission creators, including automatic handling of enemy vehicles for the salvage system.

*Some features are limited to the latest builds.*

## Deprecated Features

- Per Player Slot Persistence
- Auto Loadout
- Arsenal on Death Screen

## Help and Contributions

Need help setting up Hearts and Minds Plus, found an issue, or have an idea for improving the gamemode?

Join The EDEN Community Discord to ask questions, share feedback and get involved in development.

[Join the Discord](https://discord.gg/7TXaQa7sEv)

## Coming Soon

- Dynamic objective sounds
- Dynamic civilian interaction improvements
- Removal of selectively deprecated code

## Installation

1. [Download the official full release](https://github.com/Tetlys/HeartsAndMindsPlus/releases/tag/v1.0.0).
2. Install the required mods:
   - [CBA](https://github.com/CBATeam/CBA_A3/releases)
   - [ACE](https://ace3.acemod.org/)
   - [HeartsAndMindsPlusCompat](https://steamcommunity.com/sharedfiles/filedetails/?id=3071188942)

## Documentation

The documentation helps other communities install, configure, and customise their own Hearts and Minds Plus server. The [Configuration Guide](docs/CONFIGURATION.md) explains vehicle and construction progression, and the [Player Permissions guide](docs/PERMISSIONS.md) explains default player permissions. Start with the [documentation index](docs/README.md), then see the [installation guide](docs/INSTALLATION.md) and [mission parameter reference](docs/PARAMETERS.md).

## Quick Start

1. Install the required mods listed above.
2. Join The EDEN Community game server.
3. Visit the [EDEN Community Discord](https://discord.gg/7TXaQa7sEv) for the password and latest server information.
4. Get involved with the community and its operations.

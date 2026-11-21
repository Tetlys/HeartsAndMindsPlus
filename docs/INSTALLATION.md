# Install H&M Plus on a Windows server

This guide assumes Arma 3 Dedicated Server is already installed and running on Windows. It covers installing the public Altis mission, editing a copy in Eden, and checking the first launch.

## Before you start

- A Windows Arma 3 dedicated server with access to its mission files and server configuration.
- The mission release from [H&M Plus releases](https://github.com/Tetlys/HeartsAndMindsPlus/releases).
- The required mods listed in the root [README](../README.md): [CBA_A3](https://github.com/CBATeam/CBA_A3/releases), [ACE3](https://ace3.acemod.org/), and [HeartsAndMindsPlusCompat](https://steamcommunity.com/sharedfiles/filedetails/?id=3071188942). Install the same required mods on the server and every client.
- Arma 3 Tools and Addon Builder if you need to package an edited mission. See the official [Arma 3 Tools](https://community.bistudio.com/wiki/Arma_3:_Tools) page.

<!-- Screenshot: Arma 3 Launcher mod preset with the three README-required mods enabled. Teaches which mods to load. Essential. -->

## Install and prepare the mission

1. Download the mission release and extract its mission folder if it is provided as an archive. The included terrain is Altis; its folder is `HeartsAndMindsPlus.Altis`.
2. To edit the mission, open that folder in Eden Editor with Arma 3 and the required mods loaded. Save a separate working copy before changing anything.
3. Review the [mission parameters](PARAMETERS.md) and choose settings for your community. The lobby defaults are usable as a starting point; check restart and persistence settings before going live.
4. If you change playable unit names or role descriptions in Eden, update the matching role description mapping in `HeartsAndMindsPlus.Altis/core/def/rolearsenal.sqf`. The arsenal uses those descriptions to decide which role equipment to show. See [Arsenal and loadouts](ARSENAL-AND-LOADOUTS.md).
5. Save the mission. If the release already contains a ready-to-run PBO, use it as supplied. Otherwise, build a PBO from the mission folder with Addon Builder, preserving the mission folder contents and structure.
6. Copy the PBO to the server's `mpmissions` directory. Select the mission in the server mission cycle or mission selection and start it.

<!-- Screenshot: Eden Editor showing the Altis mission open, playable slots, and the mission name. Teaches how to open and identify the mission before editing. Essential. -->
<!-- Screenshot: Windows server mpmissions directory showing the H&M Plus PBO. Teaches where to upload the packaged mission. Essential. -->

## Set lobby parameters

At mission start, review the lobby parameters before players join. See [Mission parameters](PARAMETERS.md) for descriptions and defaults. In particular, confirm the campaign loading/saving choices and any automatic restart or shutdown options.

Automatic server commands require the matching server-command password to be configured in the server's private configuration. Set it privately on the server; do not put the password in the public mission or documentation. For server configuration details, use Bohemia Interactive's [Dedicated Server guide](https://community.bistudio.com/wiki/Arma_3:_Dedicated_Server).

<!-- Screenshot: mission lobby parameter groups, with private values obscured. Teaches where to select the mission settings. Essential. -->

## Start and verify

1. Start the mission with the required mods loaded on both server and clients.
2. Confirm the mission loads without a missing-addon warning or script error.
3. Join as a player, select a role, and check that the role arsenal is available.
4. At the base, open the ACE self-interaction menu and choose **Build Menu**. Confirm the menu shows available objects and costs. The build menu requires a build zone near an FOB flag.
5. Check that players can use the expected mission interactions and that the selected parameters are active.
6. If something fails, use [Debugging](DEBUGGING.md). Redact addresses, passwords, player UIDs, and other private information before sharing logs.

<!-- Screenshot: ACE self-interaction menu with Build Menu selected at the FOB. Teaches how a player opens the build and vehicle menu. Essential. -->
<!-- Screenshot: successful mission start with role selection or base view. Teaches what a working first launch looks like. Optional. -->

## Official setup references

- [Arma 3 Dedicated Server](https://community.bistudio.com/wiki/Arma_3:_Dedicated_Server) — installing and configuring an existing dedicated server; referenced here.
- [Arma 3 Tools](https://community.bistudio.com/wiki/Arma_3:_Tools) — mission packaging tools; referenced here.
- [ACE3](https://ace3.acemod.org/) — official ACE3 documentation and installation links; required mod, referenced here.
- [CBA_A3 releases](https://github.com/CBATeam/CBA_A3/releases) — official CBA releases; required mod, referenced here.

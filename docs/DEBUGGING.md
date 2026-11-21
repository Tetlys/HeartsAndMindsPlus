# Troubleshooting and debug console

Use these checks to collect evidence when the mission fails to start or a system behaves unexpectedly. For an issue you cannot resolve, collect the mission version, terrain, required mods, relevant lobby settings, reproduction steps, and a server RPT excerpt.

## First checks

1. Confirm the server and clients have the required mods listed in the root [README](../README.md), enabled in the same mod set.
2. Confirm the selected mission matches the terrain and the PBO is in the server's `mpmissions` folder.
3. Check that the lobby parameters match the mission copy you intended to start.
4. Read the dedicated-server RPT around mission startup and the time of the problem. Include the first relevant error and nearby lines.
5. Before sharing logs, redact server addresses, passwords, player UIDs, machine names, and other private information.

<!-- Screenshot: redacted server RPT excerpt with a startup timestamp and nearby error context. Teaches where to find useful error evidence. Essential. -->

## Common symptoms

| Symptom | Check |
|---|---|
| Mission is missing or fails to start | Confirm the PBO/terrain, `mpmissions` location, and required mods. Check the startup RPT for missing addons or errors. |
| Arsenal has the wrong role equipment | Check that the Eden role description matches the entry in `core/def/rolearsenal.sqf`. See [Arsenal and loadouts](ARSENAL-AND-LOADOUTS.md). |
| Build menu is unavailable | Check that you are near an FOB flag and have Build permission. See [Build menu and vehicles](Add-vehicle-or-boat-to-H%26M-system.md) and [Permissions](PERMISSIONS.md). |
| Map locations or objectives are missing | Some maps need custom location points. The mission needs at least some usable points. See [Map setup](Change-MAP-of-Hearts-and-Minds.md). |

## Debug Console Command Log

### Reputation and campaign status

**Display current victory percentage and global reputation** — Execution context: **Global**. 

```sqf
_displayReputationAndVictory = {
    private _btcRep = floor btc_global_reputation;
    private _victoryPct = floor VictoryPercentage;
    private _message = format [
        "Reputation: %1 | Victory Percentage: %2%%",
        _btcRep,
        _victoryPct
    ];
    [_message] call CBA_fnc_notify;
};
[] call _displayReputationAndVictory;
```

**Add 100 global reputation without a scoreboard reward** — Execution context: **Global**.

```sqf
btc_global_reputation = btc_global_reputation + 100
```

### Tickets and economy

**Give one additional ticket** — Execution context: **Global**.

```sqf
[west, 1, west] call btc_respawn_fnc_addTicket;
```

**Add $100 to the economy** — Execution context: **Global**.

```sqf
[100] call tet_fortify_eco
```

### IEDs and VBIEDs

**Turn an AI unit into a suicide bomber** — Execution context: **Object**.

```sqf
[_this] call btc_ied_fnc_suiciderLoop;
```

**Spawn a VBIED nearby** — Execution context: **Server**.

```sqf
[] call btc_vbeid_fnc_spawner;
```

**Create a large explosion** — Execution context: **Object**.

```sqf
[_this, _this] call btc_ied_fnc_boom;
```

### Vehicle Appearance Manager

**Reboot the appearance manager** — Execution context: **Global**.

```sqf
[] execVM "VAM_GUI\VAM_GUI_init.sqf";
```

### Zeus and admin notes

- Never delete anything spawned by the server.
- Do not change AI group or unit waypoints. If this is done by mistake, kill those units.
- Only Bluefor players and assets may be moved using Zeus.
- Do not spawn Opfor units or assets.
- Objects placed by zeus will save and have the correct code on them only if they are in the build menu.

### Force Objective Clearing


1. activate the point, kill the units using 'end' , and wait for the point to flip.
2. If it does not flip, leave activation range, deactivate and repeat.
3. If it fails, restart, then repeat.

### Wreck Repair Routine

1. Drag the wreck to the logic point.
2. Repair it.
3. Refund the economy.

For other setup issues, see [Installation](INSTALLATION.md), [Mission parameters](PARAMETERS.md), and [Configuration](CONFIGURATION.md).

# Mission parameters

Mission lobby parameters are declared in [`core/def/param.hpp`](../HeartsAndMindsPlus.Altis/core/def/param.hpp) and read by [`core/def/mission.sqf`](../HeartsAndMindsPlus.Altis/core/def/mission.sqf). The labels and choices below describe the current public branch. Defaults are the `default` values in `param.hpp`; runtime code may transform a value before using it.

<!-- Screenshot: mission lobby showing the parameter group headings. Teaches how the options are organized. Essential. -->

## Parameter groups

| Group | Parameters | Default / notes |
|---|---|---|
| Time | Start hour, time acceleration, officer time and weather controls | Start hour `9`; acceleration `8`; time and weather changes enabled. |
| Server management | Load saved campaign, save when empty, restart interval, scheduled restart hours, restart/shutdown type | Load/save enabled; restart interval `6` hours; restart type defaults to save and restart. Automatic server commands require a matching server-command password configured privately on the server. |
| Respawn | Available respawn methods, FOB-to-base respawn, rally timer, tickets, ticket sharing, prisoner ticket attribution, body marker delay | Rally timer `30` minutes; starting tickets `50`; tickets lost per death `2`; other values are listed in `param.hpp`. |
| Factions | Enemy faction, anti-air and tank options, civilian type and civilian vehicle type | The selected faction must be available in the loaded game/mod set and compatible with the player side. |
| Spawning | Occupied city, enemy, building, static, civilian, and animal density; armed vehicles; patrol maximums | Occupied city/enemy/civilian/static defaults are `100%`; military-in-house `60%`; animals `0%`; military patrol maximum `10`; civilian vehicle maximum `5`. |
| IEDs | Ratio, spotting difficulty, placement, explosive power, drone bomber | Defaults are encoded in `param.hpp`; descriptions and labels are the authoritative choices. The drone option comment currently describes a disabled mode; confirm this behavior in a mission test before relying on it. |
| Hideouts and caches | Hideout count, cache intel distance/ratio, intel chance on bodies, intel density in houses | Hideouts `10`; intel distance `1000 m`; cache ratio `100`; body intel chance `90%`; house intel density `30%`. |
| AI skill | Enable mission AI skill values and individual skill attributes | Skill setting enabled; defaults for each attribute are in `param.hpp`. Values are presented as tenths and mapped to decimal skill values by mission code. |
| Gameplay | Sea area, chemical warfare, spectrum devices, side mission cycle | Sea disabled; chemical warfare and spectrum devices enabled; side mission cycle `4`. |
| Other | Starting reputation, reputation notifications, city radius offset, activation suppression over fast aircraft, city clear threshold, flag use, debug mode | Starting reputation `0`; fast-aircraft activation suppression enabled; city clear threshold `3`; flag option `3`; debug disabled. |

## Allowed values and behavior notes

Use the lobby labels when choosing settings; parameter indexes in the mission files are not always the displayed values. Start with the parameter group descriptions below, then consult `core/def/param.hpp` for the exact available choices in your mission version.

| Setting | Choices in the current source | Default |
|---|---|---:|
| Start hour | `1`–`24` | `9` |
| Time acceleration | `1`–`12` | `8` |
| Officer time/weather controls | Disabled or enabled | Enabled / enabled |
| Load campaign / save when empty | Disabled or enabled | Enabled / enabled |
| Auto-restart interval | Disabled, 1–12 hours, 24, 48, or 72 hours | `6` hours |
| Auto-restart schedule hours | Disabled (`-1`) or hour `0`–`23`, for each of two schedule entries | Both disabled |
| Restart action | Restart, shutdown, save-and-restart, or save-and-shutdown | Save-and-restart |
| Respawn methods | Five choices (`0`–`4`); see their localized lobby labels | `1` |
| Respawn from FOB to base | Disabled or enabled | Enabled |
| Rally-point lifetime | Disabled, 5, 10, 30, or 60 minutes | 30 minutes |
| Starting tickets | Disabled (`-1`), 0–5, then 10, 15, 20, 25, 30, 50, 70, 100, 150, or 200 | `50` |
| Tickets lost per death | `1`–`10` | `2` |
| Ticket sharing | Shared or not shared; prisoner-ticket attribution is a separate option | Shared |
| Dead-body marker delay | Disabled (`-1`), 0, 5, 10, 30, or 60 minutes | 0 minutes |
| Enemy faction | Numeric selections `0`–`210`; labels and faction class order are maintained in `param.hpp` and `mission.sqf` | `1` |
| Anti-air infantry / enemy tanks | Disabled or enabled | Enabled / enabled |
| Civilian and civilian-vehicle classes | Numeric selections `0`–`6` | `0` / `0` |
| Occupied city, enemy, building, static, civilian, and animal densities | Percentage selections declared per parameter; most use 0–100 in 10% steps | `100%`, `100%`, `60%`, `100%`, `100%`, `0%` |
| Armed vehicles at hideouts / side missions and caches | Disabled or enabled | Enabled / enabled |
| Military patrol maximum | Lobby labels `1`–`10` | `10` |
| Civilian vehicle patrol maximum | Lobby labels `1`–`15` | `5` |
| IED ratio | Four choices: disabled, low, normal, high | Low |
| IED spotting | Very easy, easy, normal | Very easy |
| IED placement | Roadside, middle, random | Roadside |
| IED power | Medium or small | Medium |
| Drone bomber | Disabled or enabled | Enabled |
| Hideout count | Random, 0–10 | `10` |
| Cache intel distance | 500–5,000 metres in 500-metre steps | 1,000 m |
| Cache intel ratio | `50` or `100` (shown as metres) | `100` |
| Intel chance from dead bodies | Displayed from 100% down to 0% in 10% steps | 90% |
| Intel density in houses | 0%–10% in 1% steps, then 20%–100% in 10% steps | 30% |
| AI skill attributes | 0.0–1.0 in 0.1 steps for each attribute | See individual defaults in `param.hpp` |
| Sea area / chemical warfare / spectrum devices | Disabled or enabled | Disabled / enabled / enabled |
| Side mission cycle | Disabled, 1, 2, 3, or 4 | `4` |
| Starting reputation | 0, 200, 500, or 750 | `0` |
| Reputation notification threshold | Disabled (`-1`), 0, 1, 2, 3, 5, 10, 25, 50, 100, or 200 | Disabled |
| City radius offset | `0`–`800` metres in 100-metre steps | `500` m |
| Suppress city activation under fast aircraft | Disabled or enabled | Enabled |
| City-clear enemy threshold | Disabled, 1, 2, or 3 remaining enemies | `3` |
| Flag use | Disabled or three access modes | Access mode `3` |
| Debug | Disabled, enabled, or log-only | Disabled |

For exact localized strings, value arrays, and per-skill defaults, refer to `core/def/param.hpp`. Some values have corresponding conversions in `core/def/mission.sqf`; test changes rather than assuming the numeric parameter is used directly.

## Deprecated options

The source marks several legacy respawn arsenal, shared-slot, arsenal, auto-loadout, and garage options as deprecated. They are planned for removal with their associated code. Until removed from the public branch, they may still affect the current mission; do not rely on them for a new server setup. Use the active [role arsenal guide](ARSENAL-AND-LOADOUTS.md) for equipment configuration.

For Arma’s mission parameter format and server-side overrides, see the official [Mission Parameters reference](https://community.bistudio.com/wiki/Arma_3_Mission_Parameters).

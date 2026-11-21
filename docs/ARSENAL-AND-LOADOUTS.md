# Role arsenals and equipment

H&M Plus uses `HeartsAndMindsPlus.Altis/core/def/rolearsenal.sqf` to choose which equipment is available for each playable role. The role arsenal is initialized when players use an arsenal crate.

## How roles match their arsenals

The active script reads the player's role description and maps it to a role list. The public Altis mission currently uses these descriptions: `Commander`, `Rifleman`, `Medic`, `Autorifleman`, `Engineer`, and `Pilot`. Each role receives the shared default equipment, with its role-specific list added on top.

### Important: keep Eden role descriptions in sync

When you rename a playable unit or change its role description in Eden Editor, update the matching description check in `rolearsenal.sqf` as well. The text must match so the correct role equipment is selected. If you add a role, add its mapping and equipment list in that file too.

<!-- Screenshot: Eden playable unit attributes showing role description alongside the matching role entry in rolearsenal.sqf. Teaches the required name match. Essential. -->

## Change available equipment

1. Make a backup copy of the mission and open the working copy of `core/def/rolearsenal.sqf` in a text editor.
2. Add or remove class names from `_DefaultGear` to change equipment shared by all recognized roles.
3. Change a role's array, such as `_MEDIC` or `_PILOT`, to adjust equipment for that role only.
4. Confirm each class name exists in the game and loaded mod set. The public vanilla mission's required mods are listed in the root [README](../README.md); any additional item mod must be loaded by the server and clients using it.
5. Test each affected role in a multiplayer mission. Open the arsenal, confirm the available items, and check the server RPT for missing class errors.

<!-- Screenshot: role arsenal open in game with role-specific equipment visible. Teaches how to verify a role's available equipment. Essential. -->

The old loadout arrays in `define_mod.sqf` and the related deprecated lobby options are not the active role arsenal configuration method. Do not edit them to change role arsenals. Deprecated parameters are planned for removal along with their associated code.

For mission editing and backup guidance, see [Configuration](CONFIGURATION.md). For screenshots, see the [checklist](SCREENSHOTS.md).

# Player permissions

The in-game permissions interface lets administrators manage which players can use the Build, Salvage, Command, Flight, and Armour features. To open it, use the ACE self-interaction menu and select **Permissions** while logged in with server-command access. Use the player list and permission columns to review or change a player's access. The available permissions can affect construction, salvage, command functions, aircraft, and armour; grant only the access your community intends.

The permission action is limited to users for whom the server reports `#logout` as an available command. Select a player and the relevant permission column in the dialog. Confirm the available controls and who is allowed to administer them in your running build. Do not assume permission changes survive a server restart unless you have verified that behavior in your setup.

## Configure default permissions

The default values for a player without an existing permission record are set in [`HeartsAndMindsPlus.Altis/core/fnc/ui/init.sqf`](../HeartsAndMindsPlus.Altis/core/fnc/ui/init.sqf), in the `_OUTPUT` assignment. The current default string is:

```sqf
_OUTPUT = [_name, "1:1:1:0:0:0:0:0:0:0:1:1"] joinString ":";
```

The permission fields, in order, are **Build**, **Salvage**, **Command**, seven player-stat fields, **Flight**, and **Armour**. For permission fields, `1` enables the permission and `0` disables it. The seven fields between Command and Flight are statistics, not permissions; keep them in place and do not change their order when editing the string.

| Permission | What it controls | Current default |
|---|---|---:|
| Build | Makes the ACE Build Menu action available to the player. The player must also be in a build zone. | Enabled |
| Salvage | Sets the player's salvage permission flag. The current salvage-menu check for this flag is commented out, so changing this default does not currently prevent the menu from opening. Test the behavior before relying on it as an access restriction. | Enabled |
| Command | Enables side-mission/command actions and initializes the player's air-power actions. | Enabled |
| Flight | Allows the player to remain in aircraft crew seats; without it, the player is moved out. Cargo seats are allowed. | Enabled |
| Armour | Allows the player to remain in tank crew seats; without it, the player is moved out. Cargo seats are allowed. | Enabled |

To set defaults for your community, edit only the relevant permission values in `_OUTPUT` on a working mission copy: use `1` to enable and `0` to disable. Preserve all 12 colon-separated values and their order. The default is used when the mission has no permission record for that player's key; an existing player record can take precedence over this default. Test with a player who has no existing record and check the in-game permission panel before publishing the mission.

<!-- Screenshot: ACE self-interaction menu showing Permissions for an administrator. Teaches how an authorized admin opens the access settings. Essential. -->

<!-- Screenshot: permissions screen with a fictional test player and available permission columns. Teaches what access categories can be managed. Essential. -->

## Operator notes

- Use a test player when capturing the interface.
- Do not publish player UIDs or personal identifiers in screenshots or support logs.
- Use the permissions interface with a test player before the first live session.
- Confirm which staff roles can edit permissions in your mission build; the public docs do not establish a separate staff authorization policy.

For the public feature summary, see [Features](FEATURES.md). For server setup and mission parameters, see [Installation](INSTALLATION.md) and [Mission parameters](PARAMETERS.md).

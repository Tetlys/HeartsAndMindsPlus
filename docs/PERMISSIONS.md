# Player permissions

The in-game permissions interface lets administrators manage which players can use the Build, Salvage, Command, Flight, and Armour features. To open it, use the ACE self-interaction menu and select **Permissions** while logged in with server-command access. Use the player list and permission columns to review or change a player's access. The available permissions can affect construction, salvage, command functions, aircraft, and armour; grant only the access your community intends.

The permission action is limited to users for whom the server reports `#logout` as an available command. Select a player and the relevant permission column in the dialog. Confirm the available controls and who is allowed to administer them in your running build. Do not assume permission changes survive a server restart unless you have verified that behavior in your setup.

<!-- Screenshot: ACE self-interaction menu showing Permissions for an administrator. Teaches how an authorized admin opens the access settings. Essential. -->

<!-- Screenshot: permissions screen with a fictional test player and available permission columns. Teaches what access categories can be managed. Essential. -->

## Operator notes

- Use a test player when capturing the interface.
- Do not publish player UIDs or personal identifiers in screenshots or support logs.
- Use the permissions interface with a test player before the first live session.
- Confirm which staff roles can edit permissions in your mission build; the public docs do not establish a separate staff authorization policy.

For the public feature summary, see [Features](FEATURES.md). For server setup and mission parameters, see [Installation](INSTALLATION.md) and [Mission parameters](PARAMETERS.md).

The Notion command log also contains Zeus/Admin operating notes. They include a named approver and may be specific to one server; they are preserved and flagged for review in [Debugging](DEBUGGING.md#zeus-and-admin-notes).

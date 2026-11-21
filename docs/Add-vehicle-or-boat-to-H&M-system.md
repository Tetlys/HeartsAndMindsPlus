# Build menu and vehicles

H&M Plus players use the ACE self-interaction **Build Menu** to buy vehicles and place construction items. The menu is available within a build zone near an FOB flag. The menu displays the available items and their costs; the shared mission economy must have enough funds for a purchase.

## Open the menu and purchase an item

1. Travel to an FOB and move near its flag/build zone.
2. Open the ACE self-interaction menu and select **Build Menu**.
3. Choose a category, then select the vehicle or object. The menu displays the cost.
4. Select the item and place it using the ACE fortify placement controls.

If the menu reports that you must be in a build zone, move closer to the FOB flag. If an item cannot be placed, check the available space and the displayed funds.

<!-- Screenshot: player at the FOB opening the ACE self-interaction menu with Build Menu highlighted. Teaches where to access purchases. Essential. -->
<!-- Screenshot: build menu showing vehicle categories, item costs, and an available vehicle. Teaches how to select a vehicle for purchase. Essential. -->

## Default vehicle availability

In the public vanilla mission, all available vehicle classes are in the first build category, **Basic** (Tier 1 in player-facing terms), and are unlocked from the start. The higher vehicle tier arrays are empty in the default configuration, so the standard vehicle selection is available from that first category. Vehicles have prices; players need sufficient shared economy funds to place them. The build menu checks that the player is near an FOB flag; access is also subject to the community's Build permission settings.

The build menu also contains fortifications, statics, ammunition boxes, containers, mission supplies, FOB items, and vehicle logistics. The menu is not an Eden layer-based vehicle registration system.

## Customize the available vehicles

Mission editors can change the class lists and costs in `HeartsAndMindsPlus.Altis/core/def/mission.sqf`, in the `_Tier0Array` through `_Tier5Array` configuration section. Each entry pairs a vehicle class name with its price. Confirm the class exists in the game/mod set and that the mod is loaded on both server and clients. For the public vanilla release, the required mod list is in the root [README](../README.md); optional vehicle mods are not required by the base mission.

For custom progression, editors can add vehicles to higher arrays and adjust the category thresholds in `HeartsAndMindsPlus.Altis/core/fnc/fortify/load.sqf`. These categories are gated by campaign victory percentage. This is an advanced mission edit: test the unlock points, prices, placement, salvage, and permissions in a multiplayer test before publishing. Keep a backup of the original mission.

The in-game permission interface includes a Build permission category. Confirm the server's intended player permissions before distributing build access; see [Player permissions](PERMISSIONS.md). Avoid describing deprecated garage parameters as a current vehicle configuration method.

<!-- Screenshot: mission.sqf vehicle tier and price arrays with an example entry highlighted. Teaches where editors customize vehicle selection and cost. Optional. -->

For installing or packaging the edited mission, see [Installation](INSTALLATION.md). For screenshots, see the [checklist](SCREENSHOTS.md).

[Debugging](DEBUGGING.md#wreck-repair-routine)

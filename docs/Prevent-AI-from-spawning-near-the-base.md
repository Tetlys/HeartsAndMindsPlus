# Preventing town AI from spawning near the base

The public mission currently skips town activation within 500 metres of the `btc_base` marker. This check is active in [`core/fnc/city/init.sqf`](../HeartsAndMindsPlus.Altis/core/fnc/city/init.sqf#L68). It is not necessary to uncomment the old example shown by earlier versions of this guide.

To use this behavior, keep a marker named `btc_base` at the base in Eden. To change the protected radius or marker name, edit the active check in `core/fnc/city/init.sqf` and test the mission locally before publishing it. The check uses the marker position and a fixed 500-metre range; changing marker size alone does not change that range.

<!-- Screenshot: Eden Editor showing btc_base at the intended mission base. Teaches where the town-AI exclusion area is centered. Optional. -->


/* ----------------------------------------------------------------------------
Function: tet_fortify_progress

Description:
    Updates map progress

Usage:
    spawn tet_fortify_open

Returns:

Examples:
    (begin example)
        _result = [] call tet_fortify_progress;
 
    (end)

Author:
    Tetlys
---------------------------------------------------------------------------- */ 


params [];

// Unlock System
city_remaining = [];  
// Check if cities are occupied and count them
{  
if (_y getVariable ["occupied", false]) then {  
    city_remaining pushBack _y;  
};  
} forEach btc_city_all; 

// Turns it into a %
VictoryPercentage = (100 - (((count city_remaining) / (count btc_city_all)) *100) max 0.1);

publicVariable "VictoryPercentage";
publicVariable "btc_vehicles";
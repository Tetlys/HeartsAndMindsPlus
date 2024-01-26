/*

This script adds a request for a CAS aircraft (not physically spawned) which provides tracking and targeted strike capability.

Author: Incontinentia

*/

private ["_trackingType","_necItem","_fullVP","_preStrikeCDE","_playTimeVar","_playTime","_percentage","_hqCallsign","_airCallsign","_nightTimeOnly","_aircraftType","_minTimeOnTgt","_randomDelay","_altitudeMin","_altitudeRandom","_radius","_speed","_ammoArray","_allowSensitive","_maxCollateral","_sideFriendly","_trackingEnabled","_percentageReliability","_isAffectedByOvercast","_objectOcclusion","_maxOvercastDegradation","_trackingRange","_terminalNecessary","_requestInterval","_repeatedStrikes","_timeout"];

//General Options
_percentage = 80;                      //Percentage chance that the aircraft will be available for sorties
_hqCallsign = "CROSSROADS";             //Callsign for HQ element
_airCallsign = "REAPER";           //Aircraft callsign
_nightTimeOnly = false;                 //Is activity limited to night-time only sorties?
_useRadioTriggers = false;               //Interact with CAS using Radio Charlie

//Player options
_necItem = "ItemMap";                 //Required item to call for air support (must be in the unit's assigned items - i.e. laser designator or UAV terminal, but not smoke grenade).
_fullVP = false;                         //Should JTAC and pilot use full voice procedure or limit radio contact to essential only?
_preStrikeCDE = true;                   //Should the pilot conduct a collateral damage assessment before the strike? (Check for civilians, nearby friendlies, sensitive targets in strike radius)

//Aicraft options
_aircraftType = "RQ-170 Sentinel RPA";  //Aircraft type (for voice procedure, does not change anything about strike)
_minTimeOnTgt = 60;                    //How long should the aircraft take to reach the AO in seconds
_randomDelay = 120;                     //Random delay factor (could be delayed by up to this many seconds)
_altitudeMin = 6000;                    //Minimum altitude of ordnance launch
_altitudeRandom = 4000;                 //Random additional altitude above minimum for ordnance launch
_radius = 1500;                         //Radius of launch position around player in meters
_rtbOnNoAmmo = true; 					//Should the unit RTB when out of ammo? (Set to false if you want the unit to continue tracking after it has run out of ammo)
_playTime = 60;                         //Amount of time aircraft will remain on station (in minutes) - i.e. over the target area
_playTimeVar = 5;                      //Variation in minutes for time on station (must be significantly less than _playtime to avoid errors)
_requestInterval = 5;                  //Maximum amount of time in minutes between unsuccessful aircraft requests (will be able to request again once this timer is done)
_maxSorties = 20;                        //Max number of sorties
_timeout = 60;                          //Radio message timout in seconds (player must communicate before this runs out or the mission will abort - the final strike confirmation will be 15 times this value to enable coordination)
_rearmTime = 10;                         //Amount of time (in minutes) the aircraft will take to rearm and refuel after a sortie

//Ordnance options
_bomb = 2;							    //How many GBUs will the air unit carry?
_missile = 4;                           //How many AT missiles the air unit carry?

//Allow targeting of sensetive targets (put "this setVariable ["APW_sensetiveTarget",true,true];" without quotation marks in the sensitive unit's init)
_allowSensitive = false;

//Mission aborted if more than this number of civilians are in the probable kill radius (only civilians visible from overhead will be counted, more may be present in reality)
_maxCollateral = 1;

//Cancel strike if units of this side are in kill zone
_sideFriendly = west;

//Sensor / Tracking Options
_trackingEnabled = true;                //Is tracking enabled? (If false, below settings are ignored)
_trackingType = "manual";                 //Can be "full" (manual and automatic), "manual" (targets must be manually marked by JTAC)
_percentageReliability = 85;			//What percentage of units will be picked up by tracking in perfect conditions?
_isAffectedByOvercast = true;			//Is tracking affected by overcast conditions?
_objectOcclusion = true;				//Do objects block tracking (i.e. a unit standing under a building)?
_maxOvercastDegradation = 70;			//How much % reliability will be lost at full overcast?
_trackingRange = 1000;					//Maximum tracking range from player
_terminalNecessary = false;				//Is a UAV terminal necessary to view tracking information?

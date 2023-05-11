Version 0.4b
-Moved btc_missionsetup,sqf to btc\framework\scripts\mission_specific\
-XEH_PREP.hpp moved fps markers function to opportune headless+server category only
-FPS interval each x seconds on cba settings
-Added fps test for Malden
-Some text formatting
-debug logging will now format in text the variable ACE_Name
-compiled 3 CBA functions
-uncommented markers hiding in fnc_findCities.sqf
-removed debug logging fps in diag_log from fnc_showFPSinit.sqf
-Added test for intro and debug logging if both are on
-forgot to add variable FPSTestOriginalPos for debug logging fnc
-added thunderStorm function

Version 0.4a
-Fixed CBA and inits condition race
-Fixed fnc_createEnVeh error on empty _classes

Version 0.4
-Added Black Sun Faction
-Moved paramaters to CBA settings in preInit
-Added BTC_Intro and its corresponding RscTitles
-DEBUG_MODE_FULL undefined
-Added FPS Debug with logging to server, duration can be set in cba settings requires manual for worldName
-Added setTimeMultiplier to init_server.sqf
-Added 0x39(57-Space) as keybind to skip the intro (it's a secret)
-Added three more sounds "btc_framework_zippo" & "btc_framework_fire" & "btc_framework_intro_song"
-Switched to another variable for DEBUG_MODE_FULL for animals, as even with undefined draw3ds was still doing its magic
-Implemented forceSay3D
-Added burnObj mission specific function to Commercial_Flights.Stratis
-Separated Blacklists for Civilian(civ_blacklist), Traffic(traffic_blacklist) and Location(city_blacklist)
-Removed unused _p points in CreateEnModule
-Patrols now spawn inside houses
-Vehicles within 150m of a player have checkVisibility
-Changed location triggers'markers from "BDiagonal" to "DiagGrid"
-Fixed draw3ds fnc to only get Visual type of position(renderer scope)
-Switched draw3ds from remoteExecCall on server to init_player.sqf local
-DrawIcon now retrieves ACE_Name variable if it exists

Version 0.3
-Moved MissionEH to one single file to reduce overhead. fnc_draw3Ds
-Changed spawning and despawning of all modules to consider if there are players in sight
-Changed FPS function to show agents and moved location off map
-Changed Traffic Agent destination logic, distant spot and then despawn, added 600 seconds timeout
-Added CBA_fnc_taskPatrol_ground
-Added CBA_fnc_taskPatrol_water
-Added fnc_findPosOutsiderock from H&M
-Added legacy fnc forceSay3D (not yet implemented in prep.hpp)
-Created agents are now set to "CARELESS" behaviour
-Created agents have now their FSM turned off
-Adjusted allPlayers calls to [] call CBA_fnc_players
-GVAR for both civs and traffic number per location in btc_missionsetup.sqf
-Civs can now spawn in "NameLocal" again
-Vcom's CBA settings for sides settings are fixed and now are called in PreInit by CBA XEH

Version 0.2
-Added Enemy Spawn
-Added btc\framework\data folder for audio and images
-Added VCOM 3.3.2
-Debug functions compatible with multiplayer DrawIcon3D and DrawLine3D
-Added Flyby function
-Added Animal spawn function
-Added classesPools.hpp

Version 0.1
-Added drawIcon debug function
-Added Traffic Presence
-Added cities functions
-Added ShowFPS functions
-Added GetRoadDir/Width functions
-Mission parameters
-Introduced CBA mission macros
-Initial draft
-Arma 3 Civilian presence modified to suit mission
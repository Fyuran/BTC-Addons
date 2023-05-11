/* ----------------------------------------------------------------------------
Function: btc_MissionSetup

Description:
    Initializes side missions
Parameters:


Returns:

Examples:
    (begin example)
    	[] call compile preprocessFileLineNumbers "BTCScripts\Server\side\btc_MissionSetup.sqf";
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
// [[general_spot_1,general_spot_2], general_1] call btc_fnc_side_captive; //general spots are possible random locations for the unit
// [[journalist_spot_1,journalist_spot_2,journalist_spot_3,journalist_spot_4], journalist_1] call btc_fnc_side_captive_informer; //journalist spots are possible random locations for the unit
// [[prisoner_1,prisoner_2,prisoner_3,prisoner_4,prisoner_5,prisoner_6],[ammo_cache_1,ammo_cache_2,ammo_cache_3,ammo_cache_4,ammo_cache_5,ammo_cache_6]] call btc_fnc_side_ammocache;
if(BTC_MISSIONTIMER != 0) then {[BTC_MISSIONTIMER] call btc_fnc_side_mission_timer};
[terminalHQ_1] remoteExecCall ["btc_fnc_side_hqmissions", [0,-2] select isDedicated, terminalHQ_1];
[[civ_1, civ_2, civ_3, civ_4, civ_5, civ_6]] call btc_fnc_marked_objects;
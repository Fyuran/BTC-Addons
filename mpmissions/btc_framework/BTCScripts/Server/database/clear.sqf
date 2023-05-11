/* ----------------------------------------------------------------------------
Function: btc_fnc_database_clear

Description:
    Empties and turns off database

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_clear
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
//DATABASE
[btc_database_dataCheck_handle] call CBA_fnc_removePerFrameHandler;
terminate btc_database_saveData_handle;
//PLAYERS
btc_database_players_savedata = [];
profileNamespace setVariable [format["btc_%1_players_savedata",MISSION_SAVE_NAME], btc_database_players_savedata];

//VEHS
btc_database_vehs_savedata = [];
btc_database_vehs apply {
    _x setVariable ["btc_database_isPersistent",nil,true];
    _x setVariable ["btc_database_data", nil];
};
btc_database_vehs = [];
profileNamespace setVariable [format["btc_%1_vehs_savedata",MISSION_SAVE_NAME], btc_database_vehs_savedata];

//CRATES
btc_database_crates_savedata = [];
btc_database_crates apply {
    _x setVariable ["btc_database_isPersistent",nil,true];
    _x setVariable ["btc_database_data", nil];
};
btc_database_crates = [];
profileNamespace setVariable [format["btc_%1_crates_savedata",MISSION_SAVE_NAME], btc_database_crates_savedata];

//SECTORS
btc_database_sectors_savedata = [];
btc_database_sectors = [];
profileNamespace setVariable [format["btc_%1_sectors_savedata",MISSION_SAVE_NAME], btc_database_sectors_savedata];

//GAIA
btc_database_gaia_savedata = [];
profileNamespace setVariable [format["btc_%1_gaia_savedata",MISSION_SAVE_NAME], btc_database_gaia_savedata];

//MHQS
btc_database_mhqs_savedata = [];
btc_database_mhqs = [];
profileNamespace setVariable [format["btc_%1_mhqs_savedata",MISSION_SAVE_NAME], btc_database_mhqs_savedata];

//SHOP
//profileNamespace setVariable ["btc_database_money", [0,0,0]];
//missionNamespace setVariable ["btc_database_money", [0,0,0], true];
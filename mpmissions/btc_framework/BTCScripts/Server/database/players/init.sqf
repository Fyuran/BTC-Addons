/* ----------------------------------------------------------------------------
Function: btc_fnc_database_players_init

Description:
    Parses global var players database.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_players_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __ID__ 3
btc_database_players_savedata = profileNamespace getVariable [format["btc_%1_players_savedata",MISSION_SAVE_NAME], []];
profileNamespace setVariable [format["btc_%1_players_savedata",MISSION_SAVE_NAME], btc_database_players_savedata];

addMissionEventHandler ["PlayerConnected",
{
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    ["btc_fnc_database_players_init", format["managing connecting %1(%2)", _name, _uid]] call btc_fnc_logDebug;
    _index = btc_database_players_savedata findIf {(_x select __ID__) == _uid};
    if(_index != -1) then {
        _data = btc_database_players_savedata select _index;
        ["btc_fnc_database_players_init", format["loading %1 to connecting %2(%3)", _data, _name, _uid]] call btc_fnc_logDebug;
        [_data] remoteExecCall ["btc_fnc_database_players_initLocalPlayer",_owner];
    };
}];

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    if !(_unit isKindOf "CAManBase") exitWith{["btc_fnc_database_players_init", format["discarding %1(%2), it's not a player", _name, _uid]] call btc_fnc_logDebug};
    ["btc_fnc_database_players_init", format["managing disconnecting %1(%2)", _name, _uid]] call btc_fnc_logDebug;
    _data = [_unit,_uid] call btc_fnc_database_players_get_data;
    _index = btc_database_players_savedata findIf {_x select __ID__ == _uid}; //find if unique id already exists
    if (_index != -1) then {btc_database_players_savedata set [_index,_data]} //update data
        else{btc_database_players_savedata pushBack _data}; //or add it
    false;
}];

[] call btc_fnc_database_players_EH;
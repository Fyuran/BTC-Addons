/* ----------------------------------------------------------------------------
Function: btc_fnc_database_actions

Description:
    Adds database functions to every player
Parameters:


Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __ADMIN [true,serverCommandAvailable "#logout"] select (isMultiplayer && !isServer)
#define __DATABASE_GUI 19339

//PLAYER ACTIONS
private _action = ["database", "Database", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\D_ca.paa", {}, {__ADMIN}, {}, []] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "btc_ace_Actions"], _action] call ace_interact_menu_fnc_addActionToObject;

btc_fnc_database_clear_database = {
	_text = "This command will force a clear of all the databases, any recorded data will be lost.";
	player setVariable ["database_gui_event_text",_text]; //GUI Onload Event would fire earlier
	createDialog "database_disclaimer_gui";
	(findDisplay __DATABASE_GUI) setVariable ["database_gui_event","btc_database_players_clear"];
	["btc_fnc_database_actions", format["%1(%2) has cleared the databases", player, steamProfileUrl]] call btc_fnc_logDebug;
};

//DATABASE CLEAR
_action = ["database_players_clear", format["<t color='%2'>%1</t>","Clear Databases", "#FF0000"], "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa", {
	[] call btc_fnc_database_clear_database;
}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","btc_ace_Actions","database"], _action] call ace_interact_menu_fnc_addActionToObject;
//DATABASE SAVE
_action = ["database_players_save", format["<t color='%2'>%1</t>","Save Databases", "#008000"], "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa", {
	[player] remoteExecCall ["btc_fnc_database_saveData", 2];
}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","btc_ace_Actions","database"], _action] call ace_interact_menu_fnc_addActionToObject;


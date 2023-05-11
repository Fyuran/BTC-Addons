/* ----------------------------------------------------------------------------
Function: btc_fnc_actions

Description:
    Adds gameplay actions to player

Parameters:


Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __CONDITION [true,serverCommandAvailable "#logout"] select (isMultiplayer && !isServer)
private _action = [];
/*
//VEHICLES ACTIONS
_action = ["btc_custom_actions", "Custom", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\C_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//RESPAWN MODULE
//set respawn
_action = ["respawn_set", "Set Respawn", "",{
	_id = [side player,_target,"Mobile Respawn"] call BIS_fnc_addRespawnPosition;
	missionNamespace setVariable ["btc_mobile_respawn", _id, true];
	hint "Respawn set";
}, {(_this select 2) && {alive _target} && {missionNamespace getVariable ["btc_mobile_respawn",[]] isEqualTo []}}, {}, {__CONDITION}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions","btc_custom_actions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//Remove respawn, show only if vehicle has respawn set
_action = ["respawn_remove", "Remove Respawn", "",{
	_id = missionNamespace getVariable "btc_mobile_respawn";
	_id call BIS_fnc_removeRespawnPosition;
	missionNamespace setVariable ["btc_mobile_respawn",nil,true];
	hint "Respawn Removed";
}, {(_this select 2) && {alive _target} && {!(missionNamespace getVariable ["btc_mobile_respawn",[]] isEqualTo [])}}, {}, {__CONDITION}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions","btc_custom_actions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
*/

//PLAYER ACTIONS
/*_action = ["btc_ace_Actions_CAS", "CAS", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\plane_ca.paa", {hint "This is a placeholder"}, {__CONDITION}, {}, []] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","btc_ace_Actions"], _action] call ace_interact_menu_fnc_addActionToObject;*/
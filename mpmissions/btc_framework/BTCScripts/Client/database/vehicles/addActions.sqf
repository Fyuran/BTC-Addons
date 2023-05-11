/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehicles_addActions

Description:
    Adds vehicle database functions to every player
Parameters:


Returns:

Examples:
    (begin example)
    	[] call btc_fnc_database_vehicles_addActions;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __PERSISTZONE_DIS 100


//mainAction
private _action = ["database", "Database", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\D_ca.paa", {}, {
	_i = btc_database_mhqs findIf {
			_x distance2D _target <= __PERSISTZONE_DIS &&
			{_x getVariable ["btc_database_MHQisActive", false]} &&
			{_x getVariable ["btc_database_MHQside", sideEmpty] isEqualTo side player}
	};
	if(_i isEqualTo -1) then {false} else {true};
}, {}, []] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//add to database
_action = ["database_add", "Add to Database", "\A3\ui_f\data\igui\cfg\simpleTasks\types\download_ca.paa", {
	hint "Vehicle added";
	["btc_database_veh_add", _target] call CBA_fnc_serverEvent;
	["btc_fnc_database_vehicles_addActions", format["btc_fnc_database_actions: %1(%2) has added %3 to the database", player, steamProfileUrl, typeOf _target]] call btc_fnc_logDebug;
},{!(_target getVariable ["btc_database_isPersistent",false])}] call ace_interact_menu_fnc_createAction;

["LandVehicle", 0, ["ACE_MainActions","database"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions","database"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//remove from database
_action = ["database_remove", "Remove from Database", "\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa", {
	hint "Vehicle removed";
	["btc_database_veh_remove", _target] call CBA_fnc_serverEvent;
	["btc_fnc_database_vehicles_addActions", format["btc_fnc_database_actions: %1(%2) has removed %3 from the database", player, steamProfileUrl, typeOf _target]] call btc_fnc_logDebug;
},{_target getVariable ["btc_database_isPersistent",false] && {_target getVariable ["btc_database_canRemove",true]}}] call ace_interact_menu_fnc_createAction;

["LandVehicle", 0, ["ACE_MainActions","database"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions","database"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//Paint to Captured Color
_action = ["database_paint", "Paint", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\truck_ca.paa", {
	_cantBePainted = getArray(configfile >> "CfgVehicles" >> typeOf _target >> "hiddenSelections") isEqualTo [];
	if(_cantBePainted) exitWith {hint "Vehicle can't be painted"};

	_sideID = [side player] call BIS_fnc_sideID;
	_colour = ["#(rgb,8,8,3)color(1,0.14,0,1)", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0.31,0.78,0.47,1)"] select _sideID;
	_target setObjectTextureGlobal [0, _colour];
	playSound3D [GetMissionPath "BTCScripts\Client\database\paint.ogg", objNull, false, getPosASL _target, 5, 1, 50];
	hint "Vehicle painted";
	["btc_fnc_database_vehicles_addActions", format["btc_fnc_database_actions: %1(%2) has painted %3", player, steamProfileUrl, typeOf _target]] call btc_fnc_logDebug;
}, {
_target getVariable ["btc_database_isPersistent",false] && {[getNumber(configfile >> "CfgVehicles" >> typeOf _target >> "side")] call BIS_fnc_sideType != side player}}] call ace_interact_menu_fnc_createAction;

["LandVehicle", 0, ["ACE_MainActions","database"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions","database"], _action, true] call ace_interact_menu_fnc_addActionToClass;
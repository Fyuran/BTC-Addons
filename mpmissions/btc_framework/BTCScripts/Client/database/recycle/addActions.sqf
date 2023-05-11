/* ----------------------------------------------------------------------------
Function: btc_fnc_database_recycle_addActions

Description:
    Adds ACE recycle actions.

Parameters:


Returns:

Examples:
    (begin example)
        [[arsenal_1]] call btc_fnc_database_recycle_addActions;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_recycleBins", [], [[]]]
]) exitWith {["btc_fnc_database_recycle_addActions: bad params %1", _this]};
#define __BIN _x

private ["_action"];
_recycleBins apply {

	_action = ["database_recycle", "Recycle Menu", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\R_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;
	[__BIN, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["database_recycle_inventory", "Recycle Inventory", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa", {
		[2, _this, {
			_args params ["_target","_caller"];
			[_target] call btc_fnc_database_recycle_InventoryRecycle;
		}, {}, "Recycling"] call ace_common_fnc_progressBar;
	}, {true}] call ace_interact_menu_fnc_createAction;
	[__BIN, 0, ["ACE_MainActions", "database_recycle"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["database_recycle_clear", "Clear Inventory", "", {
		[5, _this, {
			_args params ["_target", "_caller"];
			clearItemCargoGlobal _target; clearWeaponCargoGlobal _target; clearBackpackCargoGlobal _target; clearMagazineCargoGlobal _target;
			hint "Shop inventory cleared.";
			["btc_fnc_database_recycle_addActions", format["%1(%2) has cleared %3's inventory", player, steamProfileUrl, _target]] call btc_fnc_logDebug;
		}, {}, "Clearing"] call ace_common_fnc_progressBar;
	}, {true}] call ace_interact_menu_fnc_createAction;
	[__BIN, 0, ["ACE_MainActions", "database_recycle"], _action] call ace_interact_menu_fnc_addActionToObject;
};

_action = ["database_recycle", "Recycle Menu", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\R_ca.paa", {}, {
	 (btc_database_recycleBins findIf {_x distance2D _target <= 100}) != -1
}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;


_action = ["database_recycle_vehicle", "Recycle Vehicle", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa", {
	[2, _this, {
		_args params ["_target", "_caller"];
		//	_sideID = [side player] call BIS_fnc_sideID;
		//_change = getNumber(configFile >> "CfgVehicles" >> typeOf _target >> "armor");
		//btc_database_money set [_sideID, (btc_database_money select _sideID) + _change];
		//publicVariable "btc_database_money";
		_recycleBin = btc_database_recycleBins select (btc_database_recycleBins findIf {_x distance2D _target < 100});
		_recycleBin addItemCargoGlobal ["btc_money_stack", 10];

		hint "Vehicle recycled";
		if(BTC_DEBUG) then {["btc_fnc_database_recycle_addActions", format["%1(%2) has recycled %3, total gain: %4", player, steamProfileUrl, typeOf _target, 10]] call btc_fnc_logDebug};
		playSound3D [GetMissionPath "BTCScripts\Client\database\urepair.ogg", objNull, false, getPosASL _target, 5, 1, 50];

		deleteVehicle _target;
	}, {}, "Recycling Vehicle"] call ace_common_fnc_progressBar;
}, {!(_target getVariable ["btc_database_isPersistent",false]) && {leader group player isEqualTo player}}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions", "database_recycle"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions", "database_recycle"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["database_recycle_inventory", "Recycle Inventory", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa", {
	[2, _this, {
	_args params ["_target","_caller"];
	_recycleBin = btc_database_recycleBins select (btc_database_recycleBins findIf {_x distance2D _target < 100});
	[_target, _recycleBin] call btc_fnc_database_recycle_InventoryRecycle;
	}, {}, "Recycling Inventory"] call ace_common_fnc_progressBar;
}, {true}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions", "database_recycle"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions", "database_recycle"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["database_recycle_clear", "Clear Inventory", "", {
	[5, _this, {
		_args params ["_target", "_caller"];
		clearItemCargoGlobal _target; clearWeaponCargoGlobal _target; clearBackpackCargoGlobal _target; clearMagazineCargoGlobal _target;
		hint "Shop inventory cleared.";
		["btc_fnc_database_recycle_addActions", format["%1(%2) has cleared %3's inventory", player, steamProfileUrl, _target]] call btc_fnc_logDebug;
	}, {}, "Clearing"] call ace_common_fnc_progressBar;
}, {true}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions", "database_recycle"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions", "database_recycle"], _action, true] call ace_interact_menu_fnc_addActionToClass;
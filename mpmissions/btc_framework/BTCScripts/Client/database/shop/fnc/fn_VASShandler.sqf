/*
	Author: 7erra <https://forums.bohemia.net/profile/1139559-7erra/>

	Description:
	 VASS calls this function when certain events happen. Add your own code to change behaviour.
	 (Similar to BIS_fnc_callScriptedEventHandler)

	Parameter(s):
	 0: STRING - Mode in which the functions is called
	 1: ARRAY - Passed arguments

	Returns:
	 See sub functions
*/
#define __OPFOR 0
#define __BLUFOR 1
#define __INDFOR 2

params ["_mode",["_this",[]]];

switch _mode do {
	case "getMoney":{
		/*
			Description:
			 VASS wants to know how much money the unit has

			Parameter(s):
			 0: OBJECT - Unit whose money is requested

			Has to return:
			 NUMBER - Unit's money
		*/
		params["_unit"];
		{_x isEqualTo "btc_money_stack"}count items _unit
		/*btc_database_money = missionNamespace getVariable ["btc_database_money", [0,0,0]];
		private _sideID = [side player] call BIS_fnc_sideID;
		if !(_sideID in [__OPFOR, __BLUFOR, __INDFOR]) exitWith {[format["TER_fnc_VASShandler: %1 cannot retrieve money from this side %2", player, side player]] call btc_fnc_debugLog};
		btc_database_money select _sideID;*/
	};
	case "setMoney":{
		/*
			Description:
			 VASS changes the amount of money the player has

			Parameter(s):
			 1: OBJECT - Unit whose money will be changed
			 0: NUMBER - Amount of money changed (can be positive or negative)

			Has to return:
			 Nothing
		*/
		params ["_unit", "_change"];
		if(_change > 0) then {for "_i" from 1 to _change do {[_unit, "btc_money_stack", true] call CBA_fnc_addItem}}
		else {for "_i" from 1 to abs _change do {[_unit, "btc_money_stack"] call CBA_fnc_removeItem}};
/*		if (_change isEqualTo 0) exitWith {};
		private _sideID = [side player] call BIS_fnc_sideID;
		if !(_sideID in [__OPFOR, __BLUFOR, __INDFOR]) exitWith {[format["TER_fnc_VASShandler: %1 cannot edit money on this side %2", player, side player]] call btc_fnc_debugLog};
		btc_database_money set [_sideID, (btc_database_money select _sideID) + _change];
		publicVariable "btc_database_money";*/
	};
};
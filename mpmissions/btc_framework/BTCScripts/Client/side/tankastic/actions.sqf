/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tankastic_actions

Description:
    Gives Tankastic related ACE Actions to passed objects
Parameters:
	_west: ARRAY of ARRAYS
	_east: ARRAY of ARRAYS
	_classes: ARRAY of STRINGS
Returns:

Examples:
    (begin example)
        [[[BLUFOR_STAND_1],[BLUFOR_SPAWN_1]], [[[OPFOR_STAND_1],[OPFOR_SPAWN_1]], [["B_MBT_01_cannon_F","B_MBT_03_cannon_F"],["O_MBT_04_cannon_F","O_MBT_02_cannon_F"]]] call btc_fnc_side_tankastic_actions
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __WEST__ 0
#define __EAST__ 1
#define __SPAWN_DELAY__ 10
params[
	["_west",[],[[]],2],
	["_east",[],[[]],2],
	["_classes",[],[[""]]]
];
_west params [
	["_blu_stands",[],[[objNull]]],
	["_blu_spawns",[],[[objNull]]]
];
_east params [
	["_red_stands",[],[[objNull]]],
	["_red_spawns",[],[[objNull]]]
];
private _west_tanks = _classes select 0;
private _east_tanks = _classes select 1;

private _cfg = configFile;
private ["_stand","_spawn","_class","_displayName","_text","_action"];

//BLUFOR
{
	_stand = _x;
	_spawn = _blu_spawns select _forEachIndex;
	{
		_class = _x;
		_displayName = getText(_cfg >> "CfgVehicles" >> _class >> "displayName");
		_text = format["Spawn %1",_displayName];
		_action = [ format["blufor_stand_%1",_class], _text, "",
		{
			params["_target","_caller","_args"];
			_args params["_class","_spawn","_index"];

			if(((getPos _spawn) findEmptyPosition [0, 4, _class]) isEqualTo []) exitWith {hint "Spawn Area is not clear"};

			_life = (BTC_TANKASTIC_LIVES select __WEST__) select _index; //BTC_TANKASTIC_LIVES is publicVariabled by Server and JIP'd
			if(_life <= 0) exitWith {hint "This vehicle is out of respawns"};
			hintSilent format ["This vehicle has %1 respawns remaining",_life];

			[__SPAWN_DELAY__, _this,
			{
				(_this select 0) params["_target","_caller","_args"];
				_args params["_class","_spawn","_index"];
				[_index, __WEST__] remoteExecCall ["btc_fnc_side_tankastic_decreaseLife",2];
				[_class, _spawn] call btc_fnc_side_tankastic_createVehicle;
			}, {}, "Spawning"] call ace_common_fnc_progressBar;

		}, {side player == west}, {}, [_class,_spawn,_forEachIndex]] call ace_interact_menu_fnc_createAction;
		[_stand, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	}forEach _west_tanks;
}forEach _blu_stands;

//OPFOR
{
	_stand = _x;
	_spawn = _red_spawns select _forEachIndex;
	{
		_class = _x;
		_displayName = getText(_cfg >> "CfgVehicles" >> _class >> "displayName");
		_text = format["Spawn %1",_displayName];
		_action = [ format["blufor_stand_%1",_class], _text, "",
		{
			params["_target","_caller","_args"];
			_args params["_class","_spawn","_index"];

			if(((getPos _spawn) findEmptyPosition [0, 4, _class]) isEqualTo []) exitWith {hint "Spawn Area is not clear"};

			_life = (BTC_TANKASTIC_LIVES select __EAST__) select _index; //BTC_TANKASTIC_LIVES is publicVariabled by Server and JIP'd
			if(_life <= 0) exitWith {hint "This vehicle is out of respawns"};
			hintSilent format ["This vehicle has %1 respawns remaining",_life];

			[__SPAWN_DELAY__, _this,
			{
				(_this select 0) params["_target","_caller","_args"];
				_args params["_class","_spawn","_index"];
				[_index, __EAST__] remoteExecCall ["btc_fnc_side_tankastic_decreaseLife",2];
				[_class, _spawn] call btc_fnc_side_tankastic_createVehicle;
			}, {}, "Spawning"] call ace_common_fnc_progressBar;

		}, {side player == east}, {}, [_class,_spawn,_forEachIndex]] call ace_interact_menu_fnc_createAction;
		[_stand, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	}forEach _east_tanks;
}forEach _red_stands;

player addEventHandler ["Respawn", {[] call btc_fnc_side_tankastic_createGroup}];
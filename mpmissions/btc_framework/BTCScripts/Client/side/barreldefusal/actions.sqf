/* ----------------------------------------------------------------------------
Function: btc_fnc_side_barreldefusal_actions

Description:
    Helper function that adds actions to a single barrel and its phone for examination

Parameters:


Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params [
	["_radio",objNull,[objNull]],
	["_barrel",objNull,[objNull]]
]) exitWith { ["btc_fnc_side_barreldefusal_actions: ERROR %1",_this] call BIS_fnc_error};

private _color_actions = [];
private _action_ids = [];

//Colors action are parsed through ACE action functions
["red","green","blue"] apply {
	private _action = [format["barreldefusal_%1",_x], format["Cut the %1 wire",_x], "",
	{
		params["_target","_caller","_args"];
		[1,	_args,
		{
			_args params ["_barrel","_color"];
			private _inputed_colors = _barrel getVariable ["input_wire_colors",[]];
			_inputed_colors pushBack _color;
			_barrel setVariable ["input_wire_colors",_inputed_colors,[0,2] select isDedicated];

		}, {hint "Aborted"}, "Cutting"] call ace_common_fnc_progressBar;
	}, {true}, {}, [_barrel,_x]] call ace_interact_menu_fnc_createAction;
	_color_actions pushBack _action;
};

//LONG Examine action that will add colors actions upon examination
private _action = ["barreldefusal_examine_l", "Examine", "",
{
	[10, _this,
	{
		_args params ["_target","_caller","_params"];
		_params params ["_color_actions","_action_ids"];
		hint format["Cut the %1 wire",(_target getVariable ["wire_colors",["ERROR"]])select 0];
		if !(_target getVariable ["barreldefusal_hasActions",false]) then {
			_target setVariable ["barreldefusal_hasActions",true];
			_color_actions apply {
				private _action = [_target, 0, ["ACE_MainActions"], _x] call ace_interact_menu_fnc_addActionToObject;
				_action_ids pushBack _action;
			};
		};

	}, {hint "Aborted"}, "Examining"] call ace_common_fnc_progressBar;
}, {!("ACE_DefusalKit" in ((vestItems player) + (uniformItems player) + (backpackItems player)))}, {}, [_color_actions,_action_ids]] call ace_interact_menu_fnc_createAction;
_action = [_radio, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
_action_ids pushBack _action;

//SHORT Examine action that will add colors actions upon examination
_action = ["barreldefusal_examine_s", "Examine", "",
{
	[1, _this,
	{
		_args params ["_target","_caller","_params"];
		_params params ["_color_actions","_action_ids"];
		hint format["Cut the %1 wire",(_target getVariable ["wire_colors",["ERROR"]])select 0];
		if !(_target getVariable ["barreldefusal_hasActions",false]) then {
			_target setVariable ["barreldefusal_hasActions",true];
			_color_actions apply {
				private _action = [_target, 0, ["ACE_MainActions"], _x] call ace_interact_menu_fnc_addActionToObject;
				_action_ids pushBack _action;
			};
		};

	}, {hint "Aborted"}, "Examining"] call ace_common_fnc_progressBar;
}, {"ACE_DefusalKit" in ((vestItems player) + (uniformItems player) + (backpackItems player))}, {}, [_color_actions,_action_ids]] call ace_interact_menu_fnc_createAction;
_action = [_radio, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
_action_ids pushBack _action;

_radio setVariable ["barreldefusal_actionids",_action_ids];
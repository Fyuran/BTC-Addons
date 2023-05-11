/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_terminals_actions

Description:
    Fill me when you edit me !
	"Land_DataTerminal_01_F"
	"Land_Device_disassembled_F"
Parameters:
    _data - [Number from 0 to 9,Color String either red,blue or green]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_terminals_actions;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_terminal",objNull,[objNull]],
	["_data",[],[[""]]]
];

if(_data isEqualTo [] or {isNull _terminal}) exitWith {["btc_fnc_side_bombdefusal_terminals_actions: bad params %1", _this] call BIS_fnc_error};
diag_log format["btc_fnc_side_bombdefusal_terminals_actions: %1",_this];
//SHORT Examine action that will add colors actions upon examination
private _action = ["bombdefusal_terminal", "Hack", "",
{
	[_this select 0, 3] call BIS_fnc_dataTerminalAnimate;
	[10, _this,
	{
		_args params ["_target","_caller","_params"];
		_params params ["_place","_digit"];
		hint format["%1 digit: %2 ", _place, _digit];
		[_target, 0] call BIS_fnc_dataTerminalAnimate;
	}, {[_args select 0, 0] call BIS_fnc_dataTerminalAnimate}, "Hacking"] call ace_common_fnc_progressBar;
}, {true}, {}, _data] call ace_interact_menu_fnc_createAction;
_action = [_terminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_terminal setVariable ["bombdefusal_terminal_action",_action];
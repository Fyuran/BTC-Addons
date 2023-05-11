/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_test

Description:
    Fill me when you edit me !

Parameters:
    _custom - [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_test;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_bomb",objNull,[objNull]],
	["_attempts",ceil(random 3),[3]],
	["_timer",round(random [60, 85, 120]),[0]]
];
private _digits = 4; //_digits as of 18/02/2019 is currently unused
private _isMultiplayer = [0,-2] select isDedicated;
//BOMB DEFUSAL DATA PROCESSING
private _data = [];
for "_i" from 1 to _attempts do {
	private _code = "";
	private _color = [];
	for "_i" from 1 to _digits do {
		_code = _code + str(round(random 9));
		_color pushBack (selectRandom [[1,0,0,1],[0,1,0,1],[0,0,1,1]]);
	};
	_data pushBack [_code,_color];
};
_bomb setVariable ["bombdefusal_data", [_data,[_attempts,_digits,_timer]],true];

[_bomb,{
	private _action = ["bombdefusal_decode", "Get Defuse Codes", "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa", {
		hintSilent "Scanning for Codes";
		createDialog "bombdefusal_gui";
		player setVariable ["bombdefusal_bomb", _target];
		//[_target] remoteExecCall ["btc_fnc_side_bombdefusal_timer",2];
		//[] call btc_fnc_side_bombdefusal_gui_timer;
		playSound "btc_sound_bombdefusal_release";
	}, {"ToolKit" in ((vestItems player) + (uniformItems player) + (backpackItems player))}] call ace_interact_menu_fnc_createAction;
	[_this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["bombdefusal_defuse", "Defuse Device", "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_hack_ca.paa", {
		hintSilent "Attempting to defuse";
		createDialog "bombdefusal_gui";
		player setVariable ["bombdefusal_bomb", _target];
		//[_target] remoteExecCall ["btc_fnc_side_bombdefusal_timer",2];
		//[] call btc_fnc_side_bombdefusal_gui_timer;
		playSound "btc_sound_bombdefusal_release";
	}, {"ACE_DefusalKit" in ((vestItems player) + (uniformItems player) + (backpackItems player))}] call ace_interact_menu_fnc_createAction;
	[_this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["call", _isMultiplayer, _bomb];
//---------
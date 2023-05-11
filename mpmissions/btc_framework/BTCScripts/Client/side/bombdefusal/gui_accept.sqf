/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_gui_accept

Description:
    Fill me when you edit me !

Parameters:


Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_gui_accept;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define SUCCESS 1
#define WAITING 0
#define FAIL -1

private _bomb = player getVariable ["bombdefusal_bomb",objNull];
if(isNull _bomb) exitWith {diag_log format ["gui_acceptsqf, bombdefusal_bomb is wrong or empty: %1",_bomb]};

private _data = (_bomb getVariable ["bombdefusal_data",[]]) select 0;
private _data_alt = (_bomb getVariable ["bombdefusal_data",[]]) select 1;
if(_data isEqualTo []) exitWith {diag_log format ["gui_accept.sqf, bombdefusal_data is wrong or empty: %1",_data]};

private _attempt = _bomb getVariable ["bombdefusal_bomb_attempt",0];
private _attempts = _data_alt select 0;
private _isMultiplayer = [0,-2] select isMultiplayer;

private _isCorrect = call {
	private _display = findDisplay 19338;
	private _first_digit_Ctrl = _display displayCtrl 1000;
	private _second_digit_Ctrl = _display displayCtrl 1001;
	private _third_digit_Ctrl = _display displayCtrl 1002;
	private _fourth_digit_Ctrl = _display displayCtrl 1003;
	private _return = true;
	{//Check for each digit if one is found to be incorrect exit the loop and return false
		private _correct_digit = ((_data select _attempt) select 0) select [_forEachIndex,1];
		//private _correct_digit_color = ((_data select _attempt) select 1) select _forEachIndex;
		private _digit = ctrlText _x;
		//private _color = _x getVariable ["bombdefusal_digit_color",[1,1,1,1]];
		//if (!(_digit isEqualTo _correct_digit) or {!(_color isEqualTo _correct_digit_color)}) exitWith {_return = false};
		if (!(_digit isEqualTo _correct_digit)) exitWith {_return = false};
	}forEach[_first_digit_Ctrl,_second_digit_Ctrl,_third_digit_Ctrl,_fourth_digit_Ctrl];

	_return;
};

if (_isCorrect) then {
	hintSilent "correct code";
	if((_attempt) >= (_attempts - 1)) exitWith { //_attempt is used as an index and starts at 0, but _attempts is not an index
		hintSilent "Bomb defused";
		[_bomb,0,["ACE_MainActions","bombdefusal_defuse"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",_isMultiplayer,_bomb];
		[_bomb,0,["ACE_MainActions","bombdefusal_decode"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",_isMultiplayer,_bomb];
		[1] remoteExecCall ["closeDialog",_isMultiplayer];
		_bomb setVariable ["bombdefusal_manage",SUCCESS,true];
		if (BTC_DEBUG) then {
        	["btc_fnc_side_bombdefusal_gui_accept",format["%1 has been defused", _bomb]] call btc_fnc_logDebug;
    	};
	};
	playSound "btc_sound_bombdefusal_release";
	[[],{
		private _display = findDisplay 19338;
		if(isNull _display) exitWith {};
		private _first_digit_Ctrl = _display displayCtrl 1000;
		private _second_digit_Ctrl = _display displayCtrl 1001;
		private _third_digit_Ctrl = _display displayCtrl 1002;
		private _fourth_digit_Ctrl = _display displayCtrl 1003;
		[_first_digit_Ctrl,_second_digit_Ctrl,_third_digit_Ctrl,_fourth_digit_Ctrl] apply {_x ctrlSetText "0"; _x ctrlSetTextColor [1,1,1,1]};
	}] remoteExecCall ["call",_isMultiplayer];
	_bomb setVariable ["bombdefusal_bomb_attempt",_attempt + 1,_isMultiplayer];
};

if !(_isCorrect) then {
	hintSilent "Incorrect code";
	private _endtime = _bomb getVariable ["bombdefusal_endtime",_data_alt select 2];
	playSound "btc_sound_bombdefusal_error";
	_bomb setVariable ["bombdefusal_endtime",_endtime - (random 30),true];
};

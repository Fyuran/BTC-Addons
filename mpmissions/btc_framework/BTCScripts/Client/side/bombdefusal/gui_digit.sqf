/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_gui_digit

Description:
    Fill me when you edit me !

Parameters:
	_ctrl:
    _digit:
	_isPlus: if true sign is a plus therefore we increase the digit

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_gui_digit;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_digit",0,[0]],
	["_isPlus",true,[true]] //if true sign is a plus therefore we increase the digit
];
private _display = findDisplay 19338;

private _bomb = player getVariable ["bombdefusal_bomb",objNull];
if(isNull _bomb) exitWith {diag_log format ["gui_digit.sqf, bombdefusal_bomb is wrong or empty: %1",_bomb]};

private _data = (_bomb getVariable ["bombdefusal_data",[]]) select 0;
if(_data isEqualTo []) exitWith {diag_log format ["gui_digit.sqf, bombdefusal_data is wrong or empty: %1",_data]};

_digitCtrl = call {
	if(_digit == 0) exitWith {_display displayCtrl 1000};
	if(_digit == 1) exitWith {_display displayCtrl 1001};
	if(_digit == 2) exitWith {_display displayCtrl 1002};
	if(_digit == 3) exitWith {_display displayCtrl 1003};
};

playSound "btc_sound_bombdefusal_rollover";
private _str = ctrlText _digitCtrl;
if(_isPlus) then {
	private _new_str = (parseNumber _str) + 1;
	if (_new_str > 9) then {_new_str = 0};
	_digitCtrl ctrlSetText str(_new_str);
}else{
	private _new_str = (parseNumber _str) - 1;
	if (_new_str < 0) then {_new_str = 9};
	_digitCtrl ctrlSetText str(_new_str);
};

/*
private _isDecoder = "ToolKit" in ((vestItems player) + (uniformItems player) + (backpackItems player));
if(_isDecoder) then {
	private _attempt = _bomb getVariable ["bombdefusal_bomb_attempt",0];
	private _correct_digit = ((_data select _attempt) select 0) select [_digit,1];
	private _color = ((_data select _attempt) select 1) select _digit;
	_str = ctrlText _digitCtrl;
	if (_str == _correct_digit) then {
		_digitCtrl ctrlSetTextColor _color;
		_digitCtrl setVariable ["bombdefusal_digit_color",_color];
	} else {
		_digitCtrl ctrlSetTextColor [1,1,1,1];
		_digitCtrl setVariable ["bombdefusal_digit_color",[1,1,1,1]];
	};
};
*/
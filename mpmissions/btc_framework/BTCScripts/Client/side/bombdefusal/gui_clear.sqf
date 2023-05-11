/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_gui_clear

Description:
    Fill me when you edit me !

Parameters:


Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_gui_clear;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
private _display = findDisplay 19338;
private _first_digit_Ctrl = _display displayCtrl 1000;
private _second_digit_Ctrl = _display displayCtrl 1001;
private _third_digit_Ctrl = _display displayCtrl 1002;
private _fourth_digit_Ctrl = _display displayCtrl 1003;

playSound "btc_sound_bombdefusal_error";

[_first_digit_Ctrl,_second_digit_Ctrl,_third_digit_Ctrl,_fourth_digit_Ctrl] apply {_x ctrlSetText "0"; _x ctrlSetTextColor [1,1,1,1]};
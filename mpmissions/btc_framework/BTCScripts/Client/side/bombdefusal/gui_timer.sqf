/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_gui_timer

Description:
    Fill me when you edit me !

Parameters:
	_ctrl:
    _digit:
	_isPlus: if true sign is a plus therefore we increase the digit

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_gui_timer;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
private _bomb = player getVariable ["bombdefusal_bomb",objNull];

private _minutesCtrl = (findDisplay 19338) displayCtrl 1007;
private _secondsCtrl = (findDisplay 19338) displayCtrl 1008;

private _handle = [{
    _args params["_minutesCtrl","_secondsCtrl","_bomb"];
    if(isNull _minutesCtrl) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    _countdown = _bomb getVariable ["bombdefusal_time",0];
    _time_minutes = floor(_countdown / 60);
    _time_seconds = (floor _countdown) - (60 * _time_minutes);
    if(_time_seconds < 10) then{_time_seconds = format ["0%1", _time_seconds]}else{_time_seconds = str _time_seconds};
    if(_time_minutes < 10) then{_time_minutes = format ["0%1", _time_minutes]}else{_time_minutes = str _time_minutes};
    _minutesCtrl ctrlSetText _time_minutes;
    _secondsCtrl ctrlSetText _time_seconds;
    if (BTC_DEBUG) then {
        ["btc_fnc_side_bombdefusal_gui_timer",format["%1:%2", _time_minutes,_time_seconds]] call btc_fnc_logDebug;
    };
}, 1, [_minutesCtrl,_secondsCtrl,_bomb]] call CBA_fnc_addPerFrameHandler;

_bomb setVariable ["bombdefusal_timer_on",true];

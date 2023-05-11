/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_timer

Description:
    Fill me when you edit me !

Parameters:


Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_timer;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define SUCCESS 1
#define WAITING 0
#define FAIL -1

params[
	["_bomb",objNull,[objNull]]
];
if(_bomb getVariable ["bombdefusal_timer_on",false]) exitWith{};

private _end_time = ((_bomb getVariable ["bombdefusal_data",[]]) select 1) select 2;
private _start_time = CBA_missionTime;

private _handle = [{
    _args params["_start_time","_end_time","_bomb"];
    _end_time = _bomb getVariable ["bombdefusal_endtime",_end_time];
    _elapsed_time = CBA_missionTime - _start_time;
    _countdown = _end_time - _elapsed_time;
    if(_countdown <= 0) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; _bomb setVariable ["bombdefusal_manage",FAIL,true];};
    _bomb setVariable ["bombdefusal_time",_countdown,true];
    if (BTC_DEBUG) then {
        ["btc_fnc_side_bombdefusal_timer",format["tick tock: %1", _countdown]] call btc_fnc_logDebug;
    };
}, 1, [_start_time,_end_time,_bomb]] call CBA_fnc_addPerFrameHandler;

_bomb setVariable ["bombdefusal_timer_on",true];
_bomb setVariable ["bombdefusal_timer_handle",_handle];

/* ----------------------------------------------------------------------------
Function: btc_fnc_side_c4booby_timer

Description:
    Timer function for bomb defusal

Parameters:


Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_c4booby_timer;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_obj",objNull,[objNull]],
    ["_end_time",60,[0]],
	["_max_colors",1,[0]]
];
if(isNull _obj) exitWith {["btc_fnc_side_c4booby_timer: bad params  %1",_this] call BIS_fnc_error};

private _start_time = CBA_missionTime;

if(BTC_DEBUG) then {
    ["btc_fnc_side_c4booby_timer", format["started on %1", _obj]] call btc_fnc_logDebug;
};

private _handle = [{
    _args params["_start_time","_end_time","_max_colors","_obj"];
    _end_time = _obj getVariable ["c4booby_endtime",_end_time]; //in case _end_time is changed
    _elapsed_time = CBA_missionTime - _start_time;
    _countdown = _end_time - _elapsed_time;
    if(_countdown <= 0) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		_inputed_colors = _obj getVariable ["input_wire_colors",[]];
		_missing_colors = _max_colors - (count _inputed_colors);
		for "_i" from 1 to _missing_colors do {_inputed_colors pushBack ""};
		_obj setVariable ["input_wire_colors",_inputed_colors];
	};
    _sound_interval = _obj getVariable ["c4booby_sound_interval",2];
    _sound = _obj getVariable ["c4booby_sound",GetMissionPath "BTCScripts\Server\side\c4booby\sounds\timerClick.ogg"];
    if(_sound_interval > 0) then { //clusterfuck of if statements to get 3 intervals of different sounds
        if(round(_countdown) % _sound_interval == 0) then {
            playSound3D [_sound, objNull, false, getPosASL _obj, 5, 1, 50];
        };
        if(_countdown <= 10 && {_countdown > 5}) then {
            _obj setVariable ["c4booby_sound",GetMissionPath "BTCScripts\Server\side\c4booby\sounds\timerClickShort.ogg"];
            _obj setVariable ["c4booby_sound_interval",1];
        };
        if(_countdown <= 5) then {
            _obj setVariable ["c4booby_sound_interval",0];
        };
    } else {
        if(_sound_interval isEqualTo 0) then {
            playSound3D [GetMissionPath "BTCScripts\Server\side\c4booby\sounds\timerEnd.ogg", objNull, false, getPosASL _obj, 5, 1, 50];
            _obj setVariable ["c4booby_sound_interval",-1];
        };
    };

    _obj setVariable ["c4booby_time",_countdown,true];
}, 1, [_start_time,_end_time,_max_colors,_obj]] call CBA_fnc_addPerFrameHandler;

_obj setVariable ["c4booby_timer_handle",_handle];
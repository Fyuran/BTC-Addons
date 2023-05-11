/* ----------------------------------------------------------------------------
Function: btc_fnc_side_mission_timer

Description:
    Initiates countdown, once it reaches zero, mission will end
Parameters:
    _timer: time in seconds
Returns:

Examples:
    (begin example)
        [] call btc_fnc_side_mission_timer
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_end_time", 60, [60]]
];
private _start_time = CBA_missionTime;
private _isMultiplayer = [0,-2] select isDedicated;
BTC_missionTime = 0;

private _handle = [{
	_args params["_start_time","_end_time"];
	_elapsed_time = CBA_missionTime - _start_time;
	BTC_missionTime = _end_time - _elapsed_time;
	if(BTC_missionTime <= 0) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		"endTimer" call BIS_fnc_endMissionServer;
	};
	if((floor BTC_missionTime) isEqualTo 10) then {
	 //Performance warning: SimpleSerialization::Read 'params' is using type of ,'TEXT' which is not optimized by simple serialization
		[[],{
			_time = 10;
			while {_time >= 0 } do {
				hintSilent parseText format["<t size=2> TIME: %1 </t>",floor _time];
				playSound "btc_missionTimer_tick";
				sleep 1;
				_time = _time - 1;
			};
		}] remoteExecCall ["spawn",0];
	};
}, 1, [_start_time,_end_time]] call CBA_fnc_addPerFrameHandler;

//SHOW TIMER ACTION
[{
	_action = ["side_missiontimer_getTime", "Remaining time", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa",
	{
		[clientOwner,"BTC_missionTime"] remoteExecCall ["publicVariableClient",2]; //ask server for BTC_missionTime
	}, {true}] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	"BTC_missionTime" addPublicVariableEventHandler {
		_time_hours = floor(BTC_missionTime / 3600);
		_time_minutes = (floor(BTC_missionTime / 60)) % 60;
		_time_seconds = (floor BTC_missionTime) % 60;
		if(_time_hours < 10) then{_time_hours = format ["0%1", _time_hours]};
		if(_time_minutes < 10) then{_time_minutes = format ["0%1", _time_minutes]};
		if(_time_seconds < 10) then{_time_seconds = format ["0%1", _time_seconds]};
		diag_log format ["btc_fnc_side_mission_timer _this: %1", _this];
		hint format ["Time Remaining: %1:%2:%3",_time_hours,_time_minutes,_time_seconds];
	};
}] remoteExecCall ["call",_isMultiplayer,true];


if(BTC_DEBUG) then {
	["btc_fnc_side_mission_timer",format["started with %1 max seconds.", _end_time]] call btc_fnc_logDebug;
};
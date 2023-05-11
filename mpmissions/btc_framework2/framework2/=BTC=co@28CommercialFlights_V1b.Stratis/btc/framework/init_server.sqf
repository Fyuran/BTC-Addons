/* ----------------------------------------------------------------------------
Function: init_server.sqf

Description:

Parameters:


Returns:


Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */
#include "script_component.hpp"
LOG("init_server.sqf executed");

setTimeMultiplier GVAR(TIMEACC);

if(GVAR(SHORTER_NIGHTS)) then {
    private _AccFactDay = timeMultiplier;
    BTC_SHORTER_NIGHTS_handle = [{
        if ( daytime >= 21 || {daytime <= 3}) then {
            _AccFactNight = _args * 3;
            setTimeMultiplier _AccFactNight;
        } else {setTimeMultiplier _args};
    }, 300, _AccFactDay] call CBA_fnc_addPerFrameHandler; //check the hour every x seconds(default: 300), change to your liking.
};

[] call FUNC(findCities);

call compile preprocessFileLineNumbers "classesPools.hpp"; //Store all modules classes

if(GVAR(FPS)) then {call FUNC(showFPSInit)};
if (GVAR(DEBUG_LOG)) then {
	GVAR(FPSHandle) = [{
		diag_log format["[FPS], Server, %1", round diag_fps];
		[{
			[format["[FPS], %1, %2", player getVariable ["ACE_Name", player], round diag_fps]] remoteExecCall ["diag_log", 2];
		}] remoteExecCall ["call",-2];
	}, GVAR(FPSInterval), []] call CBA_fnc_addPerFrameHandler;
};
if(GVAR(ANIMALS)) then {call FUNC(animalSpawn)};
if(GVAR(FLYBY)) then {call FUNC(flyBy)};
if(GVAR(ENEMY)) then {GVAR(enTrgs) = []; GVAR(EnemySpawn) apply {_x call FUNC(setEnTrgs)}};
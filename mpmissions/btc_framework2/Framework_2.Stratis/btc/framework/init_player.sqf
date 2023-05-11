/* ----------------------------------------------------------------------------
Function: init_player.sqf

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
LOG("init_player.sqf executed");

[{!isNull player && {player == player}}, {
	if (!(GVAR(DEBUG_LOG)) && {GVAR(INTRO)}) then {	
		["CBA_loadingScreenDone", {[] spawn FUNC(intro)}] call CBA_fnc_addEventHandler;
	};
	if(GVAR(DEBUG_LOG) && {!(GVAR(INTRO))}) then {GVAR(FPSTestPos) spawn FUNC(testFPS)};
	enableSentences false;
	player addRating 20000;
	if (GVAR(VCOM)) then {[] call VCM_fnc_VcomInitClient};

	#ifdef DEBUG_MODE_FULL
	[] call FUNC(draw3Ds);
	#endif
}] call CBA_fnc_waitUntilAndExecute;
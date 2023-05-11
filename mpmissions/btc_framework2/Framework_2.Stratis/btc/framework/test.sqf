#ifndef VCM_FNC_PATH
	#define VCM_FNC_PATH btc\framework\extScripts\Vcom\Functions
	#define VCM_FSM_PATH btc\framework\extScripts\Vcom\FSMS
	#define QUOTE(var1) #var1
	#define VCM_FN_PREFIX(var1) fn_##var1
	#define VCM_QPATHTOF(var1) QUOTE(VCM_FNC_PATH\VCM_FN_PREFIX(var1.sqf))
	#define VCM_QPATHTOFFSM(var1) QUOTE(VCM_FSM_PATH\VCM_FN_PREFIX(var1.fsm))
	#define VCM_FUNC(var1) VCM_fnc_##var1 
	#define VCM_QFUNC(var1) QUOTE(VCM_FUNC(var1))
#endif

diag_log format["[VCM_AI] macro test VCM_QFUNC: %1", VCM_QFUNC(test)];
diag_log format["[VCM_AI] macro test VCM_QPATHTOF: %1", VCM_QPATHTOF(test)];
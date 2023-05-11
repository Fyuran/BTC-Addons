#define DEBUG_MODE_FULL
#define PREFIX btc
#define COMPONENT framework
#include "\x\cba\addons\main\script_macros_mission.hpp"
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncType,fncName) GVAR(DOUBLES(fnc,fncName)) = compile preprocessFileLineNumbers QPATHTOF(scripts\fncType\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncType,fncName) [QPATHTOF(scripts\fncType\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_deactivateCity

Description:
Activates city

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_deactivateCity;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]]
]) exitWith {ERROR_1("%1 bad _trg", QFUNC(deactivateCity))};

[_trg] call FUNC(destroyCivModule);
[_trg] call FUNC(destroyTrafficModule);
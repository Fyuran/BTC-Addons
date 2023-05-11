
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_activateCity

Description:
Activates city

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_activateCity;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params [
	["_trg", objNull, [objNull]]
]) exitWith {ERROR_2("%1 bad params %2", QFUNC(activateCity), _this)};

private _type = _trg getVariable [QGVAR(type), "NameLocal"];

if(GVAR(CIV)) then {
    if !(_type isEqualTo "Hill") then {[_trg, GVAR(NCIVS)] call FUNC(createCivModule)};
};

if(GVAR(TRAFFIC)) then {
    [_trg, GVAR(NTRAFFIC)] call FUNC(createTrafficModule);
};
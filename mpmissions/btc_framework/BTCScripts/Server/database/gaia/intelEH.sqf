/* ----------------------------------------------------------------------------
Function: btc_fnc_database_gaia_intelEH

Description:
    Manages Killed EH and GLOBAL var.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_gaia_intelEH;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __MAX_DEAD 15
if(!params[
	["_unit", objNull, [objNull]], 
	["_killer", objNull, [objNull]]
]) exitWith {};

if(!isPlayer _killer) exitWith {};
_side = (getNumber(configfile >> "CfgVehicles" >> typeOf _unit >> "side")) call BIS_fnc_sideType; //calling side on _unit will always give CIV as it's a body
if(_side isEqualTo civilian || {_side isEqualTo BTC_PLAYER_SIDE}) exitWith {};

btc_database_unitsKilled = missionNamespace getVariable ["btc_database_unitsKilled", 0];
missionNamespace setVariable ["btc_database_unitsKilled", btc_database_unitsKilled + 1, true];
if (btc_database_unitsKilled >= __MAX_DEAD) then {
	missionNamespace setVariable ["btc_database_unitsKilled", 0, true];
	[_unit] call btc_fnc_database_gaia_intelDrop;
	if(BTC_DEBUG) then {
		["btc_fnc_database_gaia_intelEH", format["%1 killed by %2 called for intel drop", _unit, _killer]] call btc_fnc_logDebug;
	};
};
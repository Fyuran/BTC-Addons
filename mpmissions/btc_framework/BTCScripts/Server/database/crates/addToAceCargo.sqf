/* ----------------------------------------------------------------------------
Function: btc_fnc_database_crates_addToAceCargo

Description:
    Parses global var crates database.

Parameters:


Returns:

Examples:
    (begin example)
        [crate_1] call btc_fnc_database_crates_addToAceCargo;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params [
	["_v",objNull,[objNull]],
	["_pos",[0,0,0],[[]]]
])exitWith{["btc_fnc_database_crates_addToAceCargo", format["bad params %1", _this]] call btc_fnc_logDebug};

_pos set [2,0]; //check at ground level
private _nearVehicle = nearestObject [_pos, "LandVehicle"];
//if(isNull _nearVehicle) exitWith {};

if(!([_v, _nearVehicle, true] call ace_cargo_fnc_loadItem)) then {_v setPos (_pos getPos [10,random 360])};
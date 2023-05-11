/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehs_set_magazines

Description:
    Sets magazines from save to vehicle

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject, _save_magazines] call btc_fnc_database_vehs_set_magazines
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __CLASS__ 0
#define __TURRET_PATH__ 1
#define __AMMO_COUNT__ 2

params[
	["_vehicle",objNull,[objNull]],
	["_save_magazines",[],[[]]]
];

if(!local _vehicle) exitWith {["btc_fnc_database_vehs_set_magazines", format["%1 is null",_vehicle]] call btc_fnc_logDebug};

private _magazines = _vehicle call btc_fnc_database_vehs_get_magazines;

if !(_magazines isEqualTo _save_magazines) then {
	_save_magazines apply {_vehicle removeMagazinesTurret [_x select __CLASS__, _x select __TURRET_PATH__]};
	_save_magazines apply {_vehicle addMagazineTurret [_x select __CLASS__,_x select __TURRET_PATH__, _x select __AMMO_COUNT__]};
};

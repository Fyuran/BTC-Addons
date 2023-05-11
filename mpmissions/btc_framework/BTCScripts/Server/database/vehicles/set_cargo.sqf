/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehs_set_cargo

Description:
    Set inventory from save to vehicle

Parameters:


Returns:

Examples:
    (begin example)
        cursorObject call btc_fnc_database_vehs_set_cargo;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __CLASS__ 0
#define __COUNT__ 1

#define __ITEMS__ 0
#define __BACKPACKS__ 1
#define __MAGAZINES__ 2
#define __WEAPONS__ 3

params[
	["_vehicle",objNull,[objNull]],
	["_save_cargo",[],[[]]]
];

private _cargo = _vehicle call btc_fnc_database_vehs_get_cargo;

if !(_cargo isEqualTo _save_cargo) then {

	clearItemCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	private ["_classes","_count","_category"];
	{
		_classes = _x select __CLASS__;
		if !(_classes isEqualTo []) then {
			_count = _x select __COUNT__;
			_category = _forEachIndex;
			{
				[] call {
					if(_category == __MAGAZINES__) exitWith {_vehicle addMagazineCargoGlobal [_x, _count select _forEachIndex]};
					if(_category == __ITEMS__) exitWith {_vehicle addItemCargoGlobal [_x, _count select _forEachIndex]};
					if(_category == __WEAPONS__) exitWith {_vehicle addWeaponCargoGlobal [_x, _count select _forEachIndex]};
					if(_category == __BACKPACKS__) exitWith {_vehicle addBackpackCargoGlobal [_x, _count select _forEachIndex]};
					["btc_fnc_database_vehs_set_cargo: bad category %1",_category] call BIS_fnc_error;
				};
			}forEach _classes;
		};
	}forEach _save_cargo;
};
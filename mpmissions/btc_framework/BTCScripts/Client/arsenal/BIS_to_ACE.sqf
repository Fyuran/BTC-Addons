
/* ----------------------------------------------------------------------------
Function: btc_fnc_arsenal_BIS_to_ACE

Description:
    Adds interaction to object from which BIS arsenal items are ported to ACE arsenal

Parameters:
    _object - [Object]

Returns:

Examples:
    (begin example)
    [_crate] call btc_fnc_arsenal_BIS_to_ACE;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
params [
	["_object", [], [objNull]]
];

if (isNull _object) exitWith {};

private _BIS_arsenal_items =
([_object] call BIS_fnc_getVirtualBackpackCargo) +
([_object] call BIS_fnc_getVirtualItemCargo) +
([_object] call BIS_fnc_getVirtualMagazineCargo) +
([_object] call BIS_fnc_getVirtualWeaponCargo);

if("%ALL" in _BIS_arsenal_items) then {[_object, true, false] call ace_arsenal_fnc_initBox}
	else {[_object, _BIS_arsenal_items, false] call ace_arsenal_fnc_initBox};

diag_log format ["btc_fnc_arsenal_BIS_to_ACE to %1", _object];

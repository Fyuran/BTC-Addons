
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_BIS_to_ACE

Description:
    Adds interaction to object from which BIS arsenal items are ported to ACE arsenal

Parameters:
    _ammoBox - [Object]

Returns:

Examples:
    (begin example)
    [_crate] call btc_framework_fnc_BIS_to_ACE;
    (end)

Public: No

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params[
    ["_ammoBox", objNull, [objNull]]
];
LOG_2("btc_framework_fnc_BIS_to_ACE inspecting %1(%2)",_this,[_ammoBox] call BIS_fnc_getVirtualWeaponCargo);
if(!([_ammoBox] call BIS_fnc_getVirtualWeaponCargo isEqualTo [])) then {
    _BIS_arsenal_items =
    ([_ammoBox] call BIS_fnc_getVirtualBackpackCargo) +
    ([_ammoBox] call BIS_fnc_getVirtualItemCargo) +
    ([_ammoBox] call BIS_fnc_getVirtualMagazineCargo) +
    ([_ammoBox] call BIS_fnc_getVirtualWeaponCargo);

    if("%ALL" in _BIS_arsenal_items) then {[_ammoBox, true, false] call ace_arsenal_fnc_initBox}
    else {[_ammoBox, _BIS_arsenal_items, false] call ace_arsenal_fnc_initBox};
    LOG_1("btc_framework_fnc_BIS_to_ACE to %1",_ammoBox);
};


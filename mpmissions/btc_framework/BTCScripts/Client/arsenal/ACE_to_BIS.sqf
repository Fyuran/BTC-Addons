
/* ----------------------------------------------------------------------------
Function: btc_fnc_arsenal_ACE_to_BIS

Description:
    Adds interaction to object from which ACE arsenal items are ported to BIS arsenal

Parameters:
    _object - [Object]

Returns:

Examples:
    (begin example)
    [_crate] call btc_fnc_arsenal_ACE_to_BIS;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
params [
	["_object", [], [objNull]]
];

if (isNull _object) exitWith {};
private _virtualItems = _object getVariable ["ace_arsenal_virtualItems", [ /*
    [[], [], []], // Weapons 0, primary, secondary, handgun
    [[], [], [], []], // WeaponAccessories 1, optic,side,muzzle,bipod
    [ ], // Magazines 2
    [ ], // Headgear 3
    [ ], // Uniform 4
    [ ], // Vest 5
    [ ], // Backpacks 6
    [ ], // Goggles 7
    [ ], // NVGs 8
    [ ], // Binoculars 9
    [ ], // Map 10
    [ ], // Compass 11
    [ ], // Radio slot 12
    [ ], // Watch slot  13
    [ ], // Comms slot 14
    [ ], // WeaponThrow 15
    [ ], // WeaponPut 16
    [ ] // InventoryItems 17 */
]];
if (_virtualItems isEqualTo []) exitWith {["btc_fnc_arsenal_ACE_to_BIS", format["%1 has no ACE virtual items",_object]] call btc_fnc_logDebug};

private _weaponClasses = ((_virtualItems select 0) select 0) + ((_virtualItems select 0) select 1) + ((_virtualItems select 0) select 2);
private _itemClasses = ((_virtualItems select 1) select 0) + ((_virtualItems select 1) select 1) + ((_virtualItems select 1) select 2) + ((_virtualItems select 1) select 3) +
(_virtualItems select 3) + (_virtualItems select 4) + (_virtualItems select 5) + (_virtualItems select 7) + (_virtualItems select 8) + (_virtualItems select 9) + (_virtualItems select 10) + (_virtualItems select 11) + (_virtualItems select 12) + (_virtualItems select 13) + (_virtualItems select 17);
private _magazineClasses = (_virtualItems select 2) + (_virtualItems select 15) + (_virtualItems select 16);
private _backpackClasses = _virtualItems select 6;

[_object, _weaponClasses, false, true] call BIS_fnc_addVirtualWeaponCargo;
[_object,_itemClasses, false, false] call BIS_fnc_addVirtualItemCargo;
[_object, _magazineClasses, false, false] call BIS_fnc_addVirtualMagazineCargo;
[_object,_backpackClasses, false, false] call BIS_fnc_addVirtualBackpackCargo;


diag_log format ["btc_fnc_arsenal_ACE_to_BIS to %1", _object];
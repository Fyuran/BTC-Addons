/* ----------------------------------------------------------------------------
Function: btc_fnc_database_recycle_InventoryRecycle

Description:
    Recycles object's inventory to btc_database_shop

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_database_recycle_InventoryRecycle;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __OPFOR 0
#define __BLUFOR 1
#define __INDFOR 2
params[
	["_target", objNull, [objNull]],
	["_caller", objNull, [objNull]]
];
if (!alive _target) exitWith {["btc_fnc_database_recycle_InventoryRecycle: bad params %1", _this]};
/*private _sideID = [side player] call BIS_fnc_sideID;
if !(_sideID in [__OPFOR, __BLUFOR, __INDFOR]) exitWith {[format["btc_fnc_database_recycle_addActions: %1 cannot edit money on this side %2", player, side player]] call btc_fnc_debugLog};*/

/*private _shop_data = missionNamespace getVariable ["btc_database_shop_data",[[],[]]];
_shop_data params ["_classes", "_prices"];*/

private _change = 0;
private["_i", "_class", "_weapon", "_item", "_magazine"];

private _weaponsItemsCargo = weaponsItemsCargo _target;
for "_i" from (count _weaponsItemsCargo - 1) to 0 step -1 do {
	if (((_weaponsItemsCargo select _i) select 0) isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {_weaponsItemsCargo deleteAt _i};
};
_weaponsItemsCargo apply { //set arrays class names' lower cased
	_i = _x;
	{
		if(_x isEqualType "") then {_i set [_forEachIndex, toLower _x]}
		else {
			if !(_x isEqualTo []) then {_x set [0, toLower (_x select 0)]}
		}
	}forEach _i;
};
_weaponsItemsCargo apply {
	_x apply { //find index of the class, then get the price then add it
		//_class = _x;
		//_i = _classes findIf {_x isEqualTo _class};
		//if(_i != -1) then {
			//_change = _change + (_prices select _i);
			_change = count _weaponsItemsCargo;
			_weapon = _x param [0, ""];
			[_target, _weapon, {_x select 0 isEqualTo _weapon} count _weaponsItemsCargo, false] call CBA_fnc_removeWeaponCargo; //fnc is global
		//};
	};
};
//after weapon is dissambled, sell the remaining pieces
/*private _itemsCargo = itemCargo _target apply {toLower _x};
private _magazinesCargo = magazineCargo _target apply {toLower _x};
_itemsCargo apply {
	_item = _x;
	_i = _classes findIf {_x isEqualTo _item};
	if(_i != -1) then {
		_change = _change + (_prices select _i);
		[_target, _item, {_x isEqualTo _item} count _itemsCargo, true] call CBA_fnc_removeItemCargo;
	};
};
_magazinesCargo apply {
	_magazine = _x;
	_i = _classes findIf {_x isEqualTo _magazine};
	if(_i != -1) then {
		_change = _change + (_prices select _i);
		[_target, _magazine, {_x isEqualTo _magazine} count _magazinesCargo, -1] call CBA_fnc_removeMagazineCargo;
	};
};*/
["btc_fnc_database_recycle_InventoryRecycle", format["%1(%2) has recycled %3's inventory %4, total gain: %5", player, steamProfileUrl, typeOf _target, _weaponsItemsCargo+_itemsCargo+_magazinesCargo, _change]] call btc_fnc_logDebug;

if (_change <= 0) exitWith {hint "No money to gain from this inventory.";};
hint format ["Inventory recycled, total gain %1 $", _change];

if(!alive _caller) then {_target addItemCargoGlobal ["btc_money_stack", _change]}
else {_caller addItemCargoGlobal ["btc_money_stack", _change]};

//btc_database_money set [_sideID, (btc_database_money select _sideID) + _change];
//publicVariable "btc_database_money";


playSound3D [GetMissionPath "BTCScripts\Client\database\urepair.ogg", objNull, false, getPosASL _target, 5, 1, 50];


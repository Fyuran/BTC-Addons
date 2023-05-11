/* ----------------------------------------------------------------------------
Function: btc_fnc_database_shop_init

Description:
    Broadcast to global missionNamespace current amount of money belonging to SIDE

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_shop_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_shops", [], [[]]],
	["_recycleBins", [], [[]]]
];
#define __SHOP _x

/*btc_database_money = profileNamespace getVariable ["btc_database_money", [0,0,0]];*/
/*profileNamespace setVariable ["btc_database_money", btc_database_money];
"btc_database_money" addPublicVariableEventHandler {profileNamespace setVariable ["btc_database_money", btc_database_money]};
publicVariable "btc_database_money";*/
btc_database_recycleBins = _recycleBins;
btc_database_shops = _shops;
publicVariable "btc_database_shops";
publicVariable "btc_database_recycleBins";
private _isMp = [0,-2] select isDedicated;

[_recycleBins] remoteExecCall ["btc_fnc_database_recycle_addActions", _isMp, true];
_shops apply {
	__SHOP setVariable ["ace_cargo_hasCargo", false, true];
	[__SHOP] remoteExecCall ["TER_fnc_addShop", _isMp, __SHOP];
	clearItemCargoGlobal __SHOP; clearWeaponCargoGlobal __SHOP; clearBackpackCargoGlobal __SHOP; clearMagazineCargoGlobal __SHOP;
	[{!(_this getVariable ["bis_fnc_arsenal_action",-1] isEqualTo -1)}, {_this removeAction (_this getVariable ["bis_fnc_arsenal_action",-1])}, __SHOP] remoteExecCall ["CBA_fnc_waitUntilAndExecute", _isMp, __SHOP];
};

	/* ----------------------------------------------------------------------------
Function: btc_fnc_database_init

Description:
    Database init

Parameters:


Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(BTC_PERSISTENCE_CLEAR) then {[] call btc_fnc_database_clear};
[] call btc_fnc_database_players_init;
[[arsenal_1], [persist_crate_4]] call btc_fnc_database_shop_init;
[] call btc_fnc_database_vehs_init; //editor vehicles are included
[] call btc_fnc_database_mhqs_init;
[[persist_crate_1, persist_crate_2, persist_crate_3, persist_crate_4]] call btc_fnc_database_crates_init; //Add editor placed crates in array
[] call btc_fnc_database_gaia_init;
/* [HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]*/
[[sector_1, sector_2], [
	[[3,1],[3,1],[1,2,50],[1,30],[2,50],[0,0],[BTC_ENEMY_FACTION,[1,0] select BTC_DEBUG,1500,BTC_ENEMY_SIDE,false,false]],
	[[3,1],[3,1],[1,2,50],[1,30],[2,50],[0,0],[BTC_ENEMY_FACTION,[1,0] select BTC_DEBUG,1500,BTC_ENEMY_SIDE,false,false]]
]] call btc_fnc_database_sectors_init;
[] call btc_fnc_database_dataCheck;

//Get every weapon mags and get every item then add both to cargo
private _mags = [];
(arsenal_1 call BIS_fnc_getVirtualMagazineCargo) apply {_mags pushBack _x; _mags pushBack 0; _mags pushBack true};
private _items = [];
(arsenal_1 call BIS_fnc_getVirtualItemCargo) apply {_items pushBack _x; _items pushBack 0; _items pushBack true};
[arsenal_1, _mags+_items] call TER_fnc_addShopCargo;

/*
get weapons classes: cursorObject call BIS_fnc_getVirtualWeaponCargo
get optics classes: cursorObject call BIS_fnc_getVirtualItemCargo select {isClass(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "OpticsModes")}
get muzzles classes: cursorObject call BIS_fnc_getVirtualItemCargo select {getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "hasBipod") isEqualTo 1}
get bipod classes: cursorObject call BIS_fnc_getVirtualItemCargo select {isNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "hasBipod")}
get backpacks classes: cursorObject call BIS_fnc_getVirtualBackpackCargo
get NVGS and Binoculars classes: cursorObject call BIS_fnc_getVirtualItemCargo select {[configFile >> "CfgWeapons" >> _x, configFile >> "CfgWeapons" >> "Binocular"] call CBA_fnc_inheritsFrom}
get UAV_terminals classes: cursorObject call BIS_fnc_getVirtualItemCargo select {[configFile >> "CfgWeapons" >> _x, configFile >> "CfgWeapons" >> "UavTerminal_base"] call CBA_fnc_inheritsFrom}
Shop whitelist*/
[arsenal_1, [
		//Weapons
		"srifle_DMR_06_olive_F", 12, true,
		"rhs_weap_m16a4_carryhandle_M203", 12, true,
		"rhs_weap_m24sws", 12, true,
		"rhs_weap_m4a1_carryhandle", 12, true,
		"rhs_weap_m240B", 12, true,
		"rhs_weap_m249_pip_S_vfg", 12, true,
		"rhs_weap_m249_pip_S", 12, true,
		"hgun_P07_F", 12, true,
		"rhs_weap_XM2010", 12, true,
		"rhs_weap_m82a1", 12, true,
		"srifle_EBR_F", 12, true,
		"ws_m4a1_blockII_a", 12, true,
		"ws_m4a1_blockII_b", 12, true,
		"ws_m4a1_blockII_c", 12, true,
		"ws_m4a1_blockII_d", 12, true,
		"ws_m4a1_e", 12, true,
		"ws_m4a1_f", 12, true,
		"rhs_weap_m4a1_blockII_d", 12, true,
		"rhs_weap_m4a1_blockII_M203_d", 12, true,
		"rhs_weap_M590_8RD", 12, true,
		//Vests
		"V_PlateCarrierSpec_rgr", 36, true,
		"VSM_OGA_IOTV_1", 12, true,
		"VSM_OGA_OD_IOTV_1", 12, true,
		"VSM_CarrierRig_Operator_OGA", 12, true,
		"VSM_CarrierRig_Breacher_OGA", 12, true,
		"VSM_CarrierRig_Gunner_OGA", 12, true,
		"V_PlateCarrier1_rgr_noflag_F", 12, true,
		"VSM_CarrierRig_RTO_OGA", 12, true,
		//Optics
		"rhsusf_acc_ACOG_d", 12, true,
		"rhsusf_acc_ACOG_d_3d", 12, true,
		"rhsusf_acc_ACOG_RMR", 12, true,
		"rhsusf_acc_ACOG_RMR_3d", 12, true,
		"rhsusf_acc_LEUPOLDMK4_2", 12, true,
		"rhsusf_acc_su230a_mrds", 12, true,
		"rhsusf_acc_ACOG_MDO", 12, true,
		"optic_Holosight_blk_F", 12, true,
		"rhsusf_acc_eotech_552", 12, true,
		//Muzzles
		"muzzle_snds_M", 12, true,
		"muzzle_snds_m_snd_F", 12, true,
		"ACE_muzzle_mzls_L", 12, true,
		"rhsusf_acc_m24_silencer_black", 12, true,
		"muzzle_snds_B", 12, true,
		"rhsusf_acc_M2010S_wd", 12, true,
		//Bipods
		"rhsusf_acc_grip2", 12, true,
		"rhsusf_acc_rvg_blk", 12, true,
		"rhsusf_acc_grip4", 12, true,
		"rhsusf_acc_tacsac_blk", 12, true,
		"rhsusf_acc_tdstubby_blk", 12, true,
		"rhsusf_acc_grip3", 12, true,
		"rhsusf_acc_grip1", 12, true,
		"rhusf_acc_saw_bipod", 12, true,
		//Backpacks
		"B_Respawn_TentDome_F", 12, true,
		"ace_gunbag", 12, true,
		"B_UAV_01_backpack_F", 12, true,
		"B_rhsusf_B_BACKPACK", 12, true,
		"VSM_OGA_Backpack_Compact", 12, true,
		"VSM_OGA_Backpack_Kitbag", 12, true,
		"VSM_OGA_carryall", 12, true,
		"B_Bergen_mcamo_F", 12, true,
		"TFAR_rt1523g_black", 12, true,
		//NVGS and Binoculars
		"Binocular", 12, true,
		"Laserdesignator", 12, true,
		"ACE_Vector", 12, true,
		"ACE_NVG_Gen4", 12, true,
		"rhsusf_bino_m24_ARD", 12, true,
		//GPS and UAV Terminals
		"B_UavTerminal", 12, true,
		"ItemGPS", 12, true
	]
] call TER_fnc_addShopCargo; //Format: [_shop, ["class", price, amount OR boolean(true unlimited, false not available...]] call TER_fnc_addShopCargo;

//Local to players
[] remoteExecCall ["btc_fnc_database_actions", 0, true];
[] remoteExecCall ["btc_fnc_database_vehicles_AddActions", 0, true];
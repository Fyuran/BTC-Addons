/*
	Author: =BTC= Fyuran

	Description:
	Inits a price table for getItemValues function

	Parameter(s):

	Returns:

*/
#define __MAGWELL _x
#define __MAGWELLCFG _x
#define __MAGAZINE _x
#define __AMMO _x
#define __WEAPON _x
#define __OPTIC _x
#define __ARMOR _x
#define __MUZZLE _x

private _cfg = configFile;
private _allCfgWeapons = "true" configClasses (_cfg >> "CfgWeapons");
btc_database_shop_data = [[""],[0]];
btc_database_shop_data params ["_classes", "_prices"];

private _weapons = _allCfgWeapons select {([_x, _cfg >> "CfgWeapons" >> "Rifle"] call CBA_fnc_inheritsFrom) or ([_x, _cfg >> "CfgWeapons" >> "Launcher"] call CBA_fnc_inheritsFrom) or ([_x, _cfg >> "CfgWeapons" >> "Pistol"] call CBA_fnc_inheritsFrom)};
private ["_weaponMagsCfg", "_weaponMag", "_weaponMagWells", "_magAmmo", "_price", "_OpticsModes", "_ammoCount", "_HitpointsProtectionInfo", "_audibleFire"];
_weapons apply {
	_weaponMagWells = getArray(__WEAPON >> "magazineWell");
	_weaponMagsCfg = [];
	_weaponMagWells apply {(configProperties [_cfg >> "CfgMagazineWells" >> __MAGWELL]) apply {_weaponMagsCfg pushBack __MAGWELLCFG}};

	_weaponMag = [];
	_weaponMagsCfg apply {_weaponMag append getArray __MAGWELLCFG};
	_weaponMag = _weaponMag arrayIntersect (getArray(__WEAPON >> "magazines"));

	_magAmmo = [];
	_weaponMag apply {_magAmmo pushBackUnique (getText(_cfg >> "CfgMagazines" >> __MAGAZINE >> "ammo"))};

	_price = 0;
	_magAmmo apply {
		_hit = getNumber(_cfg >> "CfgAmmo" >> __AMMO >> "hit");
		_caliber = getNumber(_cfg >> "CfgAmmo" >> __AMMO >> "caliber");
		if(_caliber > 0) then {_hit = _hit * _caliber};
		_price = _price + _hit;
	};
	if(count _magAmmo > 0) then {_price = _price / count _magAmmo};
	if (_price <= 0) then {_price = 10};
	if (configName __WEAPON isEqualTo "launch_NLAW_F") then {_price = 175};
	_classes pushBack tolower configName __WEAPON; _prices pushBack round _price;
};

private _magazines = ("(getNumber (_x >> 'scope')) isEqualTo 2" configClasses (_cfg >> "CfgMagazines")) apply {configName _x};
private _magWells = [];
("true" configClasses (_cfg >> "CfgMagazineWells") apply {configProperties [_x]}) apply {_x apply {_magWells append getArray _x}}; //get every class name of magwells' arrays
_magazines append _magWells;
_magazines apply {
	_ammoCount = getNumber(_cfg >> "CfgMagazines" >> _x >> "count");
	_price = 0;
	_price = _price + _ammoCount / 100;
	_classes pushBack tolower _x; _prices pushBack ceil _price;
};

private _items = _allCfgWeapons select {[_x, _cfg >> "CfgWeapons" >> "ItemCore"] call CBA_fnc_inheritsFrom or ([_x, _cfg >> "CfgWeapons" >> "HeadgearItem"] call CBA_fnc_inheritsFrom)};
private _optics = _items select {isClass(__OPTIC >> "ItemInfo" >> "OpticsModes")};
_optics apply {
	_OpticsModes = configProperties [__OPTIC >> "ItemInfo" >> "OpticsModes"];
	_price = 0;
	_OpticsModes apply {_price = _price + getNumber(_x >> "distanceZoomMax") / 100 };
	_classes pushBack tolower configName __OPTIC; _prices pushBack round _price;
};
private _armor = _items select {isClass(__ARMOR >> "ItemInfo" >> "HitpointsProtectionInfo")};
_armor apply {
	_HitpointsProtectionInfo = configProperties [__ARMOR >> "ItemInfo" >> "HitpointsProtectionInfo"];
	if !(_HitpointsProtectionInfo isEqualTo []) then {
		_price = 0;
		_HitpointsProtectionInfo apply {_price = _price + getNumber(__ARMOR >> "armor")};
		_price = _price / count _HitpointsProtectionInfo;
		_classes pushBack tolower configName __ARMOR; _prices pushBack round _price;
	};
};
private _muzzles = _items select {isClass(__MUZZLE >> "ItemInfo" >> "AmmoCoef")};
_muzzles apply {
	_price = 1 / getNumber(__MUZZLE >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
	_classes pushBack tolower configName __MUZZLE; _prices pushBack round _price;
};

missionNamespace setVariable ["btc_database_shop_data", btc_database_shop_data, true];
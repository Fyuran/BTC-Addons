/* ----------------------------------------------------------------------------
Function: btc_fnc_side_captive_unit_init

Description:
    Initializes a captive unit to be randomly positioned at passed _positions

Parameters:
	_positions: ARRAY of OBJECTS
	_unit: class STRING or OBJECT

Returns:

Examples:
    (begin example)
    	[] call btc_fnc_side_captive_unit_init;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_positions",[0,0,0],[[objNull]]],
	["_unit","",["",objNull]]
];

//security check and createUnit in case class is passed instead of Object
if(_unit isEqualType "") then {
	if(isClass (configFile >> "CfgVehicles" >> _unit)) then {
		private _side = getNumber (configFile >> "CfgVehicles" >> _unit >> "side");
		_side = _side call BIS_fnc_sideType;
		private _group = createGroup [_side,true];
		_unit = _group createUnit  [_unit, [0,0,0], [], 0, "CAN_COLLIDE"];
	};
};
//in case unit is still a STRING exit to prevent clusterfuck and return a objNull so that the caller function can manage a exitWith{}
if(_unit isEqualType "") exitWith {["btc_fnc_side_captive_unit_init: bad captive unit class %1",_unit] call BIS_fnc_error;objNull};

//random position selection
private _spot = selectRandom _positions;

if(BTC_DEBUG) then{
	["btc_fnc_side_captive_unit_init",format["%1 selected for [%2, %3]",_spot, typeOf _unit, _unit]] call btc_fnc_logDebug;
};

//captive init and fuckup avoidal
_unit allowDamage false;
_unit setPosASL (getPosASL _spot);
removeAllWeapons _unit;
_unit setCaptive true;
[_unit, true] call ACE_captives_fnc_setHandcuffed;
_unit setVariable ["acex_headless_blacklist", true, true]; //headless client might fuck something up

_positions apply {hideObjectGlobal _x}; //placeholders are not needed anymore, all we care about is the unit

_unit
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_lockpick_setLock

Description:
    Passed object is locked, compatible with [KH]Liberation savegame functions

Parameters:
    _obj : Object

Returns:

Examples:
    (begin example)
        [this] call btc_fnc_side_lockpick_setLock;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_obj",objNull,[objNull]]
]) exitWith {["btc_fnc_side_lockpick_setLock: ERROR bad params %1", _this] call BIS_fnc_error};

private _side = (getNumber(configfile >> "CfgVehicles" >> typeOf _obj >> "side")) call BIS_fnc_sideType;
if !(_obj isKindOf "LandVehicle" or {_obj isKindOf "Ship" } or {_obj isKindOf "Air"}) exitWith {};
if (_side isEqualTo BTC_PLAYER_SIDE) exitWith {};

_obj lock 2;

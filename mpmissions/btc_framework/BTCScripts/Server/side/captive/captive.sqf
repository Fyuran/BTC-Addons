/* ----------------------------------------------------------------------------
Function: btc_fnc_side_captive

Description:
    Initializes a captive unit to be randomly positioned at passed _positions
	Arrow (Cyan): "Sign_Arrow_Cyan_F" were used as placeholders in making this function
Parameters:
	_positions: ARRAY of OBJECTS
	_captive: class STRING or OBJECT

Returns:

Examples:
    (begin example)
    	[[captive_spot_1,captive_spot_2], this] call btc_fnc_side_captive;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_positions",[],[[objNull]]],
	["_captive","O_officer_F",["",objNull]]
];
if (_positions isEqualTo []) exitWith {["btc_fnc_side_captive: bad params %1",_this] call BIS_fnc_error};

private _captive = [_positions,_captive] call btc_fnc_side_captive_unit_init;

if(isNull _captive) exitWith {["btc_fnc_side_captive: bad captive %1",_captive] call BIS_fnc_error};

private _captives = missionNamespace getVariable ["btc_side_captives",[]]; //global var holding captives for informer purpopes
_captives pushBack _captive;
missionNamespace setVariable ["btc_side_captives",_captives, true]; //update global var with new captive

_captive
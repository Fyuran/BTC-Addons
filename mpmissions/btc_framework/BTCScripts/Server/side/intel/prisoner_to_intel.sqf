/* ----------------------------------------------------------------------------
Function: btc_fnc_side_prisoner_to_intel

Description:
    Initializes actions for a prisoner2intel side mission, players will have to retrieve the position of intels through prisoners
Parameters:
	_prisoners: Array of OBJECTS
	_intels: Array of OBJECTS

Returns:

Examples:
    (begin example)
    	[[civ_1],[intel_1]] call btc_fnc_side_prisoner_to_intel;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_prisoners",[],[[objNull]]],
	["_intels",[],[[objNull]]]
];
if(count _intels != count _prisoners) exitWith {["btc_fnc_side_prisoner_to_intel: bad params, miscount %1", _this] call BIS_fnc_error};

private _isMultiplayer = [0,-2] select isDedicated;

//PREVENT FUCKUP
_prisoners apply {
	removeAllWeapons _x;
	_x allowFleeing 1;
	_x disableAI "ALL";
	_x allowDamage false;
	_x setVariable ["acex_headless_blacklist", true, true]; //headless client might fuck something up
};

//PRISONERS ACTIONS
{
	private _intel = _intels select _forEachIndex;
	_x setVariable["btc_side_intel_GetPos",mapGridPosition _intel,true]; //set data to be hinted
	[_x,_intel] remoteExecCall ["btc_fnc_side_intel_prisoner_actions",0,_x];
}forEach _prisoners;

//INTELS ACTIONS
{
	[_x] remoteExecCall ["btc_fnc_side_intel_actions",0,_x];
}forEach _intels;

if(BTC_DEBUG) then {
	_prisoners apply {
		private _marker = createMarker [format ["laptop_civ_loc_%1", _x], _x];
		_marker setMarkerType "mil_dot";
		_marker setMarkerText "intel civ";
		_x setVariable ["marker",_marker];
		_marker setMarkerColor "ColorBrown";
	};
	_intels apply {
		private _marker = createMarker [format ["laptop_loc_%1", _x], _x];
		_marker setMarkerType "mil_dot";
		_marker setMarkerText "intel";
		_x setVariable ["marker",_marker];
		_marker setMarkerColor "ColorOrange";
	};
};
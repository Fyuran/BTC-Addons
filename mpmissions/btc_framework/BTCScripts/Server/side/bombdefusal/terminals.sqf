/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal_terminals

Description:
	"Land_raw_digitsTerminal_01_F" default class
	Passed terminals are prepped to give player the corresponding(random) digit
Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal_terminals;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_terminals",[[objNull]]],
	["_bomb",objNull,[objNull]]
];

private _isMultiplayer = [0,-2] select isDedicated;
if((count _terminals) < 4) exitWith {["btc_fnc_side_bombdefusal_terminals: less than 4 terminals[%1]",count _terminals] call BIS_fnc_error};

//FUCKUP PREVENTION
_terminals apply {_x allowDamage false};

//REMOVE EXTRA TERMINALS
while {(count _terminals) > 4} do {
	private _v = (_terminals deleteAt round(random (count _terminals)));
	if(!isNull _v) then {deleteVehicle _v};
};

//DATA PARSING
private _data = (_bomb getVariable ["bombdefusal_data",[]]) select 0;
private _code = (_data select 0) select 0;
private _raw_digits = _code splitString "";
private _places = ["First","Second","Third","Fourth"];
if((count _raw_digits) != (count _places)) exitWith {["btc_fnc_side_bombdefusal_terminals: %1 is more digits than 4",_code]};

private _parsed_digits = [];
{
	_parsed_digits pushBack [_x,_raw_digits select _forEachIndex];
}forEach _places;

//GIVE ACTIONS TO CLIENTS
{
	[_x, _parsed_digits select _forEachIndex] remoteExecCall["btc_fnc_side_bombdefusal_terminals_actions",_isMultiplayer,_x];
}forEach _terminals;

if(BTC_DEBUG) then {
	["btc_fnc_side_bombdefusal_terminals",format["chosen terminals %1 with %2", _terminals, _parsed_digits]];
	_terminals apply {
		private _pos = getPosASL _x;
		private _marker = createMarker [format ["bombdefusal_terminal_loc_%1", _x], _x];
		_marker setMarkerType "mil_dot";
		_marker setMarkerText "nuke terminal";
	};
};
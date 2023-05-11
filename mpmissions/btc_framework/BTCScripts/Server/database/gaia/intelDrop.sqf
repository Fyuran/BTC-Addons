/* ----------------------------------------------------------------------------
Function: 

Description:
    Manages intel drop about one of the gaia database antennas by dropping it at the dead unit's feet.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_gaia_intelDrop;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_unit", objNull, [objNull]]
]) exitWith {};

private _pos = _unit getPos [0.5, random 360];
_pos set [2, 1];
private _intel = "Land_FilePhotos_F" createVehicle _pos;
if(BTC_DEBUG) then {
	_mkr = createMarker [format["%1_gaia_intel_mkr",_intel], _intel];
	_mkr setMarkerShape "ICON";
	_mkr setMarkerType "hd_dot";
	_mkr setMarkerText "Antenna Intel";
};

[_intel, "Take Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", 
"_this distance _target < 3", "_caller distance _target < 3", 
{}, {}, {
	params ["_target"];
	deleteVehicle _target;
	_antenna = btc_database_gaia_antennas select {!(_x getVariable ["btc_database_gaia_hasBeenFound", false])};
	if(_antenna isEqualTo []) exitWith {["IntelAdded",["All Enemy Communication Antennas have already been found","\a3\Ui_f\data\Map\Markers\Military\warning_ca.paa"]] call BIS_fnc_showNotification};
	_antenna = selectRandom _antenna;
	["IntelAdded",["Enemy Communication Antenna found","\a3\Ui_f\data\Map\Markers\Military\warning_ca.paa"]] call BIS_fnc_showNotification;
	_mkr = createMarker [format["%1_gaia_antenna",_antenna], _antenna];
	_mkr setMarkerShape "ICON";
	_mkr setMarkerColor "ColorOPFOR";
	_mkr setMarkerType "hd_dot";
	_mkr setMarkerText "Enemy Comms Antenna";
	_antenna setVariable ["btc_database_gaia_hasBeenFound", true, true];
	if(BTC_DEBUG) then {
		["btc_fnc_database_gaia_intelDrop", format["%1 at %2 discovered by %3", _antenna, getpos _antenna, player]] call btc_fnc_logDebug;
	};
}, {}, [], 1, 
0, true, false] remoteExecCall ["BIS_fnc_holdActionAdd", [0,-2] select isDedicated, _intel];
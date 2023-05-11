/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_FlyBy

Description:
	1)tipo veicoli
	2) Punti di partenza
	3) Punti di arrivo
Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_FlyBy;
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */
#include "script_component.hpp"
#define __HEIGHT__ 200
private _classes = missionNameSpace getVariable [QGVAR(FlyByClasses), []];
if(_classes isEqualTo []) exitWith {ERROR("btc_framework_fnc_FlyBy bad _classes")};

private _mapSize = getNumber(configfile >> "CfgWorlds" >> worldName >> "mapSize");
private _starts = [[_mapSize + 2000, 2000, __HEIGHT__], [0, _mapSize + 2000, __HEIGHT__], [4000, _mapSize + 2000, __HEIGHT__]];
private _ends =[[0, -2000, __HEIGHT__], [4000, -2000, __HEIGHT__]];
private _delay = 600;

#ifdef DEBUG_MODE_FULL
_delay = 60;
{
	_mkr = createMarker [format [QGVAR(startFlyBy_%1), _forEachIndex], _x];
	_mkr setMarkerShape "ICON";
	_mkr setMarkerType "mil_dot";
	_mkr setMarkerText format [QGVAR(startFlyBy_%1), _forEachIndex];
	_mkr setMarkerColor "ColorGreen"
} forEach _starts;

{
	_mkr = createMarker [format [QGVAR(endFlyBy_%1), _forEachIndex], _x];
	_mkr setMarkerShape "ICON";
	_mkr setMarkerType "mil_dot";
	_mkr setMarkerText format [QGVAR(endFlyBy_%1), _forEachIndex];
	_mkr setMarkerColor "ColorRed"
} forEach _ends;
#endif

// Air Traffic Cycle
btc_flyby_handle = [{
	(_this select 0) params["_starts", "_ends", "_classes"];
	_start = selectRandom _starts;
	_end = selectRandom _ends;
	_dir = _start getDir _end;

	_class = selectRandom _classes;
	_unit = createAgent [getText(configfile >> "CfgVehicles" >> _class >> "crew"), [0,0,0], [], 0, "CAN_COLLIDE"];
	_unit setCaptive true;
	_unit disableAI "FSM";
	_unit setBehaviour "CARELESS";
	#ifdef DEBUG_MODE_FULL
		_units = missionNamespace getVariable [QGVAR(FlyByes), []];
		_units pushBack _unit;
		_units = _units select {!isNull _x && {alive _x}};
		missionNamespace setVariable [QGVAR(FlyByes), _units, true];
	#endif

	_veh = createVehicle [_class , _start, [], 0, "FLY"];
	_unit assignAsDriver _veh; _unit moveInDriver _veh;
	_unit addEventHandler ["PathCalculated", {
		params ["_unit", "_path"];
		_veh = vehicle _unit;
		_veh deleteVehicleCrew _unit;
		deleteVehicle _veh;
	}];
	
	_veh addEventHandler ["Killed", {
		params ["_veh"];
		_crew = crew _veh;
		_crew apply {_veh deleteVehicleCrew _x};
		deleteVehicle _veh;
	}];
	_veh setDir _dir;
	_veh setVelocity [ //Prevents vehicles, especially jets from falling down on spawn
		sin _dir * 100, 
		cos _dir * 100, 
		0
	];
	_veh setDestination [_end, "LEADER PLANNED", true];
	_veh limitSpeed 100; _veh forceSpeed 100;
	_veh flyInHeightASL [__HEIGHT__, __HEIGHT__, __HEIGHT__];
}, _delay, [_starts, _ends, _classes]] call CBA_fnc_addPerFrameHandler;
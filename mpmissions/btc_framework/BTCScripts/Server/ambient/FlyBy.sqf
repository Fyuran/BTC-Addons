/* ----------------------------------------------------------------------------
Function: btc_fnc_ambient_FlyBy

Description:
	1)tipo veicoli
	2) Punti di partenza
	3) Punti di arrivo
Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */
private _classes = ["RHS_CH_47F_light","FIR_F16C","rhs_uh1h_idap","C_IDAP_Heli_Transport_02_F","FIR_F16C","C_Heli_Light_01_civil_F","FIR_F16C","C_Plane_Civil_01_F","FIR_F16C","RHS_A10","RHS_C130J","sab_an12_c","FIR_F16C","sab_an22_c"];
private _mapSize = getNumber(configfile >> "CfgWorlds" >> worldName >> "mapSize");
private _starts = [[_mapSize, +2000, 200], [0, _mapSize+2000, 200], [4000, _mapSize+2000, 200]];
private _ends =[[0 ,0, 200], [4000, 0, 200]];
private _delay = 600;

if (BTC_DEBUG) then {
	_delay = 60;
	{
		_mkr = createMarker [format ["startFlyBy_%1", _forEachIndex], _x];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "mil_dot";
		_mkr setMarkerText format ["startFlyBy_%1", _forEachIndex];
		_mkr setMarkerColor "ColorGreen"
	} forEach _starts;

	{
		_mkr = createMarker [format ["endFlyBy_%1", _forEachIndex], _x];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "mil_dot";
		_mkr setMarkerText format ["endFlyBy_%1", _forEachIndex];
		_mkr setMarkerColor "ColorRed"
	} forEach _ends;
};

// Air Traffic Cycle
btc_flyby_handle = [{
	(_this select 0) params["_starts", "_ends", "_classes"];
	_start = selectRandom _starts;
	_end = selectRandom _ends;
	_dir = _start getDir _end;
	_class = selectRandom _classes;
	_driver = createAgent [getText(configfile >> "CfgVehicles" >> _class >> "crew"), [0,0,0], [], 0, "CAN_COLLIDE"];
	_driver setCaptive true;
	_driver setVariable ["acex_headless_blacklist", true, true];
	_veh = createVehicle [_class , _start, [], 0, "FLY"];
	_driver assignAsDriver _veh; _driver moveInDriver _veh;
	_driver addEventHandler ["PathCalculated", {
		params ["_driver", "_path"];
		if(BTC_DEBUG) then {["FlyBy",format["agent(POS:%1) finished path", _path]] call btc_fnc_logDebug};
		_veh = vehicle _driver;
		_veh deleteVehicleCrew _driver;
		deleteVehicle _veh;
	}];
	_veh addEventHandler ["Killed", {
		params ["_veh"];
		if(BTC_DEBUG) then {["FlyBy", format["agent_veh(POS:%1) has been killed", getPos _veh]] call btc_fnc_logDebug};
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
	_veh flyInHeightASL [200, 200, 200];
	if(BTC_DEBUG) then {["FlyBy", format["agent(%1) starting path from %2 to %3", _class, _start, _end]] call btc_fnc_logDebug};

}, _delay, [_starts, _ends, _classes]] call CBA_fnc_addPerFrameHandler;
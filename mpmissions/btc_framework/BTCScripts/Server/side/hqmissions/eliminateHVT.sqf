/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hqmissions_eliminateHVT

Description:
    Starts a eliminate HVT mission near _pos
Parameters:

Returns:

Examples:
    (begin example)
    	[getPosASL player] call btc_fnc_side_hqmissions_eliminateHVT;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __MAX_DIS 50
#define __ELEM_HVT 0
if(!params[
	["_pos", [0,0,0], [[]]]	
]) exitWith {["btc_fnc_side_hqmissions_eliminateHVT", format["bad params %1", _this]] call btc_fnc_logDebug};
#include "comp_HVT.sqf"

if(BTC_DEBUG) then {
	["btc_fnc_side_hqmissions_eliminateHVT", format["started at %1", _pos]] call btc_fnc_logDebug;
};

//get valid building position
_buildings = _pos nearObjects ["House_F", __MAX_DIS];
_buildings = _buildings select {!(_x call BIS_fnc_buildingPositions isEqualTo [])};
_buildingPos = selectRandom(selectRandom _buildings call BIS_fnc_buildingPositions);
if(_buildings isEqualTo []) then {
	_buildings = [_pos, 0, _comp_HVT] call BIS_fnc_ObjectsMapper; //_comp_HVT is in comp_HVT.sqf
	_buildings apply {
		_posATL = getPosATL _x; _posATL set [2,0];
		_x setPosATL _posATL;
		_x setVectorUp surfaceNormal getPosASL _x;
	};
	_MainBuilding = _buildings select 0;
	_MainBuilding setVectorUp [0,0,1];
	_buildingPos = _MainBuilding buildingPos selectRandom [12,13,14,15,16,17,27,28]; //"Land_Radar_01_HQ_F" exclusive
	_pos = getPosASL _MainBuilding; //so that objective marker is on top of the main building
	nearestTerrainObjects [_buildingPos, [], 90, false, true] apply {hideObjectGlobal _x};
};

_hvt = createGroup east createUnit ["O_officer_F", _buildingPos, [], 0, "CAN_COLLIDE"];
_hvt setUnitLoadout [[],[],["hgun_Pistol_heavy_02_F","","","",["6Rnd_45ACP_Cylinder",6],[],""],["U_O_OfficerUniform_ocamo",[["FirstAidKit",1],["Chemlight_red",1,1],["6Rnd_45ACP_Cylinder",3,6]]],["V_BandollierB_khk",[["SmokeShell",1,1],["SmokeShellRed",1,1],["Chemlight_red",1,1]]],[],"LOP_H_Turban","G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]];
_hvt forceSpeed 0;
_hvt setUnitPos "UP";
_hvt setVariable ["acex_headless_blacklist", true, true];

//HVT EH
_hvt addEventHandler ["Killed", {
	params ["_unit", "_killer"];
	deleteMarker (_unit getVariable ["marker", ""]);
	["btc_fnc_side_hqmissions_eliminateHVT", format["HVT(%1) killed by %2",getPos _unit, _killer]] call btc_fnc_logDebug;
	_unit removeEventHandler ["Killed", _thisEventHandler];
}];

_hqmissions = missionNamespace getVariable ["btc_side_hqmissions", []];
_hqmissions pushBack [_hvt, __ELEM_HVT];
missionNamespace setVariable ["btc_side_hqmissions", _hqmissions, true];

//MAP MARKER AND EOS MARKER
_mkr = createMarker [format ["hqmission_loc_%1", count _hqmissions - 1], _pos];
_mkr setMarkerType "mil_objective";
_mkr setMarkerColor "colorOPFOR";
_mkr setMarkerText "HVT";
_hvt setVariable ["marker", _mkr, [0,2] select isDedicated];

_eosMkr = createMarker [format ["hqmission_locn_%1", count _hqmissions - 1], _buildingPos];
_eosMkr setMarkerShape "ELLIPSE";
_eosMkr setMarkerSize [__MAX_DIS, __MAX_DIS];
[[_eosMkr],[6,1],[2,1],[1,1,50],[0,0],[4,50],[0,0],[BTC_ENEMY_FACTION,[1,0] select BTC_DEBUG,1000,BTC_ENEMY_SIDE,false,false]] call EOS_Spawn;

//ADD TWO BLACK SUVS NEARBY
_safePos = [_buildingPos, 0, 10, 1, 0, 0, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
if !(_safePos isEqualTo [0,0,0]) then {	
	_v = "C_SUV_01_F" createVehicle _safePos;
	_posATL = getPosATL _v; _posATL set [2,0];
	_v setPosATL _posATL;
	_v setVectorUp surfaceNormal _safePos;
	_v setDir random 360;
	_v allowDamage false; //due to change in locality once a player gets in, allowdamage will automatically go back to true
	[_v, "Black"] call BIS_fnc_initVehicle;
	_safePos2 = [_safePos, 0, 10, 1, 0, 0, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
	if !(_safePos2 isEqualTo [0,0,0]) then {
		_v = "C_SUV_01_F" createVehicle _safePos2;
		_posATL = getPosATL _v; _posATL set [2,0];
		_v setPosATL _posATL;
		_v setVectorUp surfaceNormal _safePos2;
		_v setDir random 360;
		_v allowDamage false;
		[_v, "Black"] call BIS_fnc_initVehicle;
	};
};
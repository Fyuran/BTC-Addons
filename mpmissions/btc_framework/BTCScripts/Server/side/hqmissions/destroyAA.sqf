/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hqmissions_destroyAA

Description:
    Starts a eliminate HVT mission near _pos
Parameters:

Returns:

Examples:
    (begin example)
    	[getPosASL player] call btc_fnc_side_hqmissions_destroyAA;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __MAX_DIS 150
#define __DESTROY_AA 2
if(!params[
	["_pos", [0,0,0], [[]]]	
]) exitWith {["btc_fnc_side_hqmissions_destroyAA", format["bad params %1", _this]] call btc_fnc_logDebug};

_safePos = [_pos, 0, __MAX_DIS, 5, 0, 0, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
if(_safePos isEqualTo [0,0,0]) then {_safePos = _pos};

_hqmissions = missionNamespace getVariable ["btc_side_hqmissions", []];
_hqmissions pushBack [_AA, "eliminateHVT"];
missionNamespace setVariable ["btc_side_hqmissions", _hqmissions, true];

_eosMkr = createMarker [format ["hqmission_locn_%1", count _hqmissions - 1], _safePos];
_eosMkr setMarkerShape "ELLIPSE";
_eosMkr setMarkerSize [__MAX_DIS, __MAX_DIS];
[[_eosMkr],[2,1],[4,3],[1,1,50],[0,0],[4,50],[0,0],[BTC_ENEMY_FACTION,[1,0] select BTC_DEBUG,1000,BTC_ENEMY_SIDE,false,false]] call EOS_Spawn;
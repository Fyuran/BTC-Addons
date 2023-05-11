/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hqmissions_startMission

Description:
    Starts input control of selected mission in left listbox
Parameters:

Returns:

Examples:
    (begin example)
    	[] call btc_fnc_side_hqmissions_startMission;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __NOTONWATER true

params["_ctrl"];
if !(_ctrl isEqualType controlNull) exitWith {["btc_fnc_side_hqmissions_startMission", format["bad params %1", _this]] call btc_fnc_logDebug};
if !("ItemMap" in assignedItems player) exitWith {hint "You don't have a map"};
private _display = ctrlParent _ctrl;
private _RscLeftListBox = _display displayCtrl 1500;
private _curSel = lbCurSel _RscLeftListBox;
if(_curSel == -1) exitWith {};
private _isOnGround = call {
	if(_curSel == 0) exitWith {true};
	if(_curSel == 1) exitWith {true};
	if(_curSel == 2) exitWith {true};
	true
};
private _terminal = nearestObject [getPosASL player, "Land_DataTerminal_01_F"];
if(BTC_DEBUG) then {BTC_DEBUG_TELEPORT = false};
player setVariable ["hqmissions_onMapClick_data", [_curSel, _isOnGround, _terminal]];

//MapSingleClick
closeDialog 0;
openMap true;
BTC_HQMISSIONS_MapSingleClick = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos"];
	_args = player getVariable ["hqmissions_onMapClick_data", []];
	_args params[
		["_missionType", 0, [0]],
		["_isOnGround", true, [false]],
		["_terminal", objNull, [objNull]]	
	];
	_canStart = call {
		if(_pos distance player <= 1001) exitWith {hint "Mission position too close to player(1000m)"; false};
		if(_isOnGround && {surfaceIsWater _pos}) exitWith {hint "Mission position is on water, must be on ground"; false};
		if(!_isOnGround && {!(surfaceIsWater _pos)}) exitWith {hint "Mission position is on ground, must be on water"; false};
		if(_missionType == 2) exitWith {
			#define __MAX_DIS 100
			_roads = _pos nearRoads __MAX_DIS;
			if(_roads isEqualTo []) exitWith {hint "Mission position has no roads available"; false};
			true
		};
		true
	};
	if(!_canStart) exitWith {};
	call {
		if (_missionType == 0) exitWith{[_pos] remoteExecCall ["btc_fnc_side_hqmissions_eliminateHVT", 2]};
		if (_missionType == 1) exitWith{[_pos] remoteExecCall ["btc_fnc_side_hqmissions_rescueJournalist", 2]};
		if (_missionType == 2) exitWith{[_pos] remoteExecCall ["btc_fnc_side_hqmissions_defuseIED", 2]};
		[_pos] remoteExecCall ["btc_fnc_side_hqmissions_eliminateHVT", 2]
	};

	[_terminal, 0] call BIS_fnc_dataTerminalAnimate;
	removeMissionEventHandler ["MapSingleClick", _thisEventHandler];
	if(BTC_DEBUG) then {BTC_DEBUG_TELEPORT = true};
}];

//remove EH only when map has been closed
[{!visibleMap},{
	removeMissionEventHandler ["MapSingleClick", missionNamespace getVariable ["BTC_HQMISSIONS_MapSingleClick", -1]];
	if(BTC_DEBUG) then {BTC_DEBUG_TELEPORT = true};
}] call CBA_fnc_waitUntilAndExecute;

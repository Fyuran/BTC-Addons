/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hqmissions_defuseIED

Description:
    Starts a eliminate HVT mission near _pos
Parameters:

Returns:

Examples:
    (begin example)
    	[getPosASL player] call btc_fnc_side_hqmissions_defuseIED;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __MAX_DIS 50
#define __MAX_IEDS 4
#define __DEFUSE_IED 2
if(!params[
	["_pos", [0,0,0], [[]]]	
]) exitWith {["btc_fnc_side_hqmissions_defuseIED", format["bad params %1", _this]] call btc_fnc_logDebug};

_roads = _pos nearRoads __MAX_DIS;
if(count _roads < __MAX_IEDS) exitWith {hint format ["Not enough roads segments found: %1; minimum 4 are required", count _roads]};
_roadsUnique = [];
while {count _roadsUnique < __MAX_IEDS} do {
	_roadsUnique pushBackUnique selectRandom _roads;
};
_IEDs = _roadsUnique apply {
	_bounding = boundingBoxReal _x; //random pos on the surface of the road
	_bounding params ["_boundingMin", "_boundingMax"];
	_boundingX = random[(_boundingMin select 0)/1.3, 0, (_boundingMax select 0)/1.3];
	_boundingY = random[(_boundingMin select 1)/1.3, 0, (_boundingMax select 1)/1.3];
	private _pos = _x modelToWorld [_boundingX, _boundingY, 0];
	_pos set [2, 0]; //modelToWorld still adjustes height despite being 0
	_ied = selectRandom["ACE_IEDLandSmall_Command_Ammo", "ACE_IEDUrbanSmall_Command_Ammo"] createVehicle _pos;
	_ied setDir random 360;
	if(BTC_DEBUG) then {
		["btc_fnc_side_hqmissions_defuseIED", format["adding IED at pos %1", _pos]] call btc_fnc_logDebug;
		_mkr = createMarker [format ["hqmission_locIED_%1", _ied], _pos];
		_mkr setMarkerType "mil_dot";
		_mkr setMarkerText "IED";
	}; 
	_trg = createTrigger["EmptyDetector", _ied, false];
	_trg setTriggerArea[1, 1, 0, false, 2];
	_trg setTriggerActivation["ANYPLAYER", "PRESENT", false];
	_trg setVariable ["defuseIED_IED", _ied];
	_trg setTriggerStatements ["this", "
		_ied = thisTrigger getVariable ['defuseIED_IED', objNull];
		if(alive _ied) then {
			_ied setDamage 1;
			if(BTC_DEBUG) then {['btc_fnc_side_hqmissions_defuseIED', format['%1(%2) blowing up', _ied, position _ied]] call btc_fnc_logDebug};
		} else {
			deleteVehicle thisTrigger;
			if(BTC_DEBUG) then {['btc_fnc_side_hqmissions_defuseIED', format['Trigger IED has been defused, removing trigger', _ied, position _ied]] call btc_fnc_logDebug};
		};
	", ""];
	_ied setVariable ["defuseIED_trigger", _trg];
	_ied
};

if(BTC_DEBUG) then {
		[{{alive _x} count _this == 0}, {
		["btc_fnc_side_hqmissions_defuseIED", "All IEDs blew up or are defused"] call btc_fnc_logDebug;
	}, _IEDs] call CBA_fnc_waitUntilAndExecute;
};

_hqmissions = missionNamespace getVariable ["btc_side_hqmissions", []];
_hqmissions pushBack [_IEDs, __DEFUSE_IED];
missionNamespace setVariable ["btc_side_hqmissions", _hqmissions, true];

//MAP MARKER
_mkr = createMarker [format ["hqmission_loc_%1", count _hqmissions - 1], _pos];
_mkr setMarkerType "mil_warning";
_mkr setMarkerColor "colorOPFOR";
_mkr setMarkerText "IEDs";
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_scud

Description:
    Initializes scud at random pos with an activation trigger of x radius that will launch its ordnance after set seconds.
    [tochka,1] spawn rhs_fnc_ss21_AI_prepare;
	[tochka,getPos _target] spawn RHS_fnc_ss21_AI_launch;
Parameters:
	_pos: Array of OBJECTS
	_intels: Array of OBJECTS, will allow scuds to be found through intel side missions
	_scudNumber: NUMBER how many scuds will be ingame DEFAULT: 1
	_impact_zone: STRING holding marker's name for missile impact zone
Returns:

Examples:
    (begin example)
    	[[spot_1,spot_2]] call btc_fnc_side_scud;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define RADIUS 200
params[
	["_pos",[[0,0,0]],[[objNull]]],
	["_intels",[],[[objNull]]],
	["_scudNumber",1,[0]],
	["_impact_zone","nuke_impact",[""]]
];
if(_scudNumber <= 0 or {count _pos < _scudNumber}) exitWith {["btc_fnc_side_scud: bad params %1", _this] call BIS_fnc_error};
if(markerPos _impact_zone isEqualTo [0,0,0]) exitWith {["btc_fnc_side_scud: bad impact zone marker %1", _impact_zone] call BIS_fnc_error};
_impact_zone setMarkerAlpha 0; //hide marker

//SELECT UNIQUE RANDOM POS
private _scudPos = []; private _scuds = [];
while {count _scudPos < _scudNumber} do {
	_scudPos pushBackUnique selectRandom _pos;
};

_pos apply {hideObjectGlobal _x};

//CREATE TOCHKA
private _group = createGroup [east,true];
_scudPos apply {
	_veh = [getPos _x,0,"rhs_9k79_B",_group] call BIS_fnc_spawnVehicle;
	(_veh select 1) apply {_x disableAI "MOVE"};
	_v = (_veh select 0);
	_scuds pushBack _v;
	//rhs_fnc_ss21_AI_prepare
	private _trigger = createTrigger["EmptyDetector",_v];
	_v setVariable ["trigger",_trigger];
	_trigger setTriggerArea[RADIUS,RADIUS,0,false];
	_trigger setTriggerActivation["ANYPLAYER","PRESENT",false];
	_trigger setVariable ["scud_trigger_data",_v];
	_trigger setTriggerStatements ["this",
	"
		_scud = thisTrigger getVariable ['scud_trigger_data',objNull];
		[_scud,1] spawn rhs_fnc_ss21_AI_prepare;
		[{[_this,getMarkerPos 'nuke_impact'] spawn RHS_fnc_ss21_AI_launch}, _scud, 300] call CBA_fnc_waitAndExecute;
		deleteVehicle thisTrigger;
	", ""];
};

if !(_intels isEqualTo []) then { //edit intel data on randomly selected intels in order to give scuds positions instead
	private _intel_scudPos = [intel_9];
	private _intel = objNull;
	while {count _intel_scudPos < _scudNumber} do {
		_intel = selectRandom _intels;
		_intel_scudPos pushBackUnique _intel;
	};

	{
		_x setVariable ["btc_side_intel_type","SCUD",true];
		_x setVariable ["btc_side_intel_GetPos",mapGridPosition (_scuds select _forEachindex),true];
		if(BTC_DEBUG) then {
			_marker = _x getVariable ["marker",_marker];
			_marker setMarkerText "scud intel";
			_marker setMarkerColor "ColorBlue";
		};
	}forEach _intel_scudPos;

};

if(BTC_DEBUG) then {
	_scuds apply {
		private _marker = createMarker [format ["scud_%1_pos", _x], _x];
		_marker setMarkerType "mil_dot";
		_marker setMarkerText "scud";
		_marker setMarkerColor "ColorBlue";
		_x setVariable ["marker",_marker];
	};
};
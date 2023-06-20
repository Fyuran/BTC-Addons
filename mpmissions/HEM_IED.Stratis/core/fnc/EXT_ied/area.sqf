 
/* ----------------------------------------------------------------------------
Function: btc_EXT_ied_fnc_Area

Description:
    Parses area for ied positions.

Parameters:
    _center - Position of wreck. [Array, objNull]
    _spawningRadius - Shape name of the wreck. [Number]
    _max - Direction of the wreck. [Number]


Returns:

Examples:
    (begin example)
    (end)

Author:
    Giallustio edited by Fyuran

---------------------------------------------------------------------------- */ 

params[
	["_center", [], [[]]],
	["_spawningRadius", 300, [-1]],
	["_maxActive", 1, [-1]],
	["_maxFake", 0, [-1]]
];
if(_center isEqualTo []) exitWith {
	if (btc_debug_log) then {
		[format ["Bad params: %1", _this], __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
	};
};

private _ied_array = [];

for "_i" from 1 to _maxActive do { //Active IEDs
	private _sel_pos = [_center, _spawningRadius] call btc_fnc_randomize_pos;
	private _dir = random 360;

	private _roads = _sel_pos nearRoads 50;
	if (_roads isEqualTo []) then {
		_sel_pos = [_sel_pos, 0, 100, 1, false] call btc_fnc_findsafepos;
	} else {
		private _arr = (selectRandom _roads) call btc_EXT_ied_fnc_randomRoadPos;
		_sel_pos = _arr select 0;
		_dir = _arr select 1;
	};

	_ied_array pushBack [_sel_pos, true, _dir, selectRandom btc_model_ieds];

	if (btc_debug) then {
		private _marker = createMarker [format ["btc_ied_%1", _sel_pos], _sel_pos];
		_marker setMarkerType "mil_warning";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "IED";
		_marker setMarkerSize [0.8, 0.8];
	};
	if (btc_debug_log) then {
		[format ["_this = %1  POS %2 N %3(%4)", _this, _sel_pos, _i, _n], __FILE__, [false]] call btc_debug_fnc_message;
	};
};

for "_i" from 1 to _maxFake do { //Fake IEDs
	private _sel_pos = [_center, _spawningRadius] call btc_fnc_randomize_pos;
	private _dir = random 360;

	private _roads = _sel_pos nearRoads 50;
	if (_roads isEqualTo []) then {
		_sel_pos = [_sel_pos, 0, 100, 1, false] call btc_fnc_findsafepos;
	} else {
		private _arr = (selectRandom _roads) call btc_EXT_ied_fnc_randomRoadPos;
		_sel_pos = _arr select 0;
		_dir = _arr select 1;
	};

	_ied_array pushBack [_sel_pos, false, _dir, selectRandom btc_model_ieds];

	if (btc_debug) then {
		private _marker = createMarker [format ["btc_ied_%1", _sel_pos], _sel_pos];
		_marker setMarkerType "mil_warning";
		_marker setMarkerColor "ColorBlue";
		_marker setMarkerText "IED (fake)";
		_marker setMarkerSize [0.8, 0.8];
	};
	if (btc_debug_log) then {
		[format ["_this = %1  POS %2 N %3(%4)", _this, _sel_pos, _i, _n], __FILE__, [false]] call btc_debug_fnc_message;
	};
};

private _ieds = _ied_array apply {_x call btc_EXT_ied_fnc_create};

if (btc_debug || btc_debug_log) then {
    [format ["%1# Active %2# Fake IEDs created at %3", _maxActive, _maxFake, _center] , __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
};
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_c4booby_setObj

Description:
    Passed object is prepared for a bomb defusal situation

Parameters:
    _obj : Object

Returns:

Examples:
    (begin example)
        [this] call btc_fnc_side_c4booby_setObj;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define RADIUS 30

params[
	["_obj",objNull,[objNull]],
	["_end_time",90,[0]],
	["_max_colors",1,[0]]
];
if(isNull _obj) exitWith {["btc_fnc_side_c4booby_setObj: bad _obj(%1)",_this] call BIS_fnc_error};

#define __NORTH 0
#define __SOUTH 1
#define __EAST 2
#define __WEST 3

private _defuser_VectorDirAndUp = [
	[[0, 1, 0],[0, 0, 1]], //N
	[[0, -1, 0],[0, 0, 1]], //S
	[[1, 0, 0],[0, 0, 1]], //E
	[[-1, 0, 0],[0, 0, 1]] //W
];

//decorations setup
private _deco_pos = call {
	if (_obj isKindOf "CargoNet_01_barrels_F") exitWith { //FUEL
		[ [[0.40,0.40,0.50],[-0.40,0.40,0.50],[-0.40,-0.40,0.50],[0.40,-0.40,0.50]], //explosives positions
			(selectRandom[ [[0,0.65,0.2], __NORTH], [[0,-0.65,0.2], __SOUTH], //defuser random positions
				[[0.65,0,0.2], __EAST], [[-0.65,0,0.2], __WEST] ]),
					[0,0,0.5]] //light
	};

	if (_obj isKindOf "CargoNet_01_box_F") exitWith { //SUPPLIES
		[ [[0.40,0.40,0.58],[-0.40,0.40,0.58],[-0.40,-0.40,0.58],[0.40,-0.40,0.58]], //explosives positions
			(selectRandom[ [[0,0.75,0.2], __NORTH], [[0,-0.75,0.2], __SOUTH], //defuser random positions
				[[0.75,0,0.2], __EAST], [[-0.75,0,0.2], __WEST] ]),
					[0,0,0.6]] //light
	};

	if (_obj isKindOf "B_CargoNet_01_ammo_F") exitWith { //AMMO
		[ [[0.3,0.3,0.8],[-0.30,0.30,0.8],[-0.30,-0.30,0.8],[0.30,-0.30,0.8]], //explosives positions
			(selectRandom[ [[0,0.5,0.6], __NORTH],[[0,-0.5,0.6], __SOUTH], //defuser random positions
				[[0.6,0,0.6], __EAST], [[-0.6,0,0.6], __WEST] ]),
					[0,0,0.9]] //light
	};

	if (_obj isKindOf "Land_MetalBarrel_F") exitWith { //BARREL
		[ [[0.15,0,0.41],[-0.15,0,0.41]], //explosives positions
			(selectRandom[ [[0,0.3,0.2], __NORTH], [[0,-0.3,0.2], __SOUTH], //defuser random positions
				[[0.3,0,0.2], __EAST], [[-0.3,0,0.2], __WEST] ]),
					[0,0,0.52]] //light
	};
	[]
};
if (_deco_pos isEqualTo []) exitWith {["btc_fnc_side_c4booby_setObj: bad _deco_pos: %1",_deco_pos] call BIS_fnc_error};

private _exp_pos = _deco_pos select 0;
for "_i" from 0 to (count _exp_pos - 1) do {
	_exp = createSimpleObject ["DemoCharge_F",[0,0,0]];
	_attachPoint = _exp_pos select _i;
	_exp attachTo [_obj,_attachPoint];
	_exp setVectorDirAndUp [[random[-1,0,1], random[-1,0,1], 0],[0, 0, 1]];
};

private _light_pos = _deco_pos select 2;
private _light = createVehicle ["PortableHelipadLight_01_red_F",[0,0,0],[],0,"NONE"];
_light attachTo [_obj,_light_pos];

//Colors setup
private _wire_colors = [];
for "_i" from 1 to _max_colors do {
	private _x = selectRandom ["red","blue","green"];
	_wire_colors pushBack _x;
};

//defuser setup and actions
private _defuser = createVehicle ["Land_FMRadio_F",[0,0,0],[],0,"CAN_COLLIDE"];
_defuser attachTo [_obj,(_deco_pos select 1) select 0];
private _VecDU_index = ((_deco_pos select 1) select 1);
_defuser setVectorDirAndUp (_defuser_VectorDirAndUp select _VecDU_index);
_defuser setVariable ["wire_colors",_wire_colors,true];
_defuser allowDamage false;
[_defuser,_obj] remoteExecCall["btc_fnc_side_c4booby_actions",0,_obj];

//trigger for TIMER and setVariable
private _trigger = createTrigger["EmptyDetector",_obj];
_obj setVariable ["trigger",_trigger];
_trigger attachTo [_obj,[0,0,0]];
_trigger setTriggerArea[RADIUS,RADIUS,0,false];
_trigger setTriggerActivation["ANYPLAYER","PRESENT",false];
_trigger setVariable ["c4booby_trigger_data",[_obj,_max_colors,_end_time]];
_trigger setTriggerStatements ["this", "
	_obj = (thisTrigger getVariable ['c4booby_trigger_data',objNull]) select 0;
	_max_colors = (thisTrigger getVariable ['c4booby_trigger_data',objNull]) select 1;
	_end_time = (thisTrigger getVariable ['c4booby_trigger_data',objNull]) select 2;
	[_obj,_end_time,_max_colors] call btc_fnc_side_c4booby_timer;
	deleteVehicle thisTrigger;
", ""];

//Debugging
if(BTC_DEBUG) then {
	private _marker = createMarker [format ["c4booby_loc_%1", _obj], _obj];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "SolidBorder";
	_marker setMarkerSize [RADIUS,RADIUS];
	_marker setMarkerAlpha 0.5;
	_marker setMarkerColor "colorOrange";
	private _marke = createMarker [format ["c4booby_locn_%1", _obj], _obj];
	_marke setMarkerType "mil_dot";
	_marke setMarkerText "bomb";
	_obj setVariable ["markers",[_marker,_marke]];
	["btc_fnc_side_c4booby_setObj",format["at %1", getPosASL _obj]] call btc_fnc_logDebug;
};

_obj setVariable ["isBoobyTrapped",true,true];
//frame check for SUCCESS or FAIL state
[{
	count ((_this select 1) getVariable ["input_wire_colors",[]]) >= (_this select 2)
},
{
	params["_defuser","_obj","_max_colors","_wire_colors","_light_pos"];
	private _obj_colors = _obj getVariable ["input_wire_colors",[]];
	private _handle = _obj getVariable ["c4booby_timer_handle",0];
	[_handle] call CBA_fnc_removePerFrameHandler;
	[_defuser] remoteExecCall ["btc_fnc_side_c4booby_removeActions",0,_obj];
	(attachedObjects _obj) apply {deleteVehicle _x};
	if(BTC_DEBUG) then {
		["btc_fnc_side_c4booby",format["bomb managed at %1", getPosASL _obj]] call btc_fnc_logDebug;
		(_obj getVariable "markers") apply {deleteMarker _x};
	};
	//Defused
	if (_obj_colors isEqualTo _wire_colors) then {
		playSound3D [GetMissionPath "BTCScripts\Server\side\c4booby\sounds\defused.ogg", objNull, false, getPosASL _obj, 5, 1, 50];
		private _light = createVehicle ["PortableHelipadLight_01_green_F",[0,0,0],[],0,"CAN_COLLIDE"];
		_light attachTo[_obj,_light_pos];
		[{deleteVehicle _this}, _light, 60] call CBA_fnc_waitAndExecute;
		_obj setVariable ["isBoobyTrapped",false,true];
	}
	else { //Explode
		private _r = "Bo_GBU12_LGB" createVehicle getpos _obj;
		_r setVectorDirAndUp[[0,0,-1],[1,0,0]]; //steer it towards the ground or odd things will happen
		deleteVehicle _obj;
		hideobjectGlobal _r;
	};

}, [_defuser,_obj,_max_colors,_wire_colors,_light_pos]] call CBA_fnc_waitUntilAndExecute;

_obj
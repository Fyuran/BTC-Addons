/* ----------------------------------------------------------------------------
Function: btc_fnc_side_bombdefusal

Description:
	"Land_Device_disassembled_F" default class
	Prepares a device for 4-digit code based defusal, digits are found by hacking the (minimum 4) terminals
Parameters:
    _data - [Number from 0 to 9,Color String either red,blue or green]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_bombdefusal;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define SUCCESS 1
#define WAITING 0
#define FAIL -1

params[
	["_bomb",objNull,[objNull]],
	["_terminals",[],[[]]],
	["_attempts",ceil(random 3),[3]],
	["_timer",round(random [60, 85, 120]),[0]],
	["_data",[]]
];

if(isNull _bomb) exitWith {["btc_fnc_side_bombdefusal: bad bomb %1", _bomb] call BIS_fnc_error};
if(_terminals isEqualTo []) exitWith {["btc_fnc_side_bombdefusal: bad terminals %1", _terminals] call BIS_fnc_error};
private _digits = 4; //_digits as of 18/02/2019 is currently unused

private _isMultiplayer = [0,-2] select isDedicated;
_bomb allowDamage false;

//BOMB DEFUSAL DATA PROCESSING
if(_data isEqualTo []) then {
	for "_i" from 1 to _attempts do {
		private _code = "";
		//private _color = [];
		for "_i" from 1 to _digits do {
			_code = _code + str(round(random 9));
			//_color pushBack (selectRandom [[1,0,0,1],[0,1,0,1],[0,0,1,1]]);
		};
		_data pushBack [_code];
	};
}else{

};
_bomb setVariable ["bombdefusal_data", [_data,[_attempts,_digits,_timer]],true];

//BOMB DEFUSAL ACTIONS
[_bomb,{
	/*private _action = ["bombdefusal_decode", "Get Defuse Codes", "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa", {
		createDialog "bombdefusal_gui";
		player setVariable ["bombdefusal_bomb", _target];
		[_target] remoteExecCall ["btc_fnc_side_bombdefusal_timer",2];
		[] call btc_fnc_side_bombdefusal_gui_timer;
	}, {"ToolKit" in ((vestItems player) + (uniformItems player) + (backpackItems player))}] call ace_interact_menu_fnc_createAction;
	[_this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;*/

	_action = ["bombdefusal_defuse", "Defuse Device", "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_hack_ca.paa", {
		createDialog "bombdefusal_gui";
		player setVariable ["bombdefusal_bomb", _target];
		[_target] remoteExecCall ["btc_fnc_side_bombdefusal_timer",2];
		[] call btc_fnc_side_bombdefusal_gui_timer;
	}, {true}] call ace_interact_menu_fnc_createAction;
	[_this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["call", _isMultiplayer, _bomb];

//FRAME CHECK FOR SUCCESS OR FAIL
[
	{
		(_this select 0) getVariable ["bombdefusal_manage",WAITING] != 0
	},
	{
		params["_bomb","_terminals"];
		private _isMultiplayer = [0,-2] select isDedicated;
		private _manage_code = _bomb getVariable ["bombdefusal_manage",WAITING];
		private _timer_handle = _bomb getVariable ["bombdefusal_timer_handle",0];
		[_timer_handle] call CBA_fnc_removePerFrameHandler;

		if (_manage_code == FAIL) exitWith {
		    [_bomb,0,["ACE_MainActions","bombdefusal_defuse"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",_isMultiplayer,_bomb];
			[_bomb,0,["ACE_MainActions","bombdefusal_decode"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",_isMultiplayer,_bomb];
			[1] remoteExecCall ["closeDialog",_isMultiplayer];
		    [getPos _bomb,300,5,true] call btc_fnc_side_bombdefusal_nuke_fail;
		    ([_bomb] + _terminals) apply {deleteVehicle _x};
		};
		if (_manage_code == SUCCESS) exitWith {
		    [_bomb,0,["ACE_MainActions","bombdefusal_defuse"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",_isMultiplayer,_bomb];
			[_bomb,0,["ACE_MainActions","bombdefusal_decode"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",_isMultiplayer,_bomb];
			[1] remoteExecCall ["closeDialog",_isMultiplayer];
		    playSound3D [GetMissionPath "BTCScripts\Server\side\barreldefusal\sounds\defused.ogg", objNull, false, getPosASL _bomb, 5, 1, 50];
		    [{([(_this select 0)]+(_this select 1)) apply {deleteVehicle _x}}, [_bomb,_terminals], 300] call CBA_fnc_waitAndExecute;
		};
	},
[_bomb,_terminals]]call CBA_fnc_waitUntilAndExecute;

//TERMINALS
[_terminals,_bomb] call btc_fnc_side_bombdefusal_terminals;

if(BTC_DEBUG) then {
	private _pos = getPosASL _bomb;
	private _marke = createMarker [format ["bombdefusal_loc_%1", _bomb], _bomb];
	_marke setMarkerType "mil_dot";
	_marke setMarkerText "nuke";
};
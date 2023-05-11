/* ----------------------------------------------------------------------------
Function: btc_fnc_side_captive_informer

Description:
    Initializes a informer unit to be randomly positioned at passed _positions
	Arrow (Cyan): "Sign_Arrow_Cyan_F" were used as placeholders in making this function
Parameters:
	_positions: ARRAY of OBJECTS
	_informer: class STRING or OBJECT

Returns:

Examples:
    (begin example)
    	[[informer_spot_1,informer_spot_2], this] call btc_fnc_side_captive_informer;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_positions",[],[[objNull]]],
	["_informer","C_journalist_F",["",objNull]]
];

if (_positions isEqualTo []) exitWith {["btc_fnc_side_captive_informer: bad params %1",_this] call BIS_fnc_error};

private _isMultiplayer = [0,-2] select isDedicated;
private _informer = [_positions,_informer] call btc_fnc_side_captive_unit_init;

if(isNull _informer) exitWith {["btc_fnc_side_captive: bad informer %1",_informer] call BIS_fnc_error};

private _informers = missionNamespace getVariable ["btc_side_captive_informers",[]]; //global var holding informers
_informers pushBack _informer;
missionNamespace setVariable ["btc_side_captive_informers",_informers, true]; //update global var with new informer

[_informer,{
	//GLOBAL: Action that will hint to the interrogating player the position of the captives
	private _action = [format["informer_%1", _this], "Interrogate", "",
	{
		private _captives = missionNamespace getVariable ["btc_side_captives",[]];
		private _positions_string = _captives apply {format["A general is hiding at:[%1]",mapGridPosition _x]};
		hint(_positions_string joinString "\n"); //separate each captive position with a newline
	}, {true}] call ace_interact_menu_fnc_createAction;

	[_this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["call",_isMultiplayer, _informer];

_informer
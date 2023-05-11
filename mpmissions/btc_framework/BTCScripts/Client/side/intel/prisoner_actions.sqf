/* ----------------------------------------------------------------------------
Function: btc_fnc_side_intel_prisoner_actions

Description:
    Adds action to prisoner
Parameters:
	_prisoner: OBJECTS
	_intel: OBJECTS

Returns:

Examples:
    (begin example)
    	[prisoner_1,intel_1] call btc_fnc_side_intel_prisoner_actions;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_unit",objNull,[objNull]],
	["_intel",objNull,[objNull]]
];

if (_unit getVariable ["btc_intel_actionid",-1] != -1) exitWith {};

if(!isNull _intel) then { //give player intel pos
	private _action = ["intel_pos", "Intel position", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",
	{
		params["_target"];

		[_target, //delete after x seconds
		{
			_this allowDamage true;
			_this enableAI "ALL";
			[{deleteVehicle _this}, _this, 60] call CBA_fnc_waitAndExecute;
		}] remoteExecCall ["call",_target];

		[_target, //remove action
		{
			_id = _this getVariable "btc_intel_actionid";
			[_this,0,_id] call ace_interact_menu_fnc_removeActionFromObject;
		}] remoteExecCall ["call",0,_target];

		[_target,"ApanPercMstpSnonWnonDnon_G01"] remoteExecCall["switchMove",0, _target]; //set animation to panicked state
		_type = _target getVariable ["btc_side_intel_type","Intel"]; //get data type to be hinted
		_pos = _target getVariable ["btc_side_intel_GetPos",[0,0,0]]; //get data to be hinted
		hint format["%1 position found at [%2]", _type, _pos];
		_mkr = createMarker [format ["btc_side_intel_%1", _pos], _pos];
		_mkr setMarkerType "mil_dot";
		_mkr setMarkerColor "colorBLUFOR";
		_mkr setMarkerText "Intel Position";
	}, {true}] call ace_interact_menu_fnc_createAction;

	private _id = [_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	_unit setVariable ["btc_intel_actionid",_id];
}else{//simply allow POW to flee
	private _action = ["intel_setfree", "Set Free", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",
	{
		params["_target"];

		[_target, //delete after x seconds
		{
			_this allowDamage true;
			_this enableAI "ALL";
			[{deleteVehicle _this}, _this, 60] call CBA_fnc_waitAndExecute;
		}] remoteExecCall ["call",_target];
		[_target,"ApanPercMstpSnonWnonDnon_G01"] remoteExecCall["switchMove",0, _target]; //set animation to panicked state

		[_target, //remove action
		{
			_id = _this getVariable "btc_intel_actionid";
			[_this,0,_id] call ace_interact_menu_fnc_removeActionFromObject;
		}] remoteExecCall ["call",0,_target];

		hint "Thank you for freeing me!";
	}, {true}] call ace_interact_menu_fnc_createAction;

	private _id = [_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	_unit setVariable ["btc_intel_actionid",_id];
};
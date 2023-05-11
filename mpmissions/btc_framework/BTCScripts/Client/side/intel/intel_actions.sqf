/* ----------------------------------------------------------------------------
Function: btc_fnc_side_intel_actions

Description:
    Adds action to intel
Parameters:
	_prisoner: OBJECTS
	_intel: OBJECTS

Returns:

Examples:
    (begin example)
    	[intel_1,prisoner_1] call btc_fnc_side_intel_actions;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_intel",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

if (_intel getVariable ["btc_intel_actionid",-1] != -1) exitWith {};

if(!isNull _unit) then { //give player POW pos
	private _action = ["pow_data_retrieval", "Retrieve Data", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",
	{
		[5,	_target,
		{
			_type = (_this select 0) getVariable ["btc_side_intel_type","POW"]; //get data type to be hinted
			_pos = (_this select 0) getVariable ["btc_side_intel_GetPos",[0,0,0]]; //get data to be hinted
			hint format["%1 position found at [%2]",_type, _pos];
			_mkr = createMarker [format ["btc_side_pow_%1", _pos], _pos];
			_mkr setMarkerType "mil_dot";
			_mkr setMarkerColor "colorBLUFOR";
			_mkr setMarkerText "POW Position";
		}, {hint "Aborted"}, "Retrieving"] call ace_common_fnc_progressBar;
	}, {true}] call ace_interact_menu_fnc_createAction;

	[_intel, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}else{ //endstate to this intel
	private _action = ["data_retrieval", "Retrieve Data", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",
	{
		[5,	_target,
		{
			_intel = _this select 0;
			_id = _intel getVariable "btc_intel_actionid";
			[_intel,
			{ //remove action
				_id = _this getVariable "btc_intel_actionid";
				[_this,0,_id] call ace_interact_menu_fnc_removeActionFromObject;
			}] remoteExecCall ["call",0,_intel];
			hint "Intel cache retrieved";
		}, {hint "Aborted"}, "Retrieving"] call ace_common_fnc_progressBar;
	}, {true}] call ace_interact_menu_fnc_createAction;

	private _id = [_intel, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	_intel setVariable ["btc_intel_actionid",_id];
};
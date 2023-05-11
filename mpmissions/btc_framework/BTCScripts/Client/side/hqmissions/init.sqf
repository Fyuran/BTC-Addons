/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hqmissions

Description:
    Initializes a "Land_DataTerminal_01_F" to have an ACE action with GUI popup for runtime dynamic missions
Parameters:

Returns:

Examples:
    (begin example)
    	[cursorObject] call btc_fnc_side_hqmissions;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_terminal", objNull, [objNull]]
]) exitWith {["btc_fnc_side_hqmissions", format["bad params %1", _this]] call btc_fnc_logDebug};
if !(_terminal isKindOf "Land_DataTerminal_01_F") exitWith {
	["btc_fnc_side_hqmissions", format["bad param[0] class(%1) not 'Land_DataTerminal_01_F'", typeOf _terminal]] call btc_fnc_logDebug;
};

private _action = ["hqmissions_openGUI", "Missions menu", "\z\btc_po_canteen\btc_ace_actions_icon.paa", {
	[_this select 0, 3] call BIS_fnc_dataTerminalAnimate;
	missionNamespace setVariable ["hqmission_used_terminal", _this select 0];
	createDialog "btc_hqmissions_gui";
}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
_action = [_terminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

if(BTC_DEBUG) then {
	_mkr = createMarkerLocal [format ["%1", vehicleVarName _terminal], _terminal];
	_mkr setMarkerTypeLocal "mil_dot";
	_mkr setMarkerColorLocal "colorBLUFOR";
	_mkr setMarkerTextLocal "HQ Missions";
};

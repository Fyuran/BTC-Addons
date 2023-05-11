/* ----------------------------------------------------------------------------
Function: btc_fnc_database_mhqs_addActions

Description:
    Adds ACE deploy and undeploy actions.

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_database_mhqs_addActions;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_target", objNull, [objNull]]
]) exitWith {["btc_fnc_database_mhqs_addActions","attempted to add actions to objNull"] call btc_fnc_logDebug};

private _action_1 = ["database_mhq_deploy", "Deploy HQ", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_thumbsUp_ca.paa", {
    [10, _this, {
        _args params ["_target","_caller"];
        [_target, side _caller] remoteExecCall ["btc_fnc_database_mhqs_deployHq", 2];
        ["btc_fnc_database_mhqs_addActions", format["%1 has been deployed by %2(%3)", _target, _caller, steamProfileUrl]] call btc_fnc_logDebug;
        playSound3D [GetMissionPath "BTCScripts\Client\database\uplace.ogg", objNull, false, getPosASL _target, 5, 1, 50];
        hint "Hq deployed, fuel removed";
    }, {}, "Deploying"] call ace_common_fnc_progressBar;
},
{!(_target getVariable ["btc_database_MHQisActive", false])}, {}, []] call ace_interact_menu_fnc_createAction;

private _action_2 = ["database_mhq_undeploy", "Un-deploy HQ", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_thumbsDown_ca.paa", {
    [10, _this, {
        _args params ["_target","_caller"];
        [_target] remoteExecCall ["btc_fnc_database_mhqs_undeployHq", 2];
        ["btc_fnc_database_mhqs_addActions", format["btc_fnc_database_mhqs %1 has been un-deployed by %2(%3)", _target, _caller, steamProfileUrl]] call btc_fnc_logDebug;
        playSound3D [GetMissionPath "BTCScripts\Client\database\r_uplace.ogg", objNull, false, getPosASL _target, 5, 1, 50];
        hint "Hq un-deployed, fuel restored";
    }, {}, "Un-Deploying"] call ace_common_fnc_progressBar;
}, {_target getVariable ["btc_database_MHQisActive", false]}, {}, []] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _action_1] call ace_interact_menu_fnc_addActionToObject;
[_target, 0, ["ACE_MainActions"], _action_2] call ace_interact_menu_fnc_addActionToObject;
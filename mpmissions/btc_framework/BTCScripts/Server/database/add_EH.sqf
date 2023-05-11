/* ----------------------------------------------------------------------------
Function: btc_fnc_database_add_EH

Description:
    Adds Database EventHandlers from object

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject,"btc_database_objeh_remove"] call btc_fnc_database_add_EH;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params [
	["_obj",objNull,[objNull]],
	["_serverEvent","",[""]]
];

_obj setVariable ["btc_database_EHs_data", _serverEvent, true];

[_obj, {
	_id1 = _this addEventHandler ["Killed", {[_this select 0 getVariable "btc_database_EHs_data", [_this select 0]] call CBA_fnc_serverEvent}];
	_id2 = _this addEventHandler ["Deleted", {[_this select 0 getVariable "btc_database_EHs_data", [_this select 0]] call CBA_fnc_serverEvent}];
    _this setVariable ["btc_database_EHs", [_id1,_id2]];
}] remoteExecCall ["call", 0, _obj];
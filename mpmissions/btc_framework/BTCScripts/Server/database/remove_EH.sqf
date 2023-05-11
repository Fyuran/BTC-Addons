/* ----------------------------------------------------------------------------
Function: btc_fnc_database_remove_EH

Description:
    Removes Database EventHandlers from object

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_database_remove_EH;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params [
	["_obj",objNull,[objNull]]
];

private _eh_IDs = _obj getVariable ["btc_database_EHs", [0,0]];
_obj removeEventHandler ["Killed", _eh_IDs select 0];
_obj removeEventHandler ["Deleted", _eh_IDs select 1];

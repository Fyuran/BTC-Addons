
/* ----------------------------------------------------------------------------
Function: btc_fnc_logDebug

Description:
Helper function for RemoteExecCalling diag_log for debugging purpopes

Parameters:

Returns:

Examples:
    (begin example)
    	["btc_fnc_logDebug is working on %1", player] call btc_fnc_logDebug;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[ 
    ["_title", "BTC DEBUG", [""]],
    ["_msg","",[""]]
];
[_msg, _title, [false, true, true]] call CBA_fnc_debug;
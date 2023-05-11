/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehs_get_magazines

Description:
    Retrieves magazines information from vehicle

Parameters:


Returns:

Examples:
    (begin example)
        cursorObject call btc_fnc_database_vehs_get_magazines;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
private _magazines = magazinesAllTurrets _this;
_magazines apply {_x resize 3}; //discard useless information

_magazines
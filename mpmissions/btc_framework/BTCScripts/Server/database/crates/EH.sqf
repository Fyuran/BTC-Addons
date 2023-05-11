/* ----------------------------------------------------------------------------
Function: btc_fnc_database_crates_EH

Description:
    Periodic check for crates.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_crates_EH;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
//ADD CAPTURED CRATE TO DATABASE
/*["btc_database_crate_add", {
    params ["_v"];
    _data = _v call btc_fnc_database_crates_get_data;
    btc_database_crates_savedata pushBack _data;
    btc_database_crates pushBack _v;
    _v setVariable ["btc_database_data", _data];
    _v setVariable ["btc_database_isPersistent",true,true];
    [_v,"btc_database_crate_remove"] call btc_fnc_database_add_EH;
}, []] call CBA_fnc_addEventHandlerArgs;
*/
//REMOVE CAPTURED CRATE FROM DATABASE
["btc_database_crate_remove", {
    params ["_v"];
    _data = _v getVariable "btc_database_data";
    _i =  btc_database_crates_savedata find _data;
    btc_database_crates_savedata deleteAt _i;
    btc_database_crates deleteAt _i;
    _v setVariable ["btc_database_isPersistent",nil,true];
    _v setVariable ["btc_database_data", nil];
    _v call btc_fnc_database_remove_EH;
    if(BTC_DEBUG) then {deleteMarker (_v getVariable ["btc_database_marker", ""])};
}, []] call CBA_fnc_addEventHandlerArgs;
/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehs_EH

Description:
    Initializes Vehicles Database functions.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_vehs_EH;
    (end)

Author:
    Fyuran
---------------------------------------------------------------------------- */
//ADD CAPTURED VEH TO DATABASE
["btc_database_veh_add", {
    params ["_v"];
    _data = _v call btc_fnc_database_vehs_get_data;
    btc_database_vehs_savedata pushBack _data;
    btc_database_vehs pushBack _v;
    _v setVariable ["btc_database_data", _data];
    _v setVariable ["btc_database_isPersistent",true,true];
    [_v,"btc_database_veh_remove"] call btc_fnc_database_add_EH;
}, []] call CBA_fnc_addEventHandlerArgs;

//REMOVE CAPTURED VEH FROM DATABASE
["btc_database_veh_remove", {
    params ["_v"];
    _data = _v getVariable "btc_database_data";
    _i =  btc_database_vehs_savedata find _data;
    btc_database_vehs_savedata deleteAt _i;
    btc_database_vehs deleteAt _i;
    _v setVariable ["btc_database_isPersistent",nil,true];
    _v setVariable ["btc_database_data", nil];
    _v call btc_fnc_database_remove_EH;
    if(BTC_DEBUG) then {deleteMarker (_v getVariable ["btc_database_marker", ""])};
}, []] call CBA_fnc_addEventHandlerArgs;
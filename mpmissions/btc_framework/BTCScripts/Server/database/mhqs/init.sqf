/* ----------------------------------------------------------------------------
Function: btc_fnc_database_mhqs_init

Description:
    Parses mhqs. This function MUST always wait for vehs_database_inithandle to be done as it shares functionality with that database such as pos, fuel ecc.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_mhqs_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
btc_database_mhqs = [];

[{scriptDone vehs_database_inithandle}, {
    //Grab every mhq_# object from missionNamespace as vehicles_database deletes them on init so it's impossible to take them from editor var names
    for "_i" from 1 to count btc_database_vehs do {
        _x = missionNamespace getVariable [format["mhq_%1",_i], objNull];
        if(isNull _x) exitWith {};
        btc_database_mhqs pushBack _x;
        _x setVariable ["btc_database_canRemove", false, true];
    };
    publicVariable "btc_database_mhqs";
    if(btc_database_mhqs isEqualTo []) exitWith {if(BTC_DEBUG) then {["btc_fnc_database_mhqs_init", format["no mhqs found %1", btc_database_mhqs]] call btc_fnc_logDebug}};

    //add actions
    btc_database_mhqs apply {
        if(alive _x) then {
            [_x] remoteExecCall ["btc_fnc_database_mhqs_addActions", 0, _x];
        };
    };

    if(BTC_DEBUG)then{["btc_fnc_database_mhqs_init","managing data for btc_database_mhqs_savedata"] call btc_fnc_logDebug};
}, []] call CBA_fnc_waitUntilAndExecute;
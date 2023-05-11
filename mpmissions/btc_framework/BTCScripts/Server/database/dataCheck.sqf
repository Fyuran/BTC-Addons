/* ----------------------------------------------------------------------------
Function: btc_fnc_database_dataCheck

Description:
    PERIODICALLY CHECKS DATA FOR DATABASES

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_dataCheck;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
[{scriptDone vehs_database_inithandle && {scriptDone crates_database_inithandle}}, {
    btc_database_dataCheck_handle = [{[] call btc_fnc_database_saveData;}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

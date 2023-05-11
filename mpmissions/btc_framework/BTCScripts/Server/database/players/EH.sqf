/* ----------------------------------------------------------------------------
Function: btc_fnc_database_players_EH

Description:
    Parses global var players database.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_players_EH;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
//UPDATE DATABASES
["btc_database_players_clear", {
    [] call btc_fnc_database_clear;
}] call CBA_fnc_addEventHandler;
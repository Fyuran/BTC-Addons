/* ----------------------------------------------------------------------------
Function: init.sqf

Description:
    Initializes global variables, parameters and executes locality inits
Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */
#include "script_component.hpp"

//Global Variables
GVAR(MISSION_SAVE_NAME) = worldName; //Save name that will be used by Persistence database
GVAR(MISSION_NAME) = getText(missionconfigfile >> "OnLoadName"); //Holds OnLoadName declared in description.ext
GVAR(PLAYER_SIDE) = west;
GVAR(ENEMY_SIDE) = east;
steamProfileUrl = "http://steamcommunity.com/profiles/" + (getPlayerUID player); //tracking variable for debugging and persistence

["CBA_SettingsInitialized", { //avoid condition race

    call compile preprocessFile QPATHTOF(scripts\mission_specific\BTC_mission_setup.sqf);

    if (GVAR(VCOM)) then {[] call VCM_fnc_VcomInit};

    if (isServer) then {
        call COMPILE_FILE(init_server);
    };
    if (!isDedicated && hasInterface) then {//Player
        call COMPILE_FILE(init_player);
    };
}] call CBA_fnc_addEventHandler;

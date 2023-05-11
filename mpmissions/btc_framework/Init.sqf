/* ----------------------------------------------------------------------------
Function: init.sqf

Description:

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */

//AA- Variables ****************************************************************************************************************


MISSION_SAVE_NAME = worldName;					//Save name that will be used by Persistence database
MISSION_NAME = getText(missionconfigfile >> "OnLoadName"); //Holds OnLoadName declared in description.ext
BTC_SIDEMISSIONS = true;
BTC_TANKASTIC_MAX_LIVES = 10; //Maximum amount of tank respawns;
BTC_LOCKPICKING = true;
BTC_TICKETS = false;
CHVD_allowNoGrass = false;                   // false = it's impossible to remove grass / true = it's possible to remove grass
BTC_Civ = 2;                                 // 1 = European / 2 = Takistan / 3 = russians
BTC_PLAYER_SIDE = west;
BTC_ENEMY_SIDE = east;
BTC_ENEMY_FACTION = 4; //faction types are defined in Scripts\Server\EOS\UnitPools.sqf
steamProfileUrl = "http://steamcommunity.com/profiles/" + (getPlayerUID player); //tracking variable for debugging and persistence
//AA- Parameters ****************************************************************************************************************
//[false,true] select ("PARAM_TEST" call BIS_fnc_getParamValue); means if PARAM_TEST is 1, return true, if it's 0 then return false.

BTC_DATE = "BTC_DATE" call BIS_fnc_getParamValue;         // "06:00","12:00","Midnight fullmoon", "Midnight no moon"
BTC_TIMEACC = "BTC_TIMEACC" call BIS_fnc_getParamValue;	// 1x / 12x / 24x
BTC_SHORTER_NIGHTS = [false,true] select ("BTC_SHORTER_NIGHTS" call BIS_fnc_getParamValue);
BTC_ANIMALS = [false,true] select ("BTC_ANIMALS" call BIS_fnc_getParamValue);
BTC_FUEL_CONSUMPTION = [false,true] select ("BTC_FUEL_CONSUMPTION" call BIS_fnc_getParamValue);
BTC_DUSTSTORM = [false,true] select ("BTC_DUSTSTORM" call BIS_fnc_getParamValue);
BTC_FLYBY = [false,true] select ("BTC_FLYBY" call BIS_fnc_getParamValue);
BTC_ENEMY_CQB = [false,true] select ("BTC_ENEMY_CQB" call BIS_fnc_getParamValue);
BTC_MISSIONTIMER = ("BTC_MISSIONTIMER" call BIS_fnc_getParamValue) * 60;
BTC_TANKASTIC = "BTC_TANKASTIC" call BIS_fnc_getParamValue; //edit classes in BTCScripts\Server\side\tankastic\class.sqf
BTC_PERSISTENCE = [false,true] select ("BTC_PERSISTENCE" call BIS_fnc_getParamValue);
BTC_PERSISTENCE_CLEAR = [false,true] select ("BTC_PERSISTENCE_CLEAR" call BIS_fnc_getParamValue);
BTC_DEBUG = [false,true] select ("BTC_DEBUG" call BIS_fnc_getParamValue);
if(!isMultiplayer) then {BTC_DEBUG = true}; //SP is dedicated to testing and debugging

//VCM- VCOM *********************************************************************************************************************************************
execVM "Scripts\Common\Vcom\Vcominit.sqf";

//IN- INIT FILES *********************************************************************************************************************************************
//Initialization order is different based if it's multiplayer or singleplayer, with the following lines we force to initialize init.sqf-> then init_server.sqf OR init_player.sqf
if (isServer) then {
    {[] call compile preprocessFileLineNumbers "init_server.sqf"} call CBA_fnc_directCall;
};
if (!isDedicated && hasInterface) then {//Player
    [] call compile preprocessFileLineNumbers "init_player.sqf";
};


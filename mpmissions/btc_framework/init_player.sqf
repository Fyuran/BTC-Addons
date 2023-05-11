/* ----------------------------------------------------------------------------
Function: init_player.sqf

Description:

Parameters:


Returns:


Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */
[{!isNull player && {player == player}}, {
	enableSentences false;
	player addRating 20000;
	if(!BTC_DEBUG) then {BTC_intro_handle = [] spawn BTC_intro}; //SP is dedicated to testing and debugging
	call compile preprocessFileLineNumbers "BTCScripts\Client\common\actions.sqf"; //add actions to every player
	if (BTC_FUEL_CONSUMPTION) then {
		player addEventHandler ["GetInMan", {kp_fuel_consumption_handle = [_this select 2] spawn kp_fuel_consumption}];
	};
	if(BTC_TICKETS) then {[] call btc_fnc_side_tickets_EH};
	//[false] call btc_fnc_side_incognito;
}] call CBA_fnc_waitUntilAndExecute;

if(BTC_DEBUG) then {
	player allowDamage false;
	addMissionEventHandler ["MapSingleClick", {
		params ["_units", "_pos", "_alt", "_shift"];
		BTC_DEBUG_TELEPORT = missionNamespace getVariable ["BTC_DEBUG_TELEPORT", true];
		if(BTC_DEBUG_TELEPORT) then {vehicle player setPos _pos};
	}];
	waitUntil{!isNull (findDisplay 12)};
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_fnc_marker_debug]; //adds markers that update each frame on map for debugging purpopes
};
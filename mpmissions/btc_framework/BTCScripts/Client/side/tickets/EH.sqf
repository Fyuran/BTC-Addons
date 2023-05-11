/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tickets_EH

Description:
    Manages Client EHs
Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_side_tickets_EH
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(isNil "spawn_west" or {isNil "spawn_guer"}) exitWith {["btc_fnc_side_tickets: spawn_west or spawn_guer not defined"] call btc_fnc_logDebug};
private _spawns = [spawn_west,spawn_guer];
if (BTC_DEBUG) then {
	["btc_fnc_side_tickets_EH", format["Adding Killed EH to %1", player]] call btc_fnc_logDebug;
	["btc_fnc_side_tickets_EH", format["Adding Respawn EH to %1", player]] call btc_fnc_logDebug;
	["btc_fnc_side_tickets_EH", format["player side: %1", side player]] call btc_fnc_logDebug;
	_spawns apply {["btc_fnc_side_tickets_EH", format["spawn array: [%1,%2]",_x, side _x]] call btc_fnc_logDebug};
};

_spawn_index = (_spawns findIf {side _x isEqualTo side player});
if(_spawn_index == -1) exitWith {["btc_fnc_side_tickets_EH", format["no valid spawn found, player side: %1", side player]] call btc_fnc_logDebug};
_spawnPos = getPosASL (_spawns select _spawn_index);
player setVariable ["tickets_spawnPos",_spawnPos];

player addEventHandler ["Killed", { //local version of Killed EH since other clients could care less if you died
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[playerSide] remoteExeccall ["btc_fnc_side_tickets_decrease",0];
		_unit setVariable ["btc_preDeath_loadout", getUnitLoadout _unit];
}];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setPosASL (_corpse getVariable ["tickets_spawnPos",[0,0,0]]);
	_unit setUnitLoadout (_corpse getVariable "btc_preDeath_loadout");
	deleteVehicle _corpse;
}];

private _action = ["btc_side_tickets", "Show Tickets Left", "", {
	hint composeText [image "\a3\Data_f\Flags\flag_blue_co.paa", format[" Tickets left:%1",SIDE_BLUFOR_TICKETS], lineBreak, lineBreak,
		image "\a3\Data_f\Flags\flag_green_co.paa", format[" Tickets left:%1",SIDE_INDFOR_TICKETS]
	];
}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","btc_ace_Actions"], _action] call ace_interact_menu_fnc_addActionToObject;
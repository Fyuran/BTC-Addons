/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tickets

Description:
    Initializes a PvP mission with faction based tickets
Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_side_tickets
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __DEFAULT_TICKETS 50
params[
	["_tickets",__DEFAULT_TICKETS,[0]]
];
if(isNil "spawn_west" or {isNil "spawn_guer"}) exitWith {["btc_fnc_side_tickets", "spawn_west or spawn_guer not defined"] call btc_fnc_logDebug};

private _enableRandomPos = false; //unused
private _spawns = [spawn_west,spawn_guer];
_spawns apply {
	hideObjectGlobal _x;
	_x enableSimulationGlobal false;
	_x allowDamage false;
};

SIDE_OPFOR_TICKETS = _tickets; publicVariable "SIDE_OPFOR_TICKETS";
SIDE_BLUFOR_TICKETS = _tickets; publicVariable "SIDE_BLUFOR_TICKETS";
SIDE_INDFOR_TICKETS = _tickets; publicVariable "SIDE_INDFOR_TICKETS";

//assign spawn points
private _spawn_westPos = getPosASL spawn_west;
private _spawn_guerPos = getPosASL spawn_guer;

if (_enableRandomPos) then {
	_spawn_westPos = getPosASL selectRandom _spawns;
	_spawn_guerPos = getPosASL (_spawns select (_spawns findIf {!(getPosASL _x isEqualTo _spawn_westPos)})); //find a not occupied position
};
spawn_west setPosASL _spawn_westPos;
spawn_guer setPosASL _spawn_guerPos;
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tankastic

Description:
    Initializes a tankastic PvP mission
Parameters:
	_west: ARRAY of ARRAYS
	_east: ARRAY of ARRAYS
Returns:

Examples:
    (begin example)
        [ [[BLUFOR_STAND_1],[BLUFOR_SPAWN_1]], [[[OPFOR_STAND_1],[OPFOR_SPAWN_1]]] call btc_fnc_side_tankastic
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_west",[],[[]],2],
	["_east",[],[[]],2]
];
_west params [
	["_blu_stands",[],[[objNull]]],
	["_blu_spawns",[],[[objNull]]]
];
_east params [
	["_red_stands",[],[[objNull]]],
	["_red_spawns",[],[[objNull]]]
];
if(_blu_stands isEqualTo [] or {_blu_spawns isEqualTo []} or {(count _blu_stands) != (count _blu_spawns)}) exitWith {["btc_fnc_side_tankastic: found bad array in _west"] call BIS_fnc_error};
if(_red_stands isEqualTo [] or {_red_spawns isEqualTo []} or {(count _blu_stands) != (count _blu_spawns)}) exitWith {["btc_fnc_side_tankastics: found bad array in _east"] call BIS_fnc_error};

private _classes = [BTC_TANKASTIC] call btc_fnc_side_tankastic_class;
private _west_tanks = _classes select 0;
private _east_tanks = _classes select 1;

BTC_TANKASTIC_LIVES = [_west_tanks apply {BTC_TANKASTIC_MAX_LIVES},_east_tanks apply {BTC_TANKASTIC_MAX_LIVES}];
publicVariable "BTC_TANKASTIC_LIVES";

[_west,_east,_classes] remoteExecCall ["btc_fnc_side_tankastic_actions",0,true];
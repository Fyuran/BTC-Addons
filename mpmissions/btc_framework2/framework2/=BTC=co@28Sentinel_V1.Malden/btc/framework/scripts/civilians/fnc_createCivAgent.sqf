
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_createCivAgent

Description:
    Create civilian agent for civilian presence module

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_framework_fnc_createCivAgent;
    (end)

Author:
    BIS, Jeroen Notenbomer, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [["_module",objNull,[objNull]],["_pos",[],[[]]]];

//randomize position
if (count _pos == 0) then
{
	_pos = getPos selectRandom (_module getVariable ["#modulesUnit",[]]);
};

private _posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];


//check if any player can see the point of creation
private _seenBy = ([] call CBA_fnc_players) select {_x distance _pos < 50 || {(_x distance _pos < 150 && {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5})}};

//["[ ] Trying to create unit on position %1 that is seen by %2",_pos,_seenBy] call bis_fnc_logFormat;

//terminate if any player can see the position
if (count _seenBy > 0) exitWith {objNull};

private _class = selectRandom (_module getVariable ["#unitTypes",[]]);

_unit = createAgent [_class, _pos, [], 0, "NONE"];
_unit disableAI "FSM";
_unit setBehaviour "CARELESS";

#ifdef DEBUG_MODE_FULL
GVAR(Civs) = missionNamespace getVariable [QGVAR(CIVS), []];
GVAR(Civs) pushBack _unit;
#endif


_unit setVariable ["#isAgent", true];
_unit addEventHandler ["FiredNear", {
    params ["_unit", "_firer"];
    [_unit, [_firer]] call bis_fnc_cp_main;
}];
_unit addEventHandler ["Hit", {
    params ["_unit", "_source", "_damage", "_instigator"];
    [_unit, [_instigator]] call bis_fnc_cp_main;
}];

//make backlink to the core module
_unit setVariable ["#core",_module];

_unit setBehaviour "CARELESS";
//_unit spawn (_module getVariable ["#onCreated",{}]); // onCreated is not set anywhere?
_unit execFSM "A3\Modules_F_Tacops\Ambient\CivilianPresence\FSM\behavior.fsm";

_unit
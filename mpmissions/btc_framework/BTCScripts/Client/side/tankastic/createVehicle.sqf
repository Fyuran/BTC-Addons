/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tankastic_createVehicle

Description:
    AI filler will leave player's group and create new AI for the newest vehicle
Parameters:
	_v: Object
Returns:

Examples:
    (begin example)
        [BTC_TANKASTIC_VEH_1] call btc_fnc_side_tankastic_createVehicle
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_class","",[""]],
	["_spawn",[objNull],[objNull]]
]) exitWith {["btc_fnc_side_tankastic_createGroup bad params: %1", _this] call BIS_fnc_error};

[] call btc_fnc_side_tankastic_createGroup;

private _group = group player;
private _v_arr = [getPos _spawn,direction _spawn,_class,_group] call BIS_fnc_spawnVehicle;
private _v = _v_arr select 0;

deleteVehicle driver _v;
private _players = units _group select {isPlayer _x};
if(count _players > 1) then {deleteVehicle gunner _v};
if(count _players > 2) then {deleteVehicle commander _v};
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tankastic_createGroup

Description:
    AI filler will leave player's group and create new AI for the newest vehicle
Parameters:
	_v: Object
Returns:

Examples:
    (begin example)
        [BTC_TANKASTIC_VEH_1] call btc_fnc_side_tankastic_createGroup
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
(units group player select {!isPlayer _x && !alive _x}) apply {
	deleteVehicle _x;
};

private _old_ai = units group player select {!isPlayer _x && alive _x};
if (count _old_ai > 0) then {
	private _newGroup = createGroup [side player, true];
	_old_ai join _newGroup;
};
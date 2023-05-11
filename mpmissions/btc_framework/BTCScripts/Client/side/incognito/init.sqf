/* ----------------------------------------------------------------------------
Function: btc_fnc_side_incognito

Description:
    Sets the player object to incognito status by applying captive status and adds EH to reapply on respawn
Parameters:

Returns:

Examples:
    (begin example)
        [true] call btc_fnc_side_incognito
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_Respawn",false,[true]]
];

private _player = player;
_player setCaptive true;
if(_Respawn) then {
	_player addEventHandler ["Respawn", {
		(_this select 0) setCaptive true;
	}];
};
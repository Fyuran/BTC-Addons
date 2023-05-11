/* ----------------------------------------------------------------------------
Function: btc_fnc_database_players_get_data

Description:
    Retrieves data from the player

Parameters:


Returns:

Examples:
    (begin example)
        [player] call btc_fnc_database_players_get_data;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_unit",objNull,[objNull]],
	["_uid","",[""]]
];

[
	getPosASL _unit,
	direction _unit,
	getUnitLoadout _unit,
	_uid
]
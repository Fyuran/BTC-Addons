/* ----------------------------------------------------------------------------
Function: btc_fnc_database_crates_get_data

Description:
    Retrieves data from the crate

Parameters:


Returns:

Examples:
    (begin example)
        cursorObject call btc_fnc_database_crates_get_data;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
[
	typeOf _this,
	getPos _this,
	direction _this,
	!isNull attachedTo _this,
	_this call btc_fnc_database_vehs_get_cargo
]
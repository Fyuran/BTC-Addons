/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehs_get_data

Description:
    Retrieves data from the vehicle

Parameters:


Returns:

Examples:
    (begin example)
        cursorObject call btc_fnc_database_vehs_get_data;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
[
	typeOf _this,
	getPos _this,
	direction _this,
	(getAllHitPointsDamage _this) select 2,
	fuel _this,
	_this call btc_fnc_database_vehs_get_magazines,
	locked _this,
	_this call btc_fnc_database_vehs_get_cargo,
	(_this call BIS_fnc_getVehicleCustomization) select 0, //could care less about animations
	(getObjectTextures _this) select 0, //database functions will modify only the 0 index of hiddenSelections[]
	vehicleVarName _this
]
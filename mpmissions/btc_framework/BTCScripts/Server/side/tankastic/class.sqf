/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tankastic_class

Description:
    Returns class names based on BTC_TANKASTIC mission parameter value
Parameters:

Returns:
	_classes
Examples:
    (begin example)
        [] call btc_fnc_side_tankastic_class
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_value",0,[0]]
];

if(BTC_DEBUG) then {
	["btc_fnc_side_tankastic_class",format["_value:",_value]] call btc_fnc_logDebug;
};

_classes = call { //toDo Include INDFOR?
	if(_value==0) exitWith{[["B_MBT_01_cannon_F","B_MBT_03_cannon_F"],["O_MBT_04_cannon_F","O_MBT_02_cannon_F"]]}; //syntax is [[BLUFOR VEHICLES], [OPFOR VEHICLES]]
	//example: if(_value==1) exitWith{[["rhsusf_m1a1aimd_usarmy"],["rhs_btr60_msv"]]};

	[]
};
if(_classes isEqualTo []) then {["btc_fnc_side_tankastic_class", format["error, _classes isEqualTo []"]] call btc_fnc_logDebug};

_classes
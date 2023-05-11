/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hqmissions_fillList

Description:
    Fills left listbox of hqmissions's GUI
Parameters:

Returns:

Examples:
    (begin example)
    	[] call btc_fnc_side_hqmissions_fillList;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params["_ctrl"];
if !(_ctrl isEqualType ctrlNull) exitWith {["btc_fnc_side_hqmissions_fillList", format["bad params %1", _this]] call btc_fnc_logDebug};

_ctrl lbAdd "Eliminate HVT";
_ctrl lbAdd "Rescue Journalist";
//_ctrl lbAdd "Destroy AA emplacement";
_ctrl lbAdd "Defuse IED";
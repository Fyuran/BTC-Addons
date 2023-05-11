/* ----------------------------------------------------------------------------
Function: btc_fnc_side_barreldefusal_removeActions

Description:
    Helper function that removes actions from a single barrel and its phone

Parameters:


Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_radio",objNull,[objNull]]
]) exitWith{["btc_fnc_side_barreldefusal_removeActions: ERROR %1",_this] call BIS_fnc_error};

_actionIDS = _radio getVariable ["barreldefusal_actionids",[]];
if(_actionIDS isEqualTo []) exitWith {["btc_fnc_side_barreldefusal_removeActions: bad actions ids(%1)",_actionIDS] call BIS_fnc_error};
_actionIDS apply {[_radio,0,_x] call ace_interact_menu_fnc_removeActionFromObject};

true
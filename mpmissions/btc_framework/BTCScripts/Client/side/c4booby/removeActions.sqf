/* ----------------------------------------------------------------------------
Function: btc_fnc_side_c4booby_removeActions

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
	["_defuser",objNull,[objNull]]
]) exitWith{["btc_fnc_side_c4booby_removeActions: ERROR %1",_this] call BIS_fnc_error};

_actionIDS = _defuser getVariable ["c4booby_actionids",[]];
if(_actionIDS isEqualTo []) exitWith {["btc_fnc_side_c4booby_removeActions: bad actions ids(%1)",_actionIDS] call BIS_fnc_error};
_actionIDS apply {[_defuser,0,_x] call ace_interact_menu_fnc_removeActionFromObject};

true
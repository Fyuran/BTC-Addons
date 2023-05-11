/* ----------------------------------------------------------------------------
Function: btc_fnc_side_marked_objects
Description:
    PERIODICALLY ASSIGNS AND REASSIGN MARKER ON OBJECT

Parameters:


Returns:

Examples:
    (begin example)
        [player] call btc_fnc_side_marked_objects;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_objs", [], [[]]]
]) exitWith {["btc_fnc_side_marked_objects", format["bad params %1", _this]] call btc_fnc_logDebug};

{
	_mkr = createMarker [format["side_marked_mkr_%1", _x], getPosASL _x];
	_mkr setMarkerShape "ICON";
	_mkr setMarkerType "hd_dot";
	_mkr setMarkerText format ["%1", _x];
	_x setVariable ["side_marked_mkr", _mkr];
}forEach _objs;

_handle = [{
	_args apply {
		_mkr = _x getVariable ["side_marked_mkr", ""];
		if !(_mkr isEqualTo "") then {
			_mkr setMarkerPos getPosASL _x;
		};
	};
}, 1, _objs] call CBA_fnc_addPerFrameHandler;

_handle
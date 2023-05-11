
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_getRoadWidth

Description:
Measures the width of a road object with given precision

Parameters:
	_road - road object
	_precision - the precision with which to find the width
	_maxWidth - the maximum width. If the road is wider, the return value will max at _maxWidth
Returns:
	number, road width or 0 if wrong road object was given
Examples:
    (begin example)
		[] call btc_framework_fnc_getRoadWidth;
    (end)

Author:
    Sparker

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params [["_road", objNull, [objNull]], "_precision", "_maxWidth"];

if(isNull _road) exitWith {0}; //Wrong data was given

private _direction = [_road] call FUNC(getRoadDirection);

//Spawn an arrow facing the road
private _roadPos = getPos _road;
#ifdef DEBUG_MODE_FULL
	_arrow = "Sign_Arrow_Blue_F" createVehicle _roadPos;
	_arrow setVectorDirAndUp [[0, 0, 1], [sin _direction, cos _direction, 0]];
#endif

//Get orthogonal direction
private _cos = cos (_direction+90);
private _sin = sin (_direction+90);
private _vectorDir = [_sin, _cos, 0];

//Find road width in one direction
private _checkPos = _roadPos;
private _testWidth = 0;
private _width = 0;
while {(_width <= _maxWidth) && (isOnRoad _checkPos)} do
{
	_width = _width + _precision;
	_testWidth = _testWidth + _precision;
	_checkPos = _roadPos vectorAdd (_vectorDir vectorMultiply _testWidth);

	#ifdef DEBUG_MODE_FULL
		"Sign_Arrow_Pink_F" createVehicle _checkPos;
	#endif
};


//Find road width in another direction
_testWidth = 0;
_vectorDir = [-_sin, -_cos, 0]; //Rotate the vector 180 degrees
_checkPos = _roadPos;
while {(_width <= _maxWidth) && (isOnRoad _checkPos)} do
{
	_width = _width + _precision;
	_testWidth = _testWidth + _precision;
	_checkPos = _roadPos vectorAdd (_vectorDir vectorMultiply _testWidth);

	#ifdef DEBUG_MODE_FULL
		"Sign_Arrow_Pink_F" createVehicle _checkPos;
	#endif
};

_width
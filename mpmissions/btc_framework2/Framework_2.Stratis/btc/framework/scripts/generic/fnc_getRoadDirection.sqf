
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_getRoadDirection

Description:
Measures the direction of this road segment

Parameters:
	_road - road object
Returns:
	number, direction in degrees
Examples:
    (begin example)
		[] call btc_framework_fnc_getRoadDirection;
    (end)

Author:
    Sparker

---------------------------------------------------------------------------- */
params ["_road"];

private _connectedRoads = roadsConnectedTo _road;

private _numConnectedRoads = count _connectedRoads;
if (_numConnectedRoads == 0) exitWith {0}; //Connected road not found, can't calculate direction

private _direction = 0;
if(_numConnectedRoads == 1) then //If it's the end of the road
{
	_direction = _road getDir (_connectedRoads select 0);
	//diag_log "Detected one connected road";
}
else //Else approximate the direction by the direction between two nearest segments
{
	_direction = (_connectedRoads select 0) getDir (_connectedRoads select 1);
	//
};

_direction
/* ----------------------------------------------------------------------------
Function: btc_fnc_database_gaia_init

Description:
    Parses global var gaia database.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_gaia_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __ACTIVE__ true
#define __OUTOFBOUNDS__ [-1000,-1000]

btc_database_gaia_savedata = profileNamespace getVariable [format["btc_%1_gaia_savedata",MISSION_SAVE_NAME], []];
btc_database_gaia_antennas = [];
btc_database_gaia_units = [];

//Init gaia database
if (profileNamespace getVariable [format["btc_%1_gaia_savedata",MISSION_SAVE_NAME], []] isEqualTo []) then {
    for "_x" from 1 to 100 do
	{
		if !(getMarkerPos str _x isEqualTo [0,0,0]) then {btc_database_gaia_savedata pushback [str _x, __ACTIVE__]};
	};
};
profileNamespace setVariable [format["btc_%1_gaia_savedata", MISSION_SAVE_NAME], btc_database_gaia_savedata];

gaia_database_inithandle = [] spawn {
    scriptName "btc_database_gaia_inithandle";
    {
    	_x params [
    		["_marker","",[""]],
    		["_isActive", true, [false]]
    	];
        _antenna = missionNamespace getVariable format ["antenna_%1", _forEachIndex+1];
        _groups = (allGroups select { ((_x getVariable ["GAIA_ZONE_INTEND",[]]) select 0) isEqualTo _marker });
        btc_database_gaia_units pushBack _groups;
	    if(_isActive) then {
            _antenna setVariable ["btc_database_gaia_ID", _forEachIndex];
            _antenna addEventHandler ["Killed", {
                _id = (_this select 0) getVariable "btc_database_gaia_ID";
                _gaia_data = btc_database_gaia_savedata select _id;
                _gaia_data set [1,false];
                (_gaia_data select 0) setMarkerPos __OUTOFBOUNDS__;

            }];
            btc_database_gaia_antennas pushBack _antenna;
            if(BTC_DEBUG) then {
                _mkr = createMarker [format["%1_gaia_debug_antenna",_marker], _antenna];
                _mkr setMarkerShape "ICON";
                _mkr setMarkerColor "ColorPink";
                _mkr setMarkerType "hd_dot";
                _mkr setMarkerText format ["antenna_%1", _marker];
            };
        } else {
            _marker setMarkerPos __OUTOFBOUNDS__;
            deleteVehicle _antenna;
            _groups apply {
                _group = _x;
                _veh = vehicle leader _group;
                crew _veh apply {_veh deleteVehicleCrew _x};
                deleteVehicle _veh;
                units _group apply {deleteVehicle _x};
                deleteGroup _group;
            };
        };
        sleep 1;
    }forEach btc_database_gaia_savedata;
    publicVariable "btc_database_gaia_antennas"; //for the Take Intel
};

if(BTC_DEBUG) then {["btc_fnc_database_gaia_init","managing data for btc_database_gaia_savedata"] call btc_fnc_logDebug;};
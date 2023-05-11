/* ----------------------------------------------------------------------------
Function: btc_fnc_database_crates_init

Description:
    Parses global var crates database.

Parameters:


Returns:

Examples:
    (begin example)
        [crate_1] call btc_fnc_database_crates_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
    ["_crates", [], [[objNull]]]
];
_crates sort true;

btc_database_crates_savedata = profileNamespace getVariable [format["btc_%1_crates_savedata",MISSION_SAVE_NAME], []];
btc_database_crates = _crates;

//Init crates database
if (profileNamespace getVariable [format["btc_%1_crates_savedata",MISSION_SAVE_NAME], []] isEqualTo []) then {
    private["_data"];
    _crates apply {
        _data = _x call btc_fnc_database_crates_get_data;
        btc_database_crates_savedata pushBack _data;
    };
};
profileNamespace setVariable [format["btc_%1_crates_savedata",MISSION_SAVE_NAME], btc_database_crates_savedata];

crates_database_inithandle = [] spawn {
    scriptName "btc_database_crates_inithandle";
    {
        //get save data
        _x params [
            ["_type", "B_supplyCrate_F"],
            ["_pos", [0,0,0]],
            ["_direction", 0],
            ["_isAttached", false],
            ["_cargo", []]
        ];

        //Set vehicle data
        _v = btc_database_crates param [_forEachIndex, objNull];
        _v setVariable ["btc_database_data", _x];
        _v setVariable ["btc_database_isPersistent", true];
        _v setDir _direction;
        [_v,_cargo] call btc_fnc_database_vehs_set_cargo;
        if(_isAttached) then {[_v,_pos] call btc_fnc_database_crates_addToAceCargo};

        //EventHandlers
        [_v,"btc_database_crate_remove"] call btc_fnc_database_add_EH;

        sleep 0.5;
    }forEach btc_database_crates_savedata;

    [] call btc_fnc_database_crates_EH;
};

if(BTC_DEBUG)then{
    [] spawn {
    scriptName "btc_database_crates_debug";
        waitUntil {sleep 10; scriptDone crates_database_inithandle};
        while {BTC_DEBUG} do {
            {
                if(alive _x) then {
                    _mkr = _x getVariable ["btc_database_marker", createMarker [format["database_crate_ID: %1", _forEachIndex], _x]];
                    _mkr setMarkerShape "ICON";
                    _mkr setMarkerType "hd_dot";
                    _mkr setMarkerText format ["database_crate_ID: %1", _forEachIndex];
                    _mkr setMarkerPos _x;
                    _x setVariable ["btc_database_marker", _mkr];
                    sleep 2;
                };
            }forEach btc_database_crates;
        };
    };
    ["btc_fnc_database_crates_init","managing data for btc_database_crates_savedata"] call btc_fnc_logDebug;
};

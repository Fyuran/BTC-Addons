/* ----------------------------------------------------------------------------
Function: btc_fnc_database_vehs_init

Description:
    Parses global var vehicles database.

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_vehs_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
    ["_vehs",[],[]]
];

_vehs = (entities  [["LandVehicle","Air"], [], false, true]) select {crew _x isEqualTo []}; //filter to empty vehicles only
btc_database_vehs_savedata = profileNamespace getVariable [format["btc_%1_vehs_savedata",MISSION_SAVE_NAME], []];
btc_database_vehs = [];

//Init vehicle database
if (profileNamespace getVariable [format["btc_%1_vehs_savedata",MISSION_SAVE_NAME], []] isEqualTo []) then {
    private["_data"];
    _vehs apply {
        //clearItemCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearMagazineCargoGlobal _x;
        _data = _x call btc_fnc_database_vehs_get_data;
        btc_database_vehs_savedata pushBack _data;
    };
};
profileNamespace setVariable [format["btc_%1_vehs_savedata",MISSION_SAVE_NAME], btc_database_vehs_savedata];
_vehs apply {deleteVehicle _x};

vehs_database_inithandle = [] spawn {
    scriptName "btc_database_vehs_inithandle";
    btc_database_vehs_savedata apply {
        //get save data
        _x params [
            ["_type", "C_Offroad_01_F"],
            ["_pos", [0,0,0]],
            ["_direction", 0],
            ["_saved_hitpoints", []],
            ["_fuel", 1],
            ["_magazines", []],
            ["_locked", false],
            ["_cargo", []],
            ["_skin", true],
            ["_texture", "#(rgb,8,8,3)color(0,0,0,1)"],
            ["_name", ""]
         ];

        //Set vehicle data
        _v = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
        btc_database_vehs pushBack _v;
        _v setVariable ["btc_database_data", _x];
        _v setVariable ["btc_database_isPersistent",true,true];
        _v setDir _direction;
        _v setFuel _fuel;
        _v lock _locked;
        if (_name != "") then {
            [_v, _name] remoteExecCall["setVehicleVarName", 0, _v];
            missionNamespace setVariable [_name, _v, true];
            _v setvariable ["#var", _name, true]; //BIS vanilla compatibility
        };
        [_v, _skin] call BIS_fnc_initVehicle;
        _v setObjectTextureGlobal [0, _texture];
        [_v, _magazines] call btc_fnc_database_vehs_set_magazines;
        [_v, _cargo] call btc_fnc_database_vehs_set_cargo;

        //setHitPointDamage
        _hitpoints = (getAllHitPointsDamage _v) param [0, []];
        {
            _v setHitPointDamage [_x, _saved_hitpoints select _forEachIndex];
        }forEach _hitpoints;

        //Event handlers
        [_v,"btc_database_veh_remove"] call btc_fnc_database_add_EH;

        sleep 0.5;
    };

    [] call btc_fnc_database_vehs_EH;
};

if(BTC_DEBUG)then{
    [] spawn {
        scriptName "btc_database_vehs_debug";
        waitUntil {sleep 10; scriptDone vehs_database_inithandle};
        while {BTC_DEBUG} do {
            {
                if(alive _x) then {
                    _mkr = _x getVariable ["btc_database_marker", createMarker [format["database_veh_ID: %1", _forEachIndex], _x]];
                    _mkr setMarkerShape "ICON";
                    _mkr setMarkerType "hd_dot";
                    _mkr setMarkerText format ["database_veh_ID: %1", _forEachIndex];
                    _mkr setMarkerPos _x;
                    _x setVariable ["btc_database_marker", _mkr];
                    sleep 2;
                };
            }forEach btc_database_vehs;
        };
    };
    ["btc_fnc_database_vehs_init","managing data for btc_database_vehs_savedata"] call btc_fnc_logDebug;
};
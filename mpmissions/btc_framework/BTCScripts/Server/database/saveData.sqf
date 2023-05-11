/* ----------------------------------------------------------------------------
Function: btc_fnc_database_saveData

Description:
    Saves Data if different, forced SPAWN

Parameters:


Returns:

Examples:
    (begin example)
        [] call btc_fnc_database_saveData;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
//VEHS
#define __TYPE__ 0
#define __POS__ 1
#define __DIR__ 2
#define __HITPOINTS__ 3
#define __FUEL__ 4
#define __MAGAZINES__ 5
#define __LOCKED__ 6
#define __CARGO__ 7
#define __SKIN__ 8
#define __TEXTURE__ 9
#define __NAME__ 10

//CRATES
#define __ISATTACHED__ 3
#define __CRATECARGO__ 4

params[
    ["_caller", objNull, [objNull]]
];

btc_database_saveData_handle = missionNamespace getVariable ["btc_database_saveData_handle", scriptNull];
if (!scriptDone btc_database_saveData_handle) then {
    if(!isNull _caller) then {["Database saving already in progress, on hold."] remoteExecCall ["hint", _caller]};
    if(BTC_DEBUG) then {["btc_fnc_database_saveData","queuing call"] call btc_fnc_logDebug};
};
[{scriptDone btc_database_saveData_handle}, {
    btc_database_saveData_handle = _this spawn {
        _time = CBA_missionTime;
        if(BTC_DEBUG) then {["btc_fnc_database_saveData","iteration STARTED"] call btc_fnc_logDebug};
        _delay = 0.1;
        if(!isNull _this) then {
            ["Saving Database..."] remoteExecCall ["hint", _this];
            _delay = 0;
        };
        btc_database_vehs apply {
            if(alive _x && {_x getVariable ["btc_database_isPersistent",false]}) then {
                _data = _x getVariable ["btc_database_data", []];
                _data params [
                    ["_type", "C_Offroad_01_F"],
                    ["_pos", [0,0,0]],
                    ["_direction", 0],
                    ["_saved_hitpoints", []],
                    ["_fuel", 1],
                    ["_magazines", []],
                    ["_locked", false],
                    ["_cargo", []],
                    ["_skin", true],
                    ["_texture", ""]
                 ];

                if !(((getAllHitPointsDamage _x) select 2) isEqualTo _saved_hitpoints) then {
                    _data set[__HITPOINTS__, (getAllHitPointsDamage _x) select 2];
                };
                sleep _delay;

                if ((_x distance _pos) > 5) then {
                    _data set[__POS__, getPos _x];
                    _data set[__DIR__, direction _x];
                };
                sleep _delay;

                if !((fuel _x) isEqualTo _fuel) then {
                    _data set[__FUEL__, fuel _x];
                };
                sleep _delay;

                _v_magazines = _x call btc_fnc_database_vehs_get_magazines;
                if !(_v_magazines isEqualTo _magazines) then {
                    _data set[__MAGAZINES__, _v_magazines];
                };
                sleep _delay;

                if !((locked _x) isEqualTo _locked) then {
                    _data set[__LOCKED__, locked _x];
                };
                sleep _delay;

                _v_cargo = _x call btc_fnc_database_vehs_get_cargo;
                if !(_v_cargo isEqualTo _cargo) then {
                    _data set[__CARGO__, _v_cargo];
                };
                sleep _delay;

                _v_texture = (getObjectTextures _x) select 0;
                if !(_v_texture isEqualTo _texture) then {
                    _data set[__TEXTURE__, _v_texture];
                };
                sleep _delay;
            };
        };
        btc_database_crates apply {
            if(alive _x) then {
                _data = _x getVariable ["btc_database_data", []];
                _data params [
                    ["_type", "B_supplyCrate_F"],
                    ["_pos", [0,0,0]],
                    ["_direction", 0],
                    ["_isAttached", false],
                    ["_cargo", []]
                 ];

                if ((_x distance _pos) > 5) then {
                    _data set[__POS__,getPos _x];
                    _data set[__DIR__,direction _x];
                };
                sleep _delay;
                _v_isAttached = !isNull attachedTo _x;
                if !(_v_isAttached isEqualTo _isAttached) then {
                    _data set[__ISATTACHED__,_v_isAttached];
                };
                sleep _delay;
                _v_cargo = _x call btc_fnc_database_vehs_get_cargo;
                if !(_v_cargo isEqualTo _cargo) then {
                    _data set[__CRATECARGO__,_v_cargo];
                };
                sleep _delay;
            };
        };
        if(BTC_DEBUG) then {["btc_fnc_database_saveData", format["iteration COMPLETED, time taken: %1", CBA_missionTime - _time]] call btc_fnc_logDebug};
        if(!isNull _this) then {["Database saved"] remoteExecCall ["hint", _this]};
    };
}, _caller] call CBA_fnc_waitUntilAndExecute;
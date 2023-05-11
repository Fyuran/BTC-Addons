/* ----------------------------------------------------------------------------
Function: btc_fnc_database_sectors_init

Description:
    Parses global var sectors database, EH is handled by sector triggers.

Parameters:


Returns:

Examples:
    (begin example)
        [sector_1] call btc_fnc_database_sectors_init;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __NOTCAPTURED false

if(!params[
   ["_sectors",[],[[objNull]]],
   ["_sectorsSettings",[],[[]]]
])exitWith{["btc_fnc_database_sectors_init", format["bad params %1", _this]] call btc_fnc_logDebug};
_sectors sort true;

if(count sectors != count _sectorsSettings) exitWith {["btc_fnc_database_sectors_init", "bad params COUNT"] call btc_fnc_logDebug};
if !(_sectors isEqualTypeAll objNull) exitWith {["btc_fnc_database_sectors_init", format["bad sector/s %1", _sectors]] call btc_fnc_logDebug};

btc_database_sectors_savedata = profileNamespace getVariable [format["btc_%1_sectors_savedata",MISSION_SAVE_NAME], []];

//Init sectors database
{_x setVariable ["btc_database_sector_id", _forEachIndex]}forEach _sectors;

if (profileNamespace getVariable [format["btc_%1_sectors_savedata",MISSION_SAVE_NAME], []] isEqualTo []) then {
    private["_data","_sector", "_EOSsettings"];
    {
        _sector = _sectors select _forEachIndex;
        _EOSsettings = [[vehicleVarName _sector]];
        _EOSsettings append _x;
        btc_database_sectors_savedata pushBack [[vehicleVarName _sector, __NOTCAPTURED], _EOSsettings];
    }forEach _sectorsSettings;
};
profileNamespace setVariable [format["btc_%1_sectors_savedata",MISSION_SAVE_NAME], btc_database_sectors_savedata];

sectors_database_inithandle = [] spawn {
    scriptName "btc_database_sectors_inithandle";
    btc_database_sectors_savedata apply {
        //get save data
        _x params [
            ["_triggerVars",[],[[]],2],
            ["_EOSsettings",[],[[]]]
        ];
        _triggerVars params [
            ["_name", ""],
            ["_isCaptured", false]
        ];

        _sector = missionNamespace getVariable _name; //retrieve editor placed trigger reference from name
        (triggerArea _sector) params ["_sizeA", "_sizeB", "_angle", "_isRectangle"];

        _hasPlayers = btc_database_players_savedata findIf { //security check in case players disconnect inside noncaptured zone
            _x select 0 inArea _sector;
        };
        if !(_hasPlayers isEqualTo -1) then {
            _id = _sector getVariable 'btc_database_sector_id';
            if !(((btc_database_sectors_savedata select _id) select 0) select 1) then { //if zone is not captured but has players inside set it to CAPTURED
                ((btc_database_sectors_savedata select _id) select 0) set [1,true];
                _isCaptured = true;
            };
        };

        if(BTC_DEBUG) then {
/*             _mkr1 = createMarker [format["%1_debug_zone",_name], _sector];
            _mkr1 setMarkerShape (["ELLIPSE","RECTANGLE"] select _isRectangle);
            _mkr1 setMarkerSize [_sizeA, _sizeB];
            _mkr1 setMarkerDir _angle;
            _mkr1 setMarkerColor (["ColorOPFOR","ColorGreen"] select _isCaptured); */
            _mkr = createMarker [format["%1_debug_text",_name], _sector];
            _mkr setMarkerShape "ICON";
            _mkr setMarkerType "hd_dot";
            _mkr setMarkerText format ["%1(isCaptured:%2)",_name,_isCaptured];
            _sector setVariable ["btc_database_sector_debug_mkr", _mkr];
            ["btc_fnc_database_sectors_init","managing data for %1", _sector] call btc_fnc_logDebug;
        };

        if(!_isCaptured) then {
            _sector setTriggerActivation ["ANYPLAYER", "PRESENT", false];
            private _actCond = "this && {
            _enemyGrpsInside = ((allGroups select {side _x isEqualTo BTC_ENEMY_SIDE}) apply {leader _x}) inAreaArray thisTrigger;
            _unitsInside = 0;
            _enemyGrpsInside apply {_unitsInside = _unitsInside + count units _x};
            _unitsInside <= 5;
            }";
            _sector setTriggerStatements [_actCond, "
            _id = thisTrigger getVariable 'btc_database_sector_id';
            ((btc_database_sectors_savedata select _id) select 0) set [1,true];
            if(BTC_DEBUG) then {
                _mkr =  thisTrigger getVariable 'btc_database_sector_debug_mkr';
                _mkr setMarkerText format ['%1(isCaptured:%2)',vehicleVarName thisTrigger,true];
            };
            deleteVehicle thisTrigger;
            ", ""];
            _mkr = createMarker [_name, _sector];
            _mkr setMarkerShape (["ELLIPSE","RECTANGLE"] select _isRectangle);
            _mkr setMarkerSize [_sizeA, _sizeB];
            _mkr setMarkerDir _angle;
            _EOSsettings call EOS_Spawn;
        } else {deleteVehicle _sector};
    };
    sleep 1;
};

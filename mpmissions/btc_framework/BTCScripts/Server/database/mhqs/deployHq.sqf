/* ----------------------------------------------------------------------------
Function: btc_fnc_database_mhqs_deployHq

Description:
    Deploys HQ

Parameters:


Returns:

Examples:
    (begin example)
        [cursorObject, west] call btc_fnc_database_mhqs_deployHq;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __PERSISTZONE_DIS 100

#define __OPFOR 0
#define __BLUFOR 1
#define __INDFOR 2

// OPFOR #(rgb,8,8,3)color(1,0,0,1)
// BLUFOR #(rgb,8,8,3)color(0,0,1,1)
// INDFOR #(rgb,8,8,3)color(0,1,0,1)
params [
    ["_target", objNull, [objNull]],
    ["_side", west, [east]]
];
private _sideID = _side call BIS_fnc_sideID;
if !(_sideID in [__OPFOR, __BLUFOR, __INDFOR]) exitWith {["btc_fnc_database_mhqs_deployHq: %1 cannot deploy HQs on %2", _side, _target] call btc_fnc_debugLog};
private _bannerInit = format ["this setObjectTextureGlobal [0,""%1""]", [
"#(rgb,8,8,3)color(0.8,0,0,1)", "#(rgb,8,8,3)color(0,0,0.8,1)", "#(rgb,8,8,3)color(0,0.8,0,1)"] select _sideID];
private _objs = [getPos _target, direction _target, [
    ["CamoNet_INDP_big_F",[-0.313965,-0.542969,-0.56438],180,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[3.3877,-0.342773,0.000217438],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[-3.39551,-0.395508,0.000213623],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[3.35205,2.74609,0.00021553],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[-3.43115,2.69336,0.000213623],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[3.41895,-3.48535,0.00021553],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[-3.36426,-3.53809,0.000213623],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[1.56201,-4.74512,-0.000988007],0,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[-1.57422,-4.7832,-0.000988007],0,1,0,[],"","",false,false],
    ["CargoNet_01_barrels_F",[2.04492,5.64063,-9.53674e-006],337.078,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[3.3374,5.90625,0.00021553],90,1,0,[],"","",false,false],
    ["Land_BagFence_Long_F",[-3.4458,5.85352,0.00021553],90,1,0,[],"","",false,false],
    ["Banner_01_F",[3.2915,7.51523,-1.33514e-005],0,1,0,[],"",_bannerInit,false,false]
]] call BIS_fnc_ObjectsMapper;

_target setVariable ["btc_database_MHQisActive", true, true];
_target setVariable ["btc_database_MHQobjs", _objs, true];
_target setVariable ["btc_database_MHQside", _side, true];
_target setVariable ["btc_database_MHQfuel", fuel _target, true];
[_target, 0] remoteExecCall ["setFuel", _target];

if (BTC_DEBUG) then {
    private _mkr = createMarker [format["database_mhq_zone_%1",_target], _target];
    _mkr setMarkerShape "ELLIPSE";
    _mkr setMarkerSize [__PERSISTZONE_DIS, __PERSISTZONE_DIS];
    _mkr setMarkerDir 0;
    _mkr setMarkerColor "ColorOrange";

    _target setVariable ["btc_database_zone_marker", _mkr];
};
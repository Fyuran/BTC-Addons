
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_drawIcon

Description:
Shows unit icons on map on each frame

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#define __ALPHA__ 1
private _units = (entities [["CAManBase", "Car", "Tank", "Boat_F", "Air", "StaticWeapon"], ["HeadlessClient_F"], true, true]);
private ["_text","_typeof"];
private _color = [0.4,0,0.5,__ALPHA__];

_units apply {
    _typeof = typeOf _x;
    _text = [_typeof,format ["(%1)",count crew _x]] joinString " ";
    _color = switch (side _x) do {
        case (west) : {[0,0.3,0.6,__ALPHA__]};
        case (east) : {[0.5,0,0,__ALPHA__]};
        case (independent) : {[0,0.5,0,__ALPHA__]};
        case (civilian) : {[0.4,0,0.5,__ALPHA__]};
        default {[0.7,0.6,0,__ALPHA__]};
    };

    if (isPlayer _x) then {
        _text = (driver vehicle _x) getVariable ["ACE_Name", "Player"];
    };

    if(isNull objectParent _x) then {
        (_this select 0) drawIcon [
            getText (configFile/"CfgVehicles"/ _typeof /"Icon"),
            _color ,
            getPosASLVisual _x,
            20,
            20,
            direction _x,
            _text,
            0,
            0.05
        ];
    };
};

/* ----------------------------------------------------------------------------
Function: btc_fnc_marker_debug

Description:
Simplified version of debug's marker debug function

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
private ["_units","_color","_text","_typeof","_alpha"];

private _units = allunits select {Alive _x};
private _alpha = 1;
private _color = [0,0,0,_alpha];
private _text = "";
private _typeof = "";
_units append entities "Car";
_units append entities "Tank";
_units append entities "Ship";
_units append entities "Air";

_units apply {
    _typeof = typeOf _x;

    switch (side _x) do {
        case (west) : {_color = [0,0,1,_alpha]};
        case (east) : {_color = [1,0,0,_alpha]};
        case (independent) : {_color = [0,1,0,_alpha]};
        default {_color = [1,1,1,_alpha]};
    };

    if (leader group _x isEqualTo _x) then {
        _text = format ([["%1", _typeof], ["%1", name _x]] select (_x in playableUnits));
    } else {
        if ((_x isKindOf "car") OR (_x isKindOf "tank") OR (_x isKindOf "ship")  OR (_x isKindOf "air")) then {
            _text = "";
            _color = [1,0,0.5,_alpha];
        } else {
            _text = format ["%1", _typeof];
        };
    };

    (_this select 0) drawIcon [
        getText (configFile/"CfgVehicles"/ _typeof /"Icon"),
        _color ,
        visiblePosition _x,
        20,
        20,
        direction _x,
        _text,
        0,
        0.05
    ];
};
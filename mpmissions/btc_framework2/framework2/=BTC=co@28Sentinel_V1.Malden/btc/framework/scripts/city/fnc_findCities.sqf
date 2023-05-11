
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_findCities

Description:
    Find cities all over the map and store those properties.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_framework_fnc_findCities;
    (end)

Author:
    Giallustio, Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
private _locations = configfile >> "cfgworlds" >> worldname >> "names";

private _cities = ["NameVillage", "NameCity", "NameCityCapital", "NameLocal", "Hill", "Airport"];

GVAR(city_all) = [];


for "_id" from 0 to (count _locations - 1) do {
    private _current = _locations select _id;

    private _type = getText (_current >> "type");

    if (_type in _cities) then {
        private _position = getArray (_current >> "position");
        if (surfaceIsWater _position) then {
            if !(_type isEqualTo "NameMarine") then {
                private _church = nearestTerrainObjects [_position, ["CHURCH"], 470];
                if (_church isEqualTo []) then {
                    private _area = 50;
                    for "_i" from 0 to 3 do {
                        private _new_position = [_position, 0, _area, 0.5, 0, -1, 0] call BIS_fnc_findSafePos;
                        if (count _new_position isEqualTo 2) exitWith {
                            _position = _new_position;
                        };
                        _area = _area * 2;
                    };
                } else {
                    _position = getPos (_church select 0);
                };
            };
        };
        private _name = getText(_current >> "name");
        private _radius_x = getNumber(_current >> "RadiusA");
        private _radius_y = getNumber(_current >> "RadiusB");

        if (GVAR(city_blacklist) findIf {_position inArea _x} >= 0) exitWith {};

        if (_radius_x < 80 || _radius_y < 80) then {
            _radius_x = 80;
            _radius_y = 80;
        };
        [_position, _type, _name, _radius_x, _radius_y, _id] call FUNC(createCity);
    };
};

//register module specific functions
[
	"\A3\Modules_F_Tacops\Ambient\CivilianPresence\Functions\",
	"bis_fnc_cp_",
	[
		"getQueueDelay",
		"main",
		"addThreat",
		"getSafespot"
	]
] call bis_fnc_loadFunctions;

#ifdef DEBUG_MODE_FULL
GVAR(city_all_pos) = GVAR(city_all) apply {[getPosATL _x, _x getVariable [QGVAR(name), "Location"]]};
publicVariable QGVAR(city_all_pos);
#endif

GVAR(city_blacklist) apply {_x setMarkerAlpha 0}; //hide markers
GVAR(civ_blacklist) apply {_x setMarkerAlpha 0};
GVAR(traffic_blacklist) apply {_x setMarkerAlpha 0};

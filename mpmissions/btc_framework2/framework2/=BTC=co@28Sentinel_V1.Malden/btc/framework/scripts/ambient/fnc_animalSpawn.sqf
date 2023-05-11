/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_animalsSpawn

Description:
	Spawn ambient life per player.

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_animalsSpawn;
    (end)

Author:
    Fyuran
---------------------------------------------------------------------------- */
#include "script_component.hpp"
GVAR(animalSpawner) = [{
	_players = [] call CBA_fnc_players;
	_player = selectRandom _players;
	_animals = missionNamespace getVariable [QGVAR(ambientAnimals), []];

	//Pick a random pos inside a 200m circle per animal
	if(_animals isEqualTo [] && {alive _player}) then {
		_player_pos = getPosATL _player;
		for "_i" from 0 to random [2,4,6] do {
			_pos = [_player_pos, 100] call CBA_fnc_randPos;
			_posASL = (AGLToASL _pos) vectorAdd [0,0,1.5];
			_seenBy = ([] call CBA_fnc_players) select {_x distance _pos < 5 || {(_x distance _pos < 50 && {([_x,"VIEW"] checkVisibility [eyePos _x, _posASL]) > 0.5})}};
			[{count (_this select 0) == 0}, {
				_type = selectRandom["Alsatian_Random_F","Sheep_random_F","Fin_random_F","Sheep_random_F","Goat_random_F","Sheep_random_F","Rabbit_F","Snake_vipera_random_F","Snake_random_F"];
				_unit = createAgent [_type, (_this select 2), [], 1, "NONE"];
				(_this select 1) pushBack _unit;
			}, [_seenBy, _animals, _pos]] call CBA_fnc_waitUntilAndExecute;
		};
		missionNamespace setVariable [QGVAR(ambientAnimals), _animals]; //server will hold a variable per player to find the group
		TRACE_3("animal spawn",count _animals,_player_pos,_player);

		//Frame-check that if the distance between the _player_pos and the reference player is bigger than 200, erase the group of animals
		[{((_this select 0) distance (_this select 1)) > 200},
		{
			params["_player","_player_pos","_animals"];
			_animals apply {deleteVehicle _x};
			missionNamespace setVariable [QGVAR(ambientAnimals), nil];
		},[_player,_player_pos,_animals]]call CBA_fnc_waitUntilAndExecute;

		#ifdef DEBUG_MODE_FULL
			missionNamespace setVariable [QGVAR(ambientAnimals_debug), _animals, true];
			if(getMarkerPos format[QGVAR(ambientAnimals_loc), _player] isEqualTo [0,0,0]) then { //horrid way to check if marker exists
				_marker = createMarker [format [QGVAR(ambientAnimals_loc), _player], _player_pos];
				_marker setMarkerShape "ELLIPSE";
				_marker setMarkerBrush "SolidBorder";
				_marker setMarkerSize [200,200];
				_marker setMarkerAlpha 0.2;
				_marker setMarkerColor "colorGreen";
				_marke = createMarker [format [QGVAR(ambientAnimals_locn), _player], _player_pos];
				_marke setMarkerType "mil_dot";
				_marke setMarkerText "animal spawn";
			}else {
				format [QGVAR(ambientAnimals_loc), _player] setMarkerPos _player_pos;
				format [QGVAR(ambientAnimals_locn), _player] setMarkerPos _player_pos;
			};
		#endif
	};
},60,[]] call CBA_fnc_addPerFrameHandler;
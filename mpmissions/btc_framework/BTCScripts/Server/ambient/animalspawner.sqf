
/* ----------------------------------------------------------------------------
Function: btc_fnc_ambient_animals_spawn

Description:
	Spawn ambient life per player.

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran
---------------------------------------------------------------------------- */
[{
	private _players = [switchableUnits - entities "HeadlessClient_F",playableUnits] select isMultiplayer;
	private _player = selectRandom _players;
	private _animals = missionNamespace getVariable ["btc_ambient_animals",[]];

	//Pick a random pos inside a 200m circle per animal
	if(_animals isEqualTo [] && {alive _player}) then {
		private _player_pos = getPosATL _player;
		for "_i" from 0 to random [2,4,6] do {
			private _type = selectRandom["Alsatian_Random_F","Sheep_random_F","Fin_random_F","Sheep_random_F","Goat_random_F","Sheep_random_F"];
			private _pos = [_player_pos, 50, 200, 1, 0] call BIS_fnc_findSafePos;
			private _unit = createAgent [_type, _pos, [], 1, "NONE"];
			_animals pushBack _unit;
		};
		missionNamespace setVariable ["btc_ambient_animals",_animals]; //server will hold a variable per player to find the group

		//Frame-check that if the distance between the _player_pos and the reference player is bigger than 200, erase the group of animals
		[{((_this select 0) distance (_this select 1)) > 200},
		{
			params["_player","_player_pos","_animals"];
			_animals apply {deleteVehicle _x};
			missionNamespace setVariable ["btc_ambient_animals",nil];
		},[_player,_player_pos,_animals]]call CBA_fnc_waitUntilAndExecute;

		if(BTC_DEBUG) then{

			if(getMarkerPos format["ambient_animals_loc%1",_player] isEqualTo [0,0,0]) then { //horrid way to check if marker exists
				private _marker = createMarker [format ["ambient_animals_loc%1", _player], _player_pos];
				_marker setMarkerShape "ELLIPSE";
				_marker setMarkerBrush "SolidBorder";
				_marker setMarkerSize [200,200];
				_marker setMarkerAlpha 0.2;
				_marker setMarkerColor "colorGreen";
				private _marke = createMarker [format ["ambient_animals_locn%1", _player], _player_pos];
				_marke setMarkerType "mil_dot";
				_marke setMarkerText "animal spawn";
			}else {
				format ["ambient_animals_loc%1", _player] setMarkerPos _player_pos;
				format ["ambient_animals_locn%1", _player] setMarkerPos _player_pos;
			};
			["btc_fnc_ambient_animals_spawn",format["%1 animals at %2 belonging to %3", count _animals, _player_pos, _player]] call btc_fnc_logDebug;
		};
	};
},60,[]] call CBA_fnc_addPerFrameHandler;
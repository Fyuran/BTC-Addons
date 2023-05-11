/* ----------------------------------------------------------------------------
Function: btc_fnc_database_players_initLocalPlayer

Description:
    Manages player data from database, function is executed locally as most of the needed functions are restricted to local

Parameters:


Returns:

Examples:
    (begin example)
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_data",[] ,[], 4]
];

[{!isNull player && {player == player} && {time > 5}}, {
	params [
		["_pos",[0,0,0],[[]]],
		["_dir",0,[0]],
		["_gear",[],[[]]]
	];
	_pos set [2,0]; //always at ground level
	player setPos _pos;
    player setDir _dir;
    player setUnitLoadout _gear;
	_items = assignedItems player + items player; //TFAR radio needs unique ID on pickup
	_radioI = _items findIf {isText(configFile >> "CfgWeapons" >> _x >> "tf_parent")};
	if(_radioI != -1) then {
		_radio = _items select _radioI;
		player unlinkItem _radio;
		player removeItem _radio
	};
    ["btc_fnc_database_players_initLocalPlayer", format["%1(%2) has been loaded from database.", player, steamProfileUrl]] call btc_fnc_logDebug;
}, _data] call CBA_fnc_waitUntilAndExecute;
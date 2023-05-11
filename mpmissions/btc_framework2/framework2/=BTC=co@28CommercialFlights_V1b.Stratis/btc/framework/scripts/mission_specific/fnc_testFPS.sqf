
/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_testFPS

Description:
    Inserts marker which holds fps and display it on the map

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_testFPS;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
params[
	["_world", "", [""]],
	["_pos", [], [[]], 3]
];
if !(isClass(configfile >> "CfgWorlds" >> _world)) exitWith {ERROR_WITH_TITLE_1("btc_framework_fnc_testFPS", "%1 does not exist", _world)};

0 cutText ["","BLACK FADED",1];
[{preloadCamera (_this select 1)}, {
	params[
		["_world", "", [""]],
		["_pos", [], [[]], 3],
		["_dir", 0, [0]],
		["_fov", 0, [0]],
		["_pitchBank", [0,0], [[]], 2]
	];
/* 	_keybind = ["[BTC] Framework", QGVAR(QuitFpsTest)] call CBA_fnc_getKeybind;
	_keybind = (_keybind#8 select 0) call CBA_fnc_localizeKey;
	[format["<t color='#ff0000' size = '.8'>Press %1 to Quit</t>", _keybind],-1, 1.3,4,1,0,[QGVAR(FPSLayer)] call BIS_fnc_rscLayer] spawn BIS_fnc_dynamicText; */
	_cam = "camera" camCreate _pos; 
	0 cutText ["","BLACK IN",1];
	player setVariable [QGVAR(FPSTestCamera), _cam];
	_cam cameraEffect ["INTERNAL", "BACK"];
	_cam SetDir _dir;
	[_cam, _pitchBank#0, _pitchBank#1] call BIS_fnc_setPitchBank; 
	_cam camSetFov _fov;
	_cam camCommit 5;
	_pos set[2,0];
	player allowDamage false;
	player setPos _pos;
	player setCaptive true;
	[player, true] remoteExecCall ["hideObjectGlobal", 2];
	player SetVariable [QGVAR(FPSTestOriginalPos), GetPosASL player];
	player setVariable [QGVAR(FPSTestOriginalViewDistance), viewDistance];
	player setVariable [QGVAR(FPSTestOriginalTerrainGrid), getTerrainGrid];
	player setVariable [QGVAR(FPSTestOriginalObjectDis), getObjectViewDistance];
	setViewDistance 3000;
	setTerrainGrid 12.5;
	setObjectViewDistance [1900,100];

	_time = CBA_missionTime;
	_handle = [{
		titleText[format["<t color='#ff0000' size = '2'>FPS:%1, TEST Duration %2/%3s</t>", round diag_fps, round(CBA_missionTime - (_args select 0)), _args select 1],"PLAIN DOWN", 0.1, false, true];
	}, 1, [_time, GVAR(FPSTestDelay)]] call CBA_fnc_addPerFrameHandler;

	[{
		[_this] call CBA_fnc_removePerFrameHandler;
		_original = player getVariable [QGVAR(FPSTestOriginalPos), [0,0,0]];
		player setPos _original;
		_original = player getVariable [QGVAR(FPSTestOriginalViewDistance), 3000];
		setViewDistance _original;
		_original = player getVariable [QGVAR(FPSTestOriginalTerrainGrid), 12.5];
		setTerrainGrid _original;
		_original = player getVariable [QGVAR(FPSTestOriginalObjectDis), [1900,100]];
		setObjectViewDistance _original;
		"end1" call BIS_fnc_endMission;
	}, _handle, GVAR(FPSTestDelay)] call CBA_fnc_waitAndExecute;
	
}, _this] call CBA_fnc_waitUntilAndExecute;


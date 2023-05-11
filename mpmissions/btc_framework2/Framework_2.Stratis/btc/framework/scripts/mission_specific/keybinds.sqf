
/* ----------------------------------------------------------------------------
Function: keybinds.sqf

Description:
    Adds keybinds to user settings

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
// #include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "script_component.hpp"
/* ["[BTC] Framework", QGVAR(QuitFpsTest), ["Quit Fps Test", "Allows you to quit the fps test camera"], {
    _cam = player getVariable [QGVAR(FPSTestCamera), objNull];
    if(isNull _cam) exitWith {};
    _cam CameraEffect ["Terminate","Back"];
    _cam CamCommit 0;
    CamDestroy _cam;
    _original = player getVariable [QGVAR(FPSTestOriginalPos), [0,0,0]];
    player setPos _original;
    _original = player getVariable [QGVAR(FPSTestOriginalViewDistance), 3000];
    setViewDistance _original;
	_original = player getVariable [QGVAR(FPSTestOriginalTerrainGrid), 12.5];
    setTerrainGrid _original;
	_original = player getVariable [QGVAR(FPSTestOriginalObjectDis), [1900,100]];
	setObjectViewDistance _original;
	
    player setCaptive false;
    [player, false] remoteExecCall ["hideObjectGlobal", 2];
}, {}, [0x39, [false, false, false]]] call CBA_fnc_addKeybind; //DIK_SPACE 0x39 */

["[BTC] Framework", QGVAR(SkipIntro), ["Skip intro", "Allows you to skip the intro"], {
    _cam = player getVariable [QGVAR(IntroCamera), objNull];
    if(isNull _cam) exitWith {};
    _cam CameraEffect ["Terminate","Back"];
    _cam CamCommit 0;
    CamDestroy _cam;
}, {}, [0x39, [false, false, false]]] call CBA_fnc_addKeybind;
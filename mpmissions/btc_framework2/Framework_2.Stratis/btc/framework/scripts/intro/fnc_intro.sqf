/* ----------------------------------------------------------------------------
Function: BTC_Intro

Description:
  Internal shot intro

Parameters:

Returns:

Examples:
    (begin example)
      BTC_intro_handle = [] spawn BTC_intro;
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if !(call CBA_fnc_isScheduled) exitWith {ERROR_WITH_TITLE("btc_framework_fnc_intro","current function scope is not spawned")};
private _camcoord = getMarkerPos "camstart";
if (_camcoord isEqualTo [0,0,0]) exitWith {ERROR_WITH_TITLE_1("btc_framework_fnc_intro","bad _camcoord or nonexistant: %1", _camcoord)};
enableEnvironment false;
private _altitude = 600;
_camcoord set [2, _altitude];

0 cutText ["","BLACK FADED",1];

private _cam = "camera" CamCreate _camcoord;
player setVariable [QGVAR(IntroCamera), _cam];
_cam camPreload 0;
waitUntil {camPreloaded _cam && {time > 1}};
playSound QGVAR(intro_song);

[] spawn {
  _first_text = "<t size=3><br/><br/>= Black Templars Clan =<br/><br/></t>" + format["<t size=2>%1<br/><br/></t>",GVAR(MISSION_NAME)] + "<t>LordMac &amp; Fyuran</t>";
  0 cutText ["","BLACK IN",1];
  1 cutText [_first_text,"PLAIN",5,false,true];
  1 cutFadeOut 1;
  2 cutRsc ["btc_intro", "PLAIN", 5, false];
  sleep 10;
  [
    parseText
    (
      "<t size=2 align='center' shadow = '1'>Stratis  |  Greek Archipelago</t>"
    ),  
    [0,0.5,1,1], 10, 3, [2,2], 0
  ] spawn BIS_fnc_textTiles; //[content, position, tileSize, duration, fadeInOutTime, tileTransparency]
  //3 cutText ["", "PLAIN",5, false, true];
  //3 cutFadeOut 1;
  10 fadesound 0.9;
  sleep 5;
  2 cutFadeOut 5;
};

_cam CameraEffect ["Internal","Back"];
_player = vehicle player;
_cam camSetTarget _player;

_camDis = _camcoord getPos [(_cam distance _player)/2, _cam getDir _player];
_camDis set [2, _altitude/2];
_time = time;
waitUntil {
  _progress = linearConversion [0, 20, time - _time, 0, 1, false];
  _cam camSetPos (_progress bezierInterpolation [_camcoord, _camDis, getPosVisual _player]);
  _cam camCommit 1;
  _cam distance _player <= 5
};
_cam CameraEffect ["Terminate","Back"];
CamDestroy _cam;
enableEnvironment true;
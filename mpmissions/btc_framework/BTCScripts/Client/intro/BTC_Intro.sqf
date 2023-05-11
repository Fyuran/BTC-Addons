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
enableEnvironment false;
private _camcoord = getMarkerPos "camstart";
if (_camcoord isEqualTo [0,0,0]) exitWith {["BTC_intro: marker 'camstart' missing or in bad pos(%1)",_camcoord] call BIS_fnc_error};
"camstart" setMarkerAlphaLocal 0;
private _altitude = 800;
_camcoord set [2, _altitude];

0 cutText ["","BLACK FADED",1];

private _cam = "camera" CamCreate _camcoord;
CAMERA = _cam;
_cam camPreload 0;
waitUntil {camPreloaded _cam && {time > 1}};
playSound "bhd";

[] spawn {
  private _first_text = "<t size=3><br/><br/>= Black Templars Clan =<br/><br/></t>" + format["<t size=2>%1<br/><br/></t>",MISSION_NAME] + "<t>LordMac &amp; Fyuran</t>";
  0 cutText ["","BLACK IN",1];
  1 cutText [_first_text,"PLAIN",5,false,true];
  1 cutFadeOut 1;
  2 cutRsc ["btc_intro", "PLAIN", 5, false];
  sleep 10;
  3 cutText ["<t size=2>Malden  |  Greek islands</t>", "PLAIN",5, false, true];
  3 cutFadeOut 1;
  10 fadesound 0.9;
  sleep 5;
  2 cutFadeOut 5;
};

_cam CameraEffect ["Internal","Back"];
private _player = vehicle player;
_cam camSetTarget _player;

private _camDis = _camcoord getPos [(_cam distance _player)/2, _cam getDir _player];
_camDis set [2, _altitude/2];
private _time = time;
waitUntil {
  _progress = linearConversion [0, 20, time - _time, 0, 1, false];
  _cam camSetPos (_progress bezierInterpolation [_camcoord, _camDis, getPos _player]);
  _cam camCommit 1;
  if(BTC_DEBUG) then { ["BTC_INTRO", format["Camera distance: %1, time: %2, progress: %3", _cam distance _player, _time, _progress]] call btc_fnc_logDebug};
  _cam distance _player <= 5
};
_cam CameraEffect ["Terminate","Back"];
CamDestroy _cam;
enableEnvironment true;
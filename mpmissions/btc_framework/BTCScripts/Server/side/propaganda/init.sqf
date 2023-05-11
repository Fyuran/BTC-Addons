/* ----------------------------------------------------------------------------
Function: btc_fnc_side_propaganda

Description:
    Passed objects are prepared for sound PFH and hit PFH

Parameters:
    _objs : ARRAY of OBJECT

Returns:

Examples:
    (begin example)
        [[speaker_1]] call btc_fnc_side_propaganda;
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
if(!params[
	["_speakers", [], [[objNull]]]
]) exitWith {};

btc_propaganda_speakers = _speakers;

btc_propaganda_speakers apply {
	_eh1 = _x addEventHandler ["HandleDamage", {
		params ["_unit"];
		_index = btc_propaganda_speakers findIf {_x isEqualTo _unit};
		if(_index != -1) then {
			btc_propaganda_speakers deleteAt _index;
			_targets = _unit nearEntities ["CAManBase", 1000];
			_targets apply {
				if(isPlayer _x) then {
					[_unit, "btc_side_propaganda_feedback", 1000, 4] remoteExecCall ["btc_fnc_forceSay3D", _x];
				};
			};
			["btc_fnc_side_propaganda", format["%1(%2) has been damaged", _unit, getPosASL _unit]] call btc_fnc_logDebug;
		};
		_unit removeEventHandler ["HandleDamage", _thisEventHandler];
	}];
	if (BTC_DEBUG) then {
		_mkr = createMarker [format["btc_propaganda_loudspeaker_%1", _x], _x];
		_mkr setMarkerType "mil_dot";
		_mkr setMarkerText format["btc_propaganda_%1", vehicleVarName _x];
	};
};

private _soundHandle = [{
	btc_propaganda_speakers apply {
		_speaker = _x;
		_targets = _speaker nearEntities ["CAManBase", 1000];
		if !(_targets isEqualTo []) then {
			_targets apply {
				if(isPlayer _x) then {
					[_speaker, "btc_side_propaganda", 1000, 65] remoteExecCall ["btc_fnc_forceSay3D", _x];
					if(BTC_DEBUG) then {["btc_fnc_side_propaganda", format["btc_side_propaganda played to %1", _speaker]] call btc_fnc_logDebug};
				};
			};
		};
	};
	if (btc_propaganda_speakers isEqualTo []) then {[_handle] call CBA_fnc_removePerFrameHandler};
}, [600,80] select BTC_DEBUG, []] call CBA_fnc_addPerFrameHandler;
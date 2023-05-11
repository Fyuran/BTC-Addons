/* ----------------------------------------------------------------------------
Function: btc_fnc_side_incognito_jailbreakcheck

Description:
    Sets the player object to incognito status by applying captive status and adds EH to reapply on respawn
Parameters:

Returns:

Examples:
    (begin example)
        [thisList,thisTrigger] call btc_fnc_side_incognito_jailbreakcheck;
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_thisList",[],[[]]],
	["_thisTrigger",objNull,[objNull]]
];
if(_thisTrigger isEqualTo objNull) exitWith {["btc_fnc_side_incognito_jailbreakcheck", format["bad params %1",_this]] call btc_fnc_logDebug};

private _prisoners = _thisTrigger getVariable ["side_incognito_prisoners",[]];
_thisTrigger setVariable ["side_incognito_prisoners",_prisoners];
if(BTC_DEBUG) then {_thisTrigger setVariable ["side_incognito_ThisList",_thisList]};

if (count _thisList != count _prisoners) then {
	_thisList apply {
		if !(_x in _prisoners) then {_prisoners pushBackUnique _x};
	};
	{
		if !(_x in _thisList) then {
			[_x,false] remoteExecCall ["setCaptive",_x];
			_prisoners deleteAt _forEachIndex;
		};
	}forEach _prisoners;
};
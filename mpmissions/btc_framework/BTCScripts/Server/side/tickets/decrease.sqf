/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tickets_decrease

Description:
    Decreases ticket by X amount
Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_side_tickets_decrease
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_side", sideEmpty, [west]],
	["_amount", 1, [0]]
];
call {
	if(_side == opfor) exitWith {
		SIDE_OPFOR_TICKETS = SIDE_OPFOR_TICKETS - _amount;
		publicVariable "SIDE_OPFOR_TICKETS";
	};
	if(_side == blufor) exitWith {
		SIDE_BLUFOR_TICKETS = SIDE_BLUFOR_TICKETS - _amount;
		publicVariable "SIDE_BLUFOR_TICKETS";
	};
	if(_side == independent) exitWith {
		SIDE_INDFOR_TICKETS = SIDE_INDFOR_TICKETS - _amount;
		publicVariable "SIDE_INDFOR_TICKETS";
	};
	["btc_fnc_side_tickets_decrease", format["invalid side param %1", _side]] call btc_fnc_logDebug
};
if(BTC_DEBUG) then {["btc_fnc_side_tickets_decrease", format["%1 tickets decreased by %2", _side, _amount]] call btc_fnc_logDebug};

if(SIDE_OPFOR_TICKETS <= 0) exitWith {"opforVictory" call BIS_fnc_endMissionServer};
if(SIDE_BLUFOR_TICKETS <= 0) exitWith {"bluforVictory" call BIS_fnc_endMissionServer};
if(SIDE_INDFOR_TICKETS <= 0) exitWith {"indforVictory" call BIS_fnc_endMissionServer};



/* ----------------------------------------------------------------------------
Function: btc_EXT_ied_fnc_checkLoop

Description:
    Loop over IED and check if player is around. If yes, trigger the explosion.

Parameters:
    _obj - City where IED has been created. [Object]
    _ieds - All IED (even FACK IED). [Array]
    _ieds_check - Real IED triggering the explosion. [Array]

Returns:

Examples:
    (begin example)
       [_obj, _ieds, _ieds_check] call btc_ied_fnc_checkLoop;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */
if (btc_debug || btc_debug_log) then {
    [format ["Handling btc_ied_list checkLoop"] , __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
};

[{
    if (btc_ied_list isNotEqualTo []) then {
        {
            _ied_index = _forEachIndex;
            _x params ["_ied", "_wreck", "_pos"];

            if (!isNull _ied && {alive _ied}) then {
                {
                    if (side _x isEqualTo btc_player_side && {
                        (
                            _x isKindOf "UGV_02_Base_F" &&
                            {speed _x > 10}
                        ) ||
                        !(_x isKindOf "UGV_02_Base_F") && {
                            driver _x != _x ||
                            speed _x > 5
                        }
                    }) then {
                        [_wreck, _ied] call btc_EXT_ied_fnc_boom;
                        [format ["Blowing Shit up at %1", getPosASL _ied] , __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
                        btc_ied_list deleteAt _ied_index;
                    };
                } forEach (_ied nearEntities ["allVehicles", btc_ied_range]);
            } else {
                btc_ied_list deleteAt _ied_index;
                deleteVehicle _wreck;
            };
        } forEach btc_ied_list;
    };
}, 1] call CBA_fnc_addPerFrameHandler;

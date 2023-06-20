
/* ----------------------------------------------------------------------------
Function: btc_ied_fnc_fired_near

Description:
    This check if bullets/grenade are trow around IED created during the mission and trigger them.

Parameters:
    _ied_list - List of IED created in any city. [Array]

Returns:
    _PFH_id - Id of the CBA_fnc_addPerFrameHandler. [Number]

Examples:
    (begin example)
        _PFH_id = [btc_ied_list] call btc_ied_fnc_fired_near;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

private _cfgAmmo = configFile >> "cfgAmmo";
if (btc_debug || btc_debug_log) then {
    [format ["Handling btc_ied_list firedNear"] , __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
};

[{
    params ["_args", "_id"];
    _args params [
        ["_cfgAmmo", configNull, [configNull]],
        ["_detected_grenade", [], [[]]]
    ];

    {
        _x params ["_ied", "_wreck", "_pos"];

        if (alive _ied && !isNull _ied) then {
            private _list = _pos nearObjects ["Default", 2];
            _list = _list select {
                private _object = _x;
                _object != _ied &&
                {(["SmokeShell", "FlareCore", "IRStrobeBase", "GrenadeHand_stone", "Smoke_120mm_AMOS_White", "TMR_R_DG32V_F"] findIf {_object isKindOf _x} isEqualTo -1)}
            };
            {
                private _bullet = _x;
                private _bullet_type = typeOf _bullet;
                if (["TimeBombCore", "BombCore", "Grenade"] findIf {_bullet isKindOf _x} != -1) then {
                    if !(_bullet in _detected_grenade) then {
                        _detected_grenade pushBack _bullet;
                        [{!alive (_this select 2)}, {
                            params ["_wreck", "_ied", "_bullet", "_detected_grenade", "_bullet_type"];

                            if (alive _ied) then {
                                [_wreck, _ied] call btc_EXT_ied_fnc_boom;
                                if (btc_debug || btc_debug_log) then {
                                    [format ["TRIGGERING btc_ied_list firedNear due to %1", 
                                        _bullet_type] , __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
                                };
                            };
                            {
                                if (isNull _x) then {
                                    _detected_grenade deleteAt _forEachIndex;
                                };
                            } forEach _detected_grenade;
                        }, [_wreck, _ied, _bullet, _detected_grenade, _bullet_type]] call CBA_fnc_waitUntilAndExecute;
                    };
                } else {
                    private _explosive = getNumber (_cfgAmmo >> _bullet_type >> "explosive") > 0;
                    private _caliber = getNumber (_cfgAmmo >> _bullet_type >> "caliber") > 1.6;
                    if (_explosive || _caliber) then {
                        if (alive _ied) then {
                            if (btc_debug || btc_debug_log) then {
                                [format ["TRIGGERING btc_ied_list firedNear due to %1, with caliber %2", 
                                    _bullet_type, getNumber (_cfgAmmo >> _bullet_type >> "caliber")] , __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
                            };
                            [_wreck, _ied] call btc_EXT_ied_fnc_boom;
                        };
                    };
                };
            } forEach _list;
        } else {
            btc_ied_list deleteAt _forEachIndex;
        };
    } forEach btc_ied_list;
}, 0.01, [_cfgAmmo, []]] call CBA_fnc_addPerFrameHandler;

/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tickets_zone

Description:
    Manages Killzone
Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_side_tickets_zone
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */

_this spawn {
	sleep random 10;
	_this setVariable ["tickets_death",true,true];
	_pos = AGLToASL(_this getPos [100, direction _this]);
	sleep 5;
	playSound3D ["a3\sounds_f\weapons\Explosion\supersonic_crack_close.wss", objNull, false, getPosASL _this, 5, 1, 1000];
	_this setDamage 1;
	sleep 0.5;
	playSound3D ["a3\sounds_f\weapons\GM6Lynx\gm6_st_1c.wss", objNull, false, _pos, 5, 1.5, 1000];
};
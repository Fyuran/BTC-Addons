/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tankastic_decreaseLife

Description:
    Creates vehicle on position and decreases spawn count
Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_side_tankastic_decreaseLife
     (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
params[
	["_index",0,[0]],
	["_side",0,[0]] //0 is west, 1 is east
];

private _side_lives = (BTC_TANKASTIC_LIVES select _side);
private _life = _side_lives select _index;
_side_lives set [_index,_life - 1];
publicVariable "BTC_TANKASTIC_LIVES";

/* ----------------------------------------------------------------------------
Function: btc_framework_fnc_thunderStorm

Description:
    Random thunder bolts near pos

Parameters:

Returns:

Examples:
    (begin example)
		[] call btc_framework_fnc_thunderStorm;
    (end)

Public: No

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
params [ 
   ["_pos", position player, [[]]], 
   ["_radius", 300, [0]], 
   ["_dir", random 360, [0]] 
  ]; 
    _pos = _pos getPos [_radius, _dir]; 
    _bolt = createVehicle ["LightningBolt", _pos, [], 0, "CAN_COLLIDE"]; 
    _bolt setPosATL _pos; 
    _bolt setDamage 1; 

    _light = "#lightpoint" createVehiclelocal _pos; 
    _light setPosATL (_pos vectorAdd [0,0,10]); 
    _light setLightDayLight true; 
    _light setLightBrightness 300; 
    _light setLightAmbient [0.05, 0.05, 0.1]; 
    _light setlightcolor [1, 1, 2]; 

    sleep 0.1; 
    _light setLightBrightness 0; 
    sleep (random 0.1); 

    _lightning = (selectRandom ["lightning1_F","lightning2_F"]) createVehiclelocal [0,0,0]; 
    _lightning setdir _dir; 
    _lightning setpos _pos; 

    for "_i" from 0 to (3 + random 1) do { 
        _time = CBA_missionTime + 0.1; 
        _light setLightBrightness (100 + random 100); 
        waituntil { 
            CBA_missionTime > _time 
        }; 
    }; 

    deletevehicle _lightning; 
    deletevehicle _light;

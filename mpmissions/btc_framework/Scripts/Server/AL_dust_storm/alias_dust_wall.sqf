// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons
// [[[],"AL_storm\alias_dust_wall.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

private ["_sursa_storm","_fum_negru"];

if (!hasInterface) exitWith {};

_sursa_storm			= _this select 0;
_duration_duststorm_w	= _this select 1;

_dir_xx = 0;
_dir_yy = 0;

// fum negru
_fum_negru = "#particlesource" createVehicleLocal getPosATL _sursa_storm;
_fum_negru setParticleCircle [60,[0.2, -0.5, 20]];
_fum_negru setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_fum_negru setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 9, [_dir_xx, _dir_yy*1.5, 0], [_dir_xx*100,_dir_yy*100, 10], 45, 20, 13, 0.00001, [35, 25, 50,70], [[0, 0, 0, 0.5], [0.3, 0.2, 0.1, 1], [0.9, 0.75, 0.6, 0.8], [0, 0, 0, 0]], [0.08], 0.1, 3, "", "", _sursa_storm];
_fum_negru setDropInterval 0.01;

sleep _duration_duststorm_w;

deleteVehicle _fum_negru;
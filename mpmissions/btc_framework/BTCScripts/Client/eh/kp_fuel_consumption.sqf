
/* ----------------------------------------------------------------------------
Function: kp_fuel_consumption

Description:
    This script handles the fuel consumption of vehicles, so that refueling will be necessary more often.

Parameters:
    _veh - [Object]

Returns:

Examples:
    (begin example)
        player addEventHandler ["GetInMan", {[ _this select 2] execVM "scripts\kp_fuel_consumption.sqf";}];
    (end)

Author:
    Wyqer www.killahpotatoes.de

---------------------------------------------------------------------------- */

if(!params [
	["_veh",objNull,[objNull]]
]) exitWith {["kp_fuel_consumption", format["bad params, %1",_this]] call btc_fnc_logDebug};

// Time in Minutes till a full tank depletes when the vehicle is standing with running engine
private _kp_neutral_consumption = 180;
// Time in Minutes till a full tank depletes when the vehicle is driving
private _kp_normal_consumption = 60;
// Time in Minutes till a full tank depletes when the vehicle is driving at max speed
private _kp_max_consumption = 40;

if (isNil "kp_fuel_consumption_vehicles") then {
	kp_fuel_consumption_vehicles = [];
};

if(BTC_DEBUG) then {
	["kp_fuel_consumption",format["called on %1 of player:%2",_veh, player]] call btc_fnc_logDebug;
};

if (!(_veh in kp_fuel_consumption_vehicles)) then {
	kp_fuel_consumption_vehicles pushBack _veh;
	while {driver _veh isEqualTo player} do {
		if (isEngineOn _veh) then {
			if (speed _veh > 5) then {
				if (speed _veh > (getNumber (configFile >> "CfgVehicles" >> typeOf _veh >> "maxSpeed") * 0.9)) then {
					_veh setFuel (fuel _veh - (1 / (_kp_max_consumption * 60)));
				} else {
					_veh setFuel (fuel _veh - (1 / (_kp_normal_consumption * 60)));
				};
			} else {
				_veh setFuel (fuel _veh - (1 / (_kp_neutral_consumption * 60)));
			};
		};
		sleep 1;
	};
	kp_fuel_consumption_vehicles deleteAt (kp_fuel_consumption_vehicles find _veh);
};
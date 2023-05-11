/* ----------------------------------------------------------------------------
Function: init_server.sqf

Description:

Parameters:


Returns:


Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */
// DATE  ************************************************************************************************************************************************
if (BTC_DATE != 0) then {
	//syntax: setDate [year, month, day, hour, minute]  06:00 / 12:00 / 00:00 fullmoon
	setDate [2019, 8, 27, BTC_DATE, 0];
	if(BTC_DEBUG) then{["BTC_DATE",format["setting Date to [2019, 8, 27, %1, 0]", BTC_DATE]] call btc_fnc_logDebug};
} else {
	setDate [2019, 8, 12, BTC_DATE, 0];       // 00:00 no moon
	if(BTC_DEBUG) then{["BTC_DATE", format["setting Date to [2019, 8, 12, %1, 0]", BTC_DATE]] call btc_fnc_logDebug};
};

// TIME ACCELERATION ************************************************************************************************************************************************
if(BTC_DEBUG) then{["BTC_TIMEACC", format["setting timeMultiplier to %1", BTC_TIMEACC]] call btc_fnc_logDebug};
setTimeMultiplier BTC_TIMEACC;

// SHORTER NIGHTS ************************************************************************************************************************************************
if(BTC_SHORTER_NIGHTS) then {
	private _AccFactDay = timeMultiplier;
	BTC_SHORTER_NIGHTS_handle = [{
		if ( daytime >= 21 || {daytime <= 3}) then {
			_AccFactNight = _args * 3;
			setTimeMultiplier _AccFactNight;
			if(BTC_DEBUG) then{["BTC_SHORTER_NIGHTS", format["Night timeMultiplier check, it's %2(%1*3)",_args, _AccFactNight]] call btc_fnc_logDebug};
		}else{
			setTimeMultiplier _args;
			if(BTC_DEBUG) then{["BTC_SHORTER_NIGHTS", format["Day timeMultiplier check, it's %1", _args]] call btc_fnc_logDebug};
		};
	}, 300, _AccFactDay] call CBA_fnc_addPerFrameHandler; //check the hour every x seconds(default: 300), change to your liking.
};

// BTC ANIMALS ********************************************************************************************************************************************
if (BTC_ANIMALS) then {
	BTC_ANIMALS_handle = [] call btc_fnc_ambient_animals_spawn;
};

// DUST STORM  *********************************************************************************************************************************************
if (BTC_DUSTSTORM) then {
	BTC_DUSTSTORM_handle = [] spawn {
		while {true} do {
			my_dust_storm_duration = 240 + random 600;
			publicVariable "my_dust_storm_duration";
			pause_between_dust_storm = 2400 + random 600;
			publicVariable "my_dust_storm_duration";
			waitUntil {(!isNil "my_dust_storm_duration") and (!isNil "pause_between_dust_storm")};
			sleep (pause_between_dust_storm);
			[340,my_dust_storm_duration,false,true,false] spawn AL_fnc_duststorm;
			sleep (my_dust_storm_duration + pause_between_dust_storm);
		};
	};
};

// ENGIMA- Civilians + Traffic **************************************************************************************************************
[] call compile preprocessFileLineNumbers "Scripts\Server\Engima\Civilians\Init.sqf";
[] call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\Init.sqf";

// EOS ***************************************************************************************************************************************************
[] call compile preprocessFileLineNumbers "Scripts\Server\EOS\OpenMe.sqf";

//FPS- MARKERS ***************************************************************************************************************************************************
call compile preprocessFileLineNumbers "BTCScripts\Server\common\show_fps_init.sqf";

// Find military buildings ***************************************************************************************************************************************************
if(BTC_DEBUG) then {[] call compile preprocessFileLineNumbers "BTCScripts\Server\common\findMilitaryBuildings.sqf"};

//SM- BTC MISSION SIDE SETUP ***************************************************************************************************************************************************
if(BTC_SIDEMISSIONS) then {
	[] call compile preprocessFileLineNumbers "BTCScripts\Server\side\btc_MissionSetup.sqf";
};

//FlyBy ***************************************************************************************************************************************************
if(BTC_FLYBY) then {
	[] call compile preprocessFileLineNumbers "BTCScripts\Server\ambient\FlyBy.sqf";
};
//GAIA ***************************************************************************************************************************************************
[] call compile preprocessfile "Scripts\Server\Gaia\gaia_init.sqf";

//P- Persistence ***************************************************************************************************************************************************
if(BTC_PERSISTENCE) then {[] call compile preprocessfile "BTCScripts\Server\database\init.sqf"};
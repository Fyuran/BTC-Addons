#ifdef DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#else
#undef DISABLE_COMPILE_CACHE
#endif

//EVERYONE
	//VCOM
	#include "extScripts\Vcom\compile.sqf"
	
//SERVER
if (isServer) then {
	//GENERIC
	PREP(generic,getRoadDirection);
	PREP(generic,getRoadWidth);
	PREP(generic,findPosOutsideRock);

	//AMBIENT
	PREP(ambient,animalSpawn);
	PREP(ambient,flyBy);

	//CITY
	PREP(city,findCities);
	PREP(city,createCity);
	PREP(city,activateCity);
	PREP(city,deactivateCity);

	//CIVILIANS
	PREP(civilians,createCivModule);
	PREP(civilians,destroyCivModule);
	PREP(civilians,manageCivSpawn);
	PREP(civilians,createCivAgent);

	//TRAFFIC
	PREP(traffic,createTrafficModule);
	PREP(traffic,destroyTrafficModule);
	PREP(traffic,manageTrafficSpawn);
	PREP(traffic,createTrafficAgent);

	//ENEMIES
	PREP(enemies,setEnTrgs);
	PREP(enemies,createEnModule);
	PREP(enemies,createEnHouse);
	PREP(enemies,createEnPatrol);
	PREP(enemies,createEnVeh);
	PREP(enemies,manageEnSpawn);
	PREP(enemies,manageEnDespawn);
	PREP(enemies,getEnGroupData);
	PREP(enemies,spawnEnGroupData);
	[QPATHTOF(scripts\enemies\CBA_fnc_taskPatrol_ground.sqf), QUOTE(CBA_fnc_taskPatrol_ground)] call CBA_fnc_compileFunction;
	[QPATHTOF(scripts\enemies\CBA_fnc_taskPatrol_water.sqf), QUOTE(CBA_fnc_taskPatrol_water)] call CBA_fnc_compileFunction;
	[QPATHTOF(scripts\enemies\CBA_fnc_waypointGarrison.sqf), QUOTE(CBA_fnc_waypointGarrison)] call CBA_fnc_compileFunction;
	btc_framework_fnc_test = compileFinal preprocessFileLineNumbers QPATHTOF(test.sqf);
};

//SERVER AND HEADLESS
if (isServer OR (!isDedicated && !hasInterface)) then {
	//GENERIC
	PREP(generic,showFPS);
	PREP(generic,showFPSInit);
};

//CLIENT
if (!isDedicated && hasInterface) then {
	//GENERIC
	PREP(generic,BIS_to_ACE);
	PREP(generic,forceSay3D);
	PREP(intro,intro);
	PREP(generic,drawIcon);
	#ifdef DEBUG_MODE_FULL
	PREP(generic,draw3Ds);
	#endif
	//MISSION SPECIFIC
	PREP(mission_specific,testFPS);
	PREP(mission_specific,burnObject); //Commercial_Flight
};
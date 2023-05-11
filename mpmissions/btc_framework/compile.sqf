/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then {
	//AMBIENT
	AL_fnc_duststorm = compileFinal preprocessFileLineNumbers "Scripts\Server\AL_dust_storm\AL_duststorm.sqf";
	btc_fnc_ambient_animals_spawn = compileFinal preprocessFileLineNumbers "BTCScripts\Server\ambient\animalspawner.sqf";

	//DATABASE
	btc_fnc_database_add_EH = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\add_EH.sqf";
	btc_fnc_database_remove_EH = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\remove_EH.sqf";
	btc_fnc_database_dataCheck = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\dataCheck.sqf";
	btc_fnc_database_clear = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\clear.sqf";
	btc_fnc_database_saveData = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\saveData.sqf";
		//VEHICLES
		btc_fnc_database_vehs_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\init.sqf";
		btc_fnc_database_vehs_EH = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\EH.sqf";
		btc_fnc_database_vehs_get_data = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\get_data.sqf";
		btc_fnc_database_vehs_get_magazines = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\get_magazines.sqf";
		btc_fnc_database_vehs_set_magazines = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\set_magazines.sqf";
		btc_fnc_database_vehs_get_cargo = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\get_cargo.sqf";
		btc_fnc_database_vehs_set_cargo = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\vehicles\set_cargo.sqf";

		//PLAYERS
		btc_fnc_database_players_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\players\init.sqf";
		btc_fnc_database_players_get_data = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\players\get_data.sqf";
		btc_fnc_database_players_EH = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\players\EH.sqf";

		//CRATES
		btc_fnc_database_crates_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\crates\init.sqf";
		btc_fnc_database_crates_EH = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\crates\EH.sqf";
		btc_fnc_database_crates_get_data = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\crates\get_data.sqf";
		btc_fnc_database_crates_addToAceCargo = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\crates\addToAceCargo.sqf";

		//SECTORS
		btc_fnc_database_sectors_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\sectors\init.sqf";

		//GAIA
		btc_fnc_database_gaia_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\gaia\init.sqf";

		//MOBILE HQs
		btc_fnc_database_mhqs_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\mhqs\init.sqf";
		btc_fnc_database_mhqs_deployHq = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\mhqs\deployHq.sqf";
		btc_fnc_database_mhqs_undeployHq = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\mhqs\undeployHq.sqf";

		//SHOP
		btc_fnc_database_shop_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\shop\init.sqf";
		//[] call compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\shop\initPriceTable.sqf";


	//SIDE
	btc_fnc_side_c4booby_setObj = compileFinal preprocessFileLineNumbers "BTCScripts\server\side\c4booby\setObj.sqf";
	btc_fnc_side_c4booby_timer = compileFinal preprocessFileLineNumbers "BTCScripts\server\side\c4booby\timer.sqf";

	btc_fnc_side_captive = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\captive\captive.sqf";
	btc_fnc_side_captive_informer = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\captive\informer.sqf";
	btc_fnc_side_captive_unit_init = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\captive\unit_init.sqf";

    btc_fnc_side_bombdefusal = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\bombdefusal\bombdefusal.sqf";
    btc_fnc_side_bombdefusal_terminals = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\bombdefusal\terminals.sqf";
    btc_fnc_side_bombdefusal_timer = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\bombdefusal\timer.sqf";
    btc_fnc_side_bombdefusal_nuke_fail = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\bombdefusal\nuke_fail.sqf";

	btc_fnc_side_bombplanting = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\bombplanting\bombplanting.sqf";

	btc_fnc_side_prisoner_to_intel = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\intel\prisoner_to_intel.sqf";
	btc_fnc_side_intel_to_prisoner = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\intel\intel_to_prisoner.sqf";

	btc_fnc_side_scud = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\scud\init.sqf";

	btc_fnc_side_attack_defend = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\attack_defend\init.sqf";

	btc_fnc_side_mission_timer = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\mission_timer\init.sqf";

	btc_fnc_side_tankastic = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\tankastic\init.sqf";
	btc_fnc_side_tankastic_class = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\tankastic\class.sqf";
	btc_fnc_side_tankastic_decreaseLife = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\tankastic\decreaseLife.sqf";

	btc_fnc_side_tickets = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\tickets\init.sqf";
	btc_fnc_side_tickets_decrease = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\tickets\decrease.sqf";

	btc_fnc_side_incognito_jailbreakcheck = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\incognito\jailbreakcheck.sqf";

	btc_fnc_side_propaganda = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\propaganda\init.sqf"; 

	btc_fnc_side_hqmissions_eliminateHVT = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\hqmissions\eliminateHVT.sqf";
	btc_fnc_side_hqmissions_rescueJournalist = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\hqmissions\rescueJournalist.sqf";
	btc_fnc_side_hqmissions_defuseIED = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\hqmissions\defuseIED.sqf";

	//COMMON
	btc_fnc_randomize_pos = compileFinal preprocessFileLineNumbers "BTCScripts\Server\common\randomize_pos.sqf";
	btc_fnc_findPosOutsideRock = compileFinal preprocessFileLineNumbers "BTCScripts\Server\common\findposoutsiderock.sqf";
	btc_fnc_findsafepos = compileFinal preprocessFileLineNumbers "BTCScripts\Server\common\findsafepos.sqf";
	btc_fnc_marked_objects = compileFinal preprocessFileLineNumbers "BTCScripts\Server\common\marked_objects\marked_objects.sqf"; 

	//EOS
	eos_fnc_spawnvehicle = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\eos_SpawnVehicle.sqf";
	eos_fnc_grouphandlers = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\setSkill.sqf";
	eos_fnc_findsafepos = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\findSafePos.sqf";
	eos_fnc_spawngroup = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\infantry_fnc.sqf";
	eos_fnc_setcargo = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\cargo_fnc.sqf";
	eos_fnc_taskpatrol = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\shk_patrol.sqf";
	SHK_pos = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\Functions\shk_pos.sqf";
	shk_fnc_fillhouse = compileFinal preprocessFileLineNumbers "Scripts\Server\EOS\Functions\SHK_buildingpos.sqf";
	eos_fnc_getunitpool = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\UnitPools.sqf";
	EOS_Spawn = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\core\eos_launch.sqf";
	Bastion_Spawn = compileFinal preprocessfilelinenumbers "Scripts\Server\EOS\core\b_launch.sqf";

	//ENGIMA
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Civilians\Server\Functions.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Civilians\Common\Common.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Civilians\Common\Debug.sqf";

	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\Server\Functions.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\Server\MoveVehicle.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\Server\StartTraffic.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\Common\Common.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\Common\Debug.sqf";
	call compile preprocessFileLineNumbers "Scripts\Server\Engima\Traffic\HeadlessClient.sqf";

	//GAIA
	#include "Scripts\Server\Gaia\gaia_compile.sqf"
};

/////////////////////SERVER AND HEADLESS\\\\\\\\\\\\\\\\\\\\\
if (isServer OR (!isDedicated && !hasInterface)) then {
	//COMMON
	btc_fnc_show_fps = compileFinal preprocessFileLineNumbers "BTCScripts\Server\common\show_fps.sqf";

	//SIDE
	btc_fnc_side_lockpick_setLock = compileFinal preprocessFileLineNumbers "BTCScripts\server\side\lockpick\setLock.sqf";

	//DATABASE
		//GAIA
		btc_fnc_database_gaia_intelEH = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\gaia\intelEH.sqf";
		btc_fnc_database_gaia_intelDrop = compileFinal preprocessFileLineNumbers "BTCScripts\Server\database\gaia\intelDrop.sqf"; 
};

/////////////////////EVERYONE\\\\\\\\\\\\\\\\\\\\\
//COMMON
btc_fnc_logDebug = compileFinal preprocessFileLineNumbers "BTCScripts\Client\common\logDebug.sqf";
btc_fnc_side_tickets_zone = compileFinal preprocessFileLineNumbers "BTCScripts\Server\side\tickets\zone.sqf";
btc_fnc_forceSay3D = compileFinal preprocessFileLineNumbers "BTCScripts\Client\common\forceSay3D.sqf";

/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
	//INTRO
	BTC_intro = compileFinal preprocessFileLineNumbers "BTCScripts\Client\intro\BTC_Intro.sqf";

	//ARSENAL
	btc_fnc_arsenal_BIS_to_ACE = compileFinal preprocessFileLineNumbers "BTCScripts\Client\arsenal\BIS_to_ACE.sqf";
	btc_fnc_arsenal_ACE_to_BIS = compileFinal preprocessFileLineNumbers "BTCScripts\Client\arsenal\ACE_to_BIS.sqf";

	//DATABASE
	btc_fnc_database_actions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\database\actions.sqf";
		//PLAYERS
		btc_fnc_database_players_initLocalPlayer = compileFinal preprocessFileLineNumbers "BTCScripts\Client\database\players\initLocalPlayer.sqf";
		//VEHICLEs
		btc_fnc_database_vehicles_addActions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\database\vehicles\addActions.sqf";
		//MHQS
		btc_fnc_database_mhqs_addActions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\database\mhqs\addActions.sqf";
		//RECYCLE
		btc_fnc_database_recycle_addActions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\database\recycle\addActions.sqf";
		btc_fnc_database_recycle_InventoryRecycle = compileFinal preprocessFileLineNumbers "BTCScripts\Client\database\recycle\InventoryRecycle.sqf";

	//SIDE
	btc_fnc_side_c4booby_actions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\c4booby\actions.sqf";
	btc_fnc_side_c4booby_removeActions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\c4booby\removeActions.sqf";

    btc_fnc_side_bombdefusal_gui_digit = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\bombdefusal\gui_digit.sqf";
    btc_fnc_side_bombdefusal_gui_accept = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\bombdefusal\gui_accept.sqf";
    btc_fnc_side_bombdefusal_gui_clear = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\bombdefusal\gui_clear.sqf";
    btc_fnc_side_bombdefusal_gui_timer = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\bombdefusal\gui_timer.sqf";
    btc_fnc_side_bombdefusal_terminals_actions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\bombdefusal\terminals_actions.sqf";

    btc_fnc_side_bombplanting_gui_accept = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\bombplanting\gui_accept.sqf";

    btc_fnc_side_intel_actions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\intel\intel_actions.sqf";
	btc_fnc_side_intel_prisoner_actions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\intel\prisoner_actions.sqf";

	btc_fnc_side_tankastic_actions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\tankastic\actions.sqf";
	btc_fnc_side_tankastic_createVehicle = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\tankastic\createVehicle.sqf";
	btc_fnc_side_tankastic_createGroup = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\tankastic\createGroup.sqf";

	btc_fnc_side_tickets_EH = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\tickets\EH.sqf";

	btc_fnc_side_incognito = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\incognito\init.sqf";

	btc_fnc_side_hqmissions = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\hqmissions\init.sqf";
	btc_fnc_side_hqmissions_fillList = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\hqmissions\fillList.sqf";
	btc_fnc_side_hqmissions_startMission  = compileFinal preprocessFileLineNumbers "BTCScripts\Client\side\hqmissions\startMission.sqf";

	//COMMON
	btc_fnc_marker_debug = compileFinal preprocessFileLineNumbers "BTCScripts\Client\common\marker_debug.sqf";

	//EH
	kp_fuel_consumption = compileFinal preprocessFileLineNumbers "BTCScripts\Client\eh\kp_fuel_consumption.sqf";
};
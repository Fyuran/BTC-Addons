#include "script_component.hpp"
//FlyBy classes
private _classes = ["RHS_CH_47F_light","FIR_F16C","rhs_uh1h_idap","C_IDAP_Heli_Transport_02_F","FIR_F16C","C_Heli_Light_01_civil_F","FIR_F16C","C_Plane_Civil_01_F","FIR_F16C","RHS_A10","RHS_C130J","sab_an12_c","FIR_F16C","sab_an22_c"];
missionNameSpace setVariable [QGVAR(FlyByClasses), _classes];

//Civilian classes
_classes = [
	["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"],
	
	["C_ISCCivs_Civ_1_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_2_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_3_01","C_ISCCivs_Civ_4_01","C_ISCCivs_Civ_5_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_6_01","C_ISCCivs_Civ_7_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_8_01","C_ISCCivs_Civ_9_01","C_ISCCivs_Civ_10_01","C_ISCCivs_Civ_11_01","C_ISCCivs_Civ_12_01","LOP_Tak_Civ_Random"],

	["RDS_Villager_random","RDS_woodlander_random"],

	["C_man_p_beggar_F_afro","C_Man_casual_1_F_afro","C_Man_casual_2_F_afro","C_Man_casual_3_F_afro"] 
] select GVAR(CIVTYPE);
missionNameSpace setVariable [QGVAR(civClasses), _classes];

//Traffic classes
_classes = [
	["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"],

	["LOP_TAK_Civ_Landrover","LOP_TAK_Civ_Offroad","LOP_TAK_Civ_UAZ","LOP_TAK_Civ_UAZ_Open","LOP_TAK_Civ_Ural_open","LOP_TAK_Civ_Ural","C_ISCCivs_GAZ_Grey_01","RDS_Gaz24_Civ_01","RDS_Gaz24_Civ_03","C_Truck_02_fuel_F","C_Van_01_fuel_F","C_Truck_02_box_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_vehicle_F","C_Van_02_service_F","C_Van_02_transport_F","RHS_Ural_Civ_02","C_IDAP_Van_02_medevac_F","C_IDAP_Truck_02_transport_F","C_IDAP_Truck_02_F","C_IDAP_Truck_02_water_F","C_ISCCivs_Skoda_01","C_ISCCivs_Skoda_Octavia_01","C_ISCCivs_VAZ_Decorated_01","C_ISCCivs_Vaz_Green_01","C_ISCCivs_Vaz_Red_01"], 

	["RDS_JAWA353_Civ_01", "RDS_Old_bike_Civ_01", "RDS_MMT_Civ_01","RDS_Lada_Civ_01","RDS_Lada_Civ_02","RDS_Lada_Civ_03","RDS_Gaz24_Civ_01","RDS_Gaz24_Civ_02","RDS_Gaz24_Civ_03","RHS_Ural_Civ_03"],

	["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]
] select GVAR(CIVTYPE);
missionNameSpace setVariable [QGVAR(trafficClasses), _classes];
GVAR(trafficUnits) = [];

//Enemy classes
_classes = [
	// 0 - EAST CSAT FACTION
	[
		//Infantry
		["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"],
		//Light Vehicles
		["O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_arty_F","O_MBT_02_cannon_F"],
		//Heavy vehicles
		["O_Truck_02_covered_F","O_Truck_02_transport_F","O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_Truck_02_medical_F"],
		//Attack helicopters
		["O_Heli_Attack_02_black_F","O_Heli_Attack_02_F"],
		//Helicopters
		["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"],
		//UAVs
		["O_UAV_01_F","O_UAV_02_CAS_F","O_UGV_01_rcws_F"],
		//Statics
		["O_Mortar_01_F","O_static_AT_F","O_static_AA_F"],
		//Boats and ships
		["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"],
		//Divers
		["O_diver_exp_F","O_diver_F","O_diver_TL_F"],
		//Vehicle crew
		["O_crew_F"],
		//Helicopter crew
		["O_helicrew_F","O_helipilot_F"]
	],

	// 1 - WEST NATO FACTION
	[
		//Infantry
		["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F","B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F","B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F","B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"],
		//Light Vehicles
		["B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_02_cannon_F"],
		//Heavy vehicles
		["B_Truck_01_covered_F","B_Truck_01_transport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_medical_F"],
		//Attack helicopters
		["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"],
		//Helicopters
		["B_Heli_Light_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"],
		//UAVs
		["B_UAV_01_F","B_UAV_01_CAS_F","B_UGV_01_rcws_F"],
		//Statics
		["B_Mortar_01_F","B_static_AT_F","B_static_AA_F"],
		//Boats and ships
		["B_Boat_Armed_01_minigun_F","B_Boat_Transport_01_F"],
		//Divers
		["B_diver_exp_F","B_diver_F","B_diver_TL_F"],
		//Vehicle crew
		["B_crew_F"],
		//Helicopter crew
		["B_helicrew_F","B_helipilot_F"]
	],

	// 2 - INDEPENDENT AAF FACTION
	[
		//Infantry
		["I_engineer_F","I_Soldier_A_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AR_F","I_Soldier_AT_F","I_Soldier_exp_F","I_soldier_F","I_Soldier_GL_F","I_Soldier_repair_F"],
		//Light Vehicles
		["I_APC_Wheeled_03_cannon_F"],
		//Heavy vehicles
		["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Truck_02_medical_F"],
		//Attack helicopters
		[],
		//Helicopters
		["I_Heli_Transport_02_F","B_Heli_Light_02_unarmed_F"],
		//UAVs
		["I_UAV_01_F","I_UAV_02_CAS_F","I_UGV_01_rcws_F"],
		//Statics
		["I_Mortar_01_F"],
		//Boats and ships
		["I_Boat_Transport_01_F","I_G_Boat_Transport_01_F","I_Boat_Armed_01_minigun_F"],
		//Divers
		["I_diver_exp_F","I_diver_F","I_diver_TL_F"],
		//Vehicle crew
		["I_crew_F"],
		//Helicopter crew
		["I_helicrew_F","I_helipilot_F"]
	],

	// 3 - EAST TALIBAN RHS	FACTION
	[
		//Infantry
		["LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Engineer","LOP_AM_OPF_Infantry_Corpsman","LOP_AM_OPF_Infantry_GL","LOP_AM_OPF_Infantry_Rifleman_6","LOP_AM_OPF_Infantry_Rifleman","LOP_AM_OPF_Infantry_Rifleman_2","LOP_AM_OPF_Infantry_Rifleman_4","LOP_AM_OPF_Infantry_Rifleman_5","LOP_AM_OPF_Infantry_AT","LOP_AM_OPF_Infantry_AR","LOP_AM_OPF_Infantry_AR_Asst","LOP_AM_OPF_Infantry_SL"],
		//Light Vehicles
		["LOP_ISTS_OPF_T34","LOP_AM_OPF_BTR60","rhsgref_BRDM2_ins"],
		//Heavy vehicles
		["LOP_AM_OPF_Offroad","LOP_AM_OPF_Offroad_M2","LOP_AM_OPF_Nissan_PKM","LOP_AM_OPF_Landrover","LOP_ISTS_OPF_Truck","RHS_Ural_Civ02","RHS_Ural_Civ03"],
		//Attack helicopters
		[],
		//Helicopters
		[],
		//UAVs
		[],
		//Statics
		["LOP_ISTS_OPF_Static_DSHKM"],
		//Boats and ships
		[],
		//Divers
		[],
		//Vehicle crew
		["LOP_AM_OPF_Infantry_Engineer"],
		//Helicopter crew
		["LOP_AM_OPF_Infantry_Engineer"]
	],

	// 4 - EAST ISS RHS FACTION
	[
		//Infantry
		["LOP_ISTS_OPF_Infantry_Rifleman_5","LOP_ISTS_OPF_Infantry_Engineer","LOP_ISTS_OPF_Infantry_Corpsman","LOP_ISTS_OPF_Infantry_TL", "LOP_ISTS_OPF_Infantry_GL","LOP_ISTS_OPF_Infantry_Rifleman_4","LOP_ISTS_OPF_Infantry_Rifleman_2","LOP_ISTS_OPF_Infantry_Rifleman_3","LOP_ISTS_OPF_Infantry_AT", "LOP_ISTS_OPF_Infantry_AR", "LOP_ISTS_OPF_Infantry_AR_Asst","LOP_ISTS_OPF_Infantry_SL","LOP_ISTS_OPF_Infantry_Marksman"],
		//Light Vehicles
		["LOP_ISTS_OPF_BTR60","LOP_ISTS_OPF_T34","LOP_ISTS_OPF_BTR60","LOP_ISTS_OPF_BTR60"],
		//Heavy vehicles
		["LOP_ISTS_OPF_M1025_W_M2","LOP_ISTS_OPF_M1025_D","LOP_ISTS_OPF_M998_D_4DR","LOP_ISTS_OPF_Nissan_PKM","LOP_ISTS_OPF_Offroad","LOP_ISTS_OPF_Offroad_M2","LOP_ISTS_OPF_Truck","RHS_Ural_Civ02","RHS_Ural_Civ03"],
		//Attack helicopters
		[],
		//Helicopters
		[],
		//UAVs
		[],
		//Statics
		["LOP_ISTS_OPF_Static_DSHKM","LOP_ISTS_OPF_Static_M2"],
		//Boats and ships
		["B_G_Boat_Transport_01_F"],
		//Divers
		[],
		//Vehicle crew
		["LOP_ISTS_OPF_Infantry_Engineer"],
		//Helicopter crew
		["LOP_ISTS_OPF_Infantry_Engineer"]
	],

	// 5 - INDEPENDENT BIS LDF FACTION
	[
		//Infantry
		["I_E_Officer_F","I_E_Soldier_F","I_E_Soldier_SL_F","I_E_Medic_F","I_E_Engineer_F","I_E_soldier_Mine_F","I_E_Soldier_TL_F","I_E_Soldier_A_F","I_E_Soldier_AR_F","I_E_Soldier_GL_F","I_E_Soldier_Pathfinder_F","I_E_Soldier_LAT2_F","I_E_soldier_M_F","I_E_Soldier_UAV_F","I_E_RadioOperator_F","I_E_soldier_UGV_02_Demining_F","I_E_Soldier_CBRN_F","I_E_Scientist_F"],
		//Light Vehicles
		["I_E_APC_tracked_03_cannon_F"],
		//Heavy vehicles
		["I_E_Truck_02_F","LOP_UKR_UAZ","I_E_Offroad_01_covered_F","I_E_Offroad_01_comms_F","I_E_Offroad_01_F","I_G_Offroad_01_armed_F","LOP_UKR_BTR60","LOP_UKR_BTR70","LOP_UKR_BTR80"],
		//Attack helicopters
		["I_E_Heli_light_03_dynamicLoadout_F"],
		//Helicopters
		["LOP_UKR_Mi8MT_Cargo","I_E_Heli_light_03_unarmed_F"],
		//UAVs
		["rhs_pchela1t_vvsc","I_E_UAV_01_F","I_E_UGV_02_Demining_F"],
		//Statics
		["rhsgref_ins_g_DSHKM","rhsgref_ins_g_2b14"],
		//Boats and ships
		["I_C_Boat_Transport_02_F"],
		//Divers
		["I_diver_exp_F","I_diver_F","I_diver_TL_F"],
		//Vehicle crew
		["I_E_Crew_F"],
		//Helicopter crew
		["I_E_Helipilot_F"]
	],


	// 6 - INDEPENDENT BIS LDF SCIENTISTS + CBRN FACTION
	[
		//Infantry
		["I_E_Soldier_CBRN_F","I_E_Scientist_F","I_E_Medic_F","I_E_Engineer_F","I_E_Soldier_LAT2_F","I_E_soldier_Mine_F","I_E_Scientist_F"],
		//Light Vehicles
		["I_E_APC_tracked_03_cannon_F"],
		//Heavy vehicles
		["I_E_Truck_02_F","LOP_UKR_UAZ","I_E_Offroad_01_covered_F","I_E_Offroad_01_comms_F","I_E_Offroad_01_F","I_G_Offroad_01_armed_F","LOP_UKR_BTR60","LOP_UKR_BTR70","LOP_UKR_BTR80"],
		//Attack helicopters
		["I_E_Heli_light_03_dynamicLoadout_F"],
		//Helicopters
		["LOP_UKR_Mi8MT_Cargo","I_E_Heli_light_03_unarmed_F"],
		//UAVs
		["rhs_pchela1t_vvsc","I_E_UAV_01_F","I_E_UGV_02_Demining_F"],
		//Statics
		["rhsgref_ins_g_DSHKM","rhsgref_ins_g_2b14"],
		//Boats and ships
		["I_C_Boat_Transport_02_F"],
		//Divers
		["I_diver_exp_F","I_diver_F","I_diver_TL_F"],
		//Vehicle crew
		["I_E_Crew_F"],
		//Helicopter crew
		["I_E_Helipilot_F"]
	],

	// 7 - INDEPENDENT SERBIAN FACTION
	[
		//Infantry
		["rhsgref_cdf_ngd_engineer","rhsgref_nat_rifleman_akms","rhsgref_nat_grenadier_rpg","rhsgref_nat_saboteur","rhsgref_nat_machinegunner_mg42","rhsgref_nat_grenadier","rhsgref_nat_medic","rhsgref_nat_commander","rhsgref_nat_hunter","rhsgref_nat_rifleman_aks74","rhsgref_nat_rifleman_vz58"],
		//Light Vehicles
		["rhsgref_nat_btr70","rhsgref_cdf_bmd1pk","rhsgref_BRDM2","rhsgref_cdf_bmp1"],
		//Heavy vehicles
		["rhsgref_nat_ural","rhsgref_nat_ural_work","rhsgref_nat_uaz_open"],
		//Attack helicopters
		["rhsgref_cdf_reg_Mi8amt"],
		//Helicopters
		[],
		//UAVs
		[],
		//Statics
		["rhsgref_nat_DSHKM"],
		//Boats and ships
		["CUP_I_RHIB_RACS"],
		//Divers
		["I_diver_F"],
		//Vehicle crew
		["rhsgref_cdf_ngd_engineer"],
		//Helicopter crew
		["rhsgref_cdf_ngd_engineer"]
	],

	// 8 - INDEPENDENT BANDITS FACTION
	[
		//Infantry
		["I_L_Criminal_SG_F","I_L_Criminal_SMG_F","I_L_Hunter_F","I_L_Looter_Rifle_F","I_L_Looter_Pistol_F","I_L_Looter_SG_F","I_L_Looter_SMG_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_3_F","I_G_engineer_F","I_C_Soldier_Bandit_2_F","I_C_Pilot_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Bandit_4_F"],
		//Light Vehicles
		["LOP_PMC_Offroad_M2","I_C_Offroad_02_LMG_F"],
		//Heavy vehicles
		["LOP_PMC_Offroad","I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_transport_F","C_Truck_02_covered_F"],
		//Attack helicopters
		[],
		//Helicopters
		["I_C_Heli_Light_01_civil_F"],
		//UAVs
		[],
		//Statics
		["rhsgref_nat_DSHKM"],
		//Boats and ships
		["CUP_I_RHIB_RACS"],
		//Divers
		["I_diver_F"],
		//Vehicle crew
		["I_G_engineer_F"],
		//Helicopter crew
		["I_G_engineer_F"]
	],

	// 9 - INDEPENDENT SYNDIKAT FACTION
	[
		//Infantry
		["I_C_Soldier_Para_7_F","I_C_Soldier_Para_2_F","I_C_Helipilot_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_5_F"],
		//Light Vehicles
		["rhsgref_BRDM2_HQ","rhsgref_BRDM2","LOP_PMC_Offroad_M2","I_C_Offroad_02_LMG_F"],
		//Heavy vehicles
		["LOP_PMC_Offroad","I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_transport_F","C_Truck_02_covered_F"],
		//Attack helicopters
		[],
		//Helicopters
		["I_C_Heli_Light_01_civil_F"],
		//UAVs
		[],
		//Statics
		["rhsgref_nat_DSHKM"],
		//Boats and ships
		["CUP_I_RHIB_RACS"],
		//Divers
		["I_diver_F"],
		//Vehicle crew
		["I_G_engineer_F"],
		//Helicopter crew
		["I_G_engineer_F"]
	],

	// 10 - INDEPENDENT BLACK SUN
	[
		//Infantry
		["rhsgref_nat_militiaman_kar98k","rhsgref_nat_rifleman_akms","rhsgref_nat_rifleman_aks74","rhsgref_nat_rifleman_mp44","rhsgref_nat_rifleman","rhsgref_nat_rifleman_vz58","rhsgref_nat_saboteur","rhsgref_nat_warlord","rhsgref_nat_grenadier_rpg","I_L_Criminal_SG_F","I_L_Looter_Rifle_F","I_L_Looter_SMG_F"],
		//Light Vehicles
		["rhsgref_nat_uaz_open","rhsgref_nat_van","rhsgref_nat_uaz","rhsgref_nat_uaz_dshkm","rhsgref_nat_btr70"],
		//Heavy vehicles
		["rhsgref_nat_ural_open","rhsgref_nat_ural"],
		//Attack helicopters
		["I_Heli_light_03_dynamicLoadout_F"],
		//Helicopters
		["I_Heli_light_03_unarmed_F"],
		//UAVs
		[],
		//Statics
		["rhsgref_nat_DSHKM"],
		//Boats and ships
		["I_Boat_Transport_01_F"],
		//Divers
		["I_diver_F"],
		//Vehicle crew
		["rhsgref_nat_crew"],
		//Helicopter crew
		["I_C_Helipilot_F"]
	]
];
missionNameSpace setVariable [QGVAR(enClasses), _classes];

#ifdef DEBUG_MODE_FULL
GVAR(enUnits) = [];
#endif
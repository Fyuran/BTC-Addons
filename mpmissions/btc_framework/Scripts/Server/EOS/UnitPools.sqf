private ["_tempArray","_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArray=[];

// EAST CSAT FACTION
	if (_faction==0) then {
	_InfPool=	["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];
	_ArmPool=	["O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_arty_F","O_MBT_02_cannon_F"];
	_MotPool=	["O_Truck_02_covered_F","O_Truck_02_transport_F","O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_Truck_02_medical_F"];
	_ACHPool=	["O_Heli_Attack_02_black_F","O_Heli_Attack_02_F"];
	_CHPool=	["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"];
	_uavPool=	["O_UAV_01_F","O_UAV_02_CAS_F","O_UGV_01_rcws_F"];
	_stPool=	["O_Mortar_01_F","O_static_AT_F","O_static_AA_F"];
	_shipPool=	["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"];
	_diverPool=	["O_diver_exp_F","O_diver_F","O_diver_TL_F"];
	_crewPool=	["O_crew_F"];
	_heliCrew=	["O_helicrew_F","O_helipilot_F"];
};
// WEST NATO FACTION
	if (_faction==1) then {
	_InfPool=	["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F","B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F","B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F","B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];
	_ArmPool=	["B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_02_cannon_F"];
	_MotPool=	["B_Truck_01_covered_F","B_Truck_01_transport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_medical_F"];
	_ACHPool=	["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"];
	_CHPool=	["B_Heli_Light_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"];
	_uavPool=	["B_UAV_01_F","B_UAV_01_CAS_F","B_UGV_01_rcws_F"];
	_stPool=	["B_Mortar_01_F","B_static_AT_F","B_static_AA_F"];
	_shipPool=	["B_Boat_Armed_01_minigun_F","B_Boat_Transport_01_F"];
	_diverPool=	["B_diver_exp_F","B_diver_F","B_diver_TL_F"];
	_crewPool=	["B_crew_F"];
	_heliCrew=	["B_helicrew_F","B_helipilot_F"];
};
// INDEPENDENT AAF FACTION
	if (_faction==2) then {
	_InfPool=	["I_engineer_F","I_Soldier_A_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AR_F","I_Soldier_AT_F","I_Soldier_exp_F","I_soldier_F","I_Soldier_GL_F","I_Soldier_repair_F"];
	_ArmPool=	["I_APC_Wheeled_03_cannon_F"];
	_MotPool=	["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Truck_02_medical_F"];
	_ACHPool=	[];
	_CHPool=	["I_Heli_Transport_02_F","B_Heli_Light_02_unarmed_F"];
	_uavPool=	["I_UAV_01_F","I_UAV_02_CAS_F","I_UGV_01_rcws_F"];
	_stPool=	["I_Mortar_01_F"];
	_shipPool=	["I_Boat_Transport_01_F","I_G_Boat_Transport_01_F","I_Boat_Armed_01_minigun_F"];
	_diverPool=	["I_diver_exp_F","I_diver_F","I_diver_TL_F"];
	_crewPool=	["I_crew_F"];
	_heliCrew=	["I_helicrew_F","I_helipilot_F"];
};
// TALIBAN RHS	(EAST)
	if (_faction==3) then {
	_InfPool=	["LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Engineer","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Corpsman","LOP_AM_OPF_Infantry_Engineer","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_GL","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Rifleman_6","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Rifleman","LOP_AM_OPF_Infantry_Engineer","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Rifleman_2","LOP_AM_OPF_Infantry_Rifleman_4","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_Rifleman_5","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_AT","LOP_AM_OPF_Infantry_AR","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_AR_Asst","LOP_AM_OPF_Infantry_SL","LOP_AM_OPF_Infantry_Engineer"];
	_ArmPool=	["LOP_ISTS_OPF_T34","LOP_AM_OPF_BTR60","rhsgref_BRDM2_ins"];
	_MotPool=	["LOP_AM_OPF_Offroad","LOP_AM_OPF_Offroad_M2","LOP_AM_OPF_Nissan_PKM","LOP_AM_OPF_Landrover","LOP_ISTS_OPF_Truck","RHS_Ural_Civ02","RHS_Ural_Civ03"];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	["LOP_ISTS_OPF_Static_DSHKM"];
	_shipPool=	[];
	_diverPool=	[];
	_crewPool=	["LOP_AM_OPF_Infantry_Engineer"];
	_heliCrew=	["LOP_AM_OPF_Infantry_Engineer"];
};
// ISS RHS (EAST)
	if (_faction==4) then {
	_InfPool= ["LOP_ISTS_OPF_Infantry_Rifleman_5",
	             "LOP_ISTS_OPF_Infantry_Engineer",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_Corpsman",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_TL",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_Rifleman_5",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_GL",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_Rifleman_4",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_Rifleman_2",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_Rifleman_3",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_AT",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_AR",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_AR_Asst",
			   "LOP_ISTS_OPF_Infantry_Rifleman_5",
                 "LOP_ISTS_OPF_Infantry_SL",
                "LOP_ISTS_OPF_Infantry_Marksman"];
	_ArmPool=	["LOP_ISTS_OPF_BTR60","LOP_ISTS_OPF_T34","LOP_ISTS_OPF_BTR60","LOP_ISTS_OPF_BTR60"];
	_MotPool=	["LOP_ISTS_OPF_M1025_W_M2","LOP_ISTS_OPF_M1025_D","LOP_ISTS_OPF_M998_D_4DR","LOP_ISTS_OPF_Nissan_PKM","LOP_ISTS_OPF_Offroad","LOP_ISTS_OPF_Offroad_M2","LOP_ISTS_OPF_Truck","RHS_Ural_Civ02","RHS_Ural_Civ03"];
	_ACHPool=	[];
	_CHPool=	[];
	_uavPool=	[];
	_stPool=	["LOP_ISTS_OPF_Static_DSHKM","LOP_ISTS_OPF_Static_M2"];
	_shipPool=	["B_G_Boat_Transport_01_F"];
	_diverPool=	[];
	_crewPool=	["LOP_ISTS_OPF_Infantry_Engineer"];
	_heliCrew=	[];
};
// BIS LDF (INS)
	if (_faction==5) then {
	_InfPool=	[
"I_E_Officer_F",
"I_E_Soldier_F",
"I_E_Soldier_SL_F",
"I_E_Soldier_F",
"I_E_Medic_F",
"I_E_Soldier_F",
"I_E_Engineer_F",
"I_E_Soldier_F",
"I_E_soldier_Mine_F",
"I_E_Soldier_F",
"I_E_Soldier_TL_F",
"I_E_Soldier_F",
"I_E_Soldier_F",
"I_E_Soldier_A_F",
"I_E_Soldier_F",
"I_E_Soldier_AR_F",
"I_E_Soldier_F",
"I_E_Soldier_GL_F",
"I_E_Soldier_F",
"I_E_Soldier_Pathfinder_F",
"I_E_Soldier_F",
"I_E_Soldier_LAT2_F",
"I_E_Soldier_F",
"I_E_soldier_M_F",
"I_E_Soldier_F",
"I_E_Soldier_UAV_F",
"I_E_RadioOperator_F",
"I_E_soldier_UGV_02_Demining_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Scientist_F",
"I_E_Scientist_F"
	];
_ArmPool=	[
"I_E_APC_tracked_03_cannon_F"
			];
_MotPool=	[
"I_E_Truck_02_F",
"LOP_UKR_UAZ",
"I_E_Offroad_01_covered_F",
"I_E_Offroad_01_comms_F",
"I_E_Offroad_01_F",
"I_G_Offroad_01_armed_F",
"LOP_UKR_BTR60",
"LOP_UKR_BTR70",
"LOP_UKR_BTR80"
                 ];
	_ACHPool=	["I_E_Heli_light_03_dynamicLoadout_F"];
	_CHPool=	["LOP_UKR_Mi8MT_Cargo","I_E_Heli_light_03_unarmed_F"];
	_uavPool=	["rhs_pchela1t_vvsc","I_E_UAV_01_F","I_E_UGV_02_Demining_F"];
	_stPool=	["rhsgref_ins_g_DSHKM","rhsgref_ins_g_2b14"];
	_shipPool=	["I_C_Boat_Transport_02_F"];
	_diverPool=	["I_diver_exp_F","I_diver_F","I_diver_TL_F"];
	_crewPool=	["I_E_Crew_F"];
	_heliCrew=	["I_E_Helipilot_F"];
	};

// BIS LDF SCIENTISTS + CBRN(INS)
	if (_faction==6) then {
	_InfPool=	[
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Medic_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Engineer_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Soldier_LAT2_F",
"I_E_soldier_Mine_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F",
"I_E_Soldier_CBRN_F",
"I_E_Scientist_F"
	];
_ArmPool=	[
"I_E_APC_tracked_03_cannon_F"
			];
_MotPool=	[
"I_E_Truck_02_F",
"LOP_UKR_UAZ",
"I_E_Offroad_01_covered_F",
"I_E_Offroad_01_comms_F",
"I_E_Offroad_01_F",
"I_G_Offroad_01_armed_F",
"LOP_UKR_BTR60",
"LOP_UKR_BTR70",
"LOP_UKR_BTR80"
                 ];
	_ACHPool=	["I_E_Heli_light_03_dynamicLoadout_F"];
	_CHPool=	["LOP_UKR_Mi8MT_Cargo","I_E_Heli_light_03_unarmed_F"];
	_uavPool=	["rhs_pchela1t_vvsc","I_E_UAV_01_F","I_E_UGV_02_Demining_F"];
	_stPool=	["rhsgref_ins_g_DSHKM","rhsgref_ins_g_2b14"];
	_shipPool=	["I_C_Boat_Transport_02_F"];
	_diverPool=	["I_diver_exp_F","I_diver_F","I_diver_TL_F"];
	_crewPool=	["I_E_Crew_F"];
	_heliCrew=	["I_E_Helipilot_F"];
	};

// SERBIAN (INS)
	if (_faction==7) then {
	_InfPool=	["rhsgref_cdf_ngd_engineer",
"rhsgref_nat_militiaman_kar98k",
"rhsgref_nat_rifleman_akms",
"rhsgref_nat_grenadier_rpg",
"rhsgref_nat_militiaman_kar98k",
"rhsgref_nat_rifleman_akms",
"rhsgref_nat_saboteur",
"rhsgref_nat_militiaman_kar98k",
"rhsgref_nat_rifleman_akms",
"rhsgref_nat_machinegunner_mg42",
"rhsgref_nat_militiaman_kar98k",
"rhsgref_nat_rifleman_akms",
"rhsgref_nat_grenadier",
"rhsgref_nat_militiaman_kar98k",
"rhsgref_nat_rifleman_akms",
"rhsgref_nat_medic",
"rhsgref_nat_commander",
"rhsgref_nat_hunter",
"rhsgref_nat_militiaman_kar98k",
"rhsgref_nat_rifleman_akms",
"rhsgref_nat_rifleman_aks74",
"rhsgref_nat_rifleman_vz58"];
	_ArmPool=	["rhsgref_nat_btr70","rhsgref_cdf_bmd1pk","rhsgref_BRDM2","rhsgref_cdf_bmp1"];
	_MotPool=	["rhsgref_nat_ural","rhsgref_nat_ural_work","rhsgref_nat_uaz_open"];
	_ACHPool=	["rhsgref_cdf_reg_Mi8amt"];
	_CHPool=	["rhsgref_cdf_reg_Mi8amt"];
	_uavPool=	[];
	_stPool=	["rhsgref_nat_DSHKM"];
	_shipPool=	["CUP_I_RHIB_RACS"];
	_diverPool=	["I_diver_F"];
	_crewPool=	["rhsgref_cdf_ngd_engineer"];
	_heliCrew=	["rhsgref_cdf_ngd_engineer"];};
	

// Bandits (INS)
	if (_faction==8) then {
	_InfPool=	[
	"I_L_Criminal_SG_F",
"I_L_Criminal_SMG_F",
"I_L_Hunter_F",
"I_L_Looter_Rifle_F",
"I_L_Looter_Pistol_F",
"I_L_Looter_SG_F",
"I_L_Looter_SMG_F",
"I_C_Soldier_Bandit_7_F",
"I_C_Soldier_Bandit_3_F",
"I_G_engineer_F",
"I_C_Soldier_Bandit_2_F",
"I_C_Pilot_F",
"I_C_Soldier_Bandit_5_F",
"I_C_Soldier_Bandit_6_F",
"I_C_Soldier_Bandit_1_F",
"I_C_Soldier_Bandit_8_F",
"I_C_Soldier_Bandit_4_F"
	];
	_ArmPool=	["LOP_PMC_Offroad_M2","I_C_Offroad_02_LMG_F"];
	_MotPool=	["LOP_PMC_Offroad",
"I_C_Offroad_02_unarmed_F",
"I_C_Van_01_transport_F",
"I_C_Van_02_transport_F",
"C_Truck_02_covered_F"];
	_ACHPool=	["I_C_Heli_Light_01_civil_F"];
	_CHPool=	["I_C_Heli_Light_01_civil_F"];
	_uavPool=	[];
	_stPool=	["rhsgref_nat_DSHKM"];
	_shipPool=	["CUP_I_RHIB_RACS"];
	_diverPool=	["I_diver_F"];
	_crewPool=	["I_G_engineer_F"];
	_heliCrew=	["I_G_engineer_F"];};
	
// Syndicat (INS)
	if (_faction==9) then {
	_InfPool=	[
"I_C_Soldier_Para_7_F",
"I_C_Soldier_Para_2_F",
"I_C_Helipilot_F",
"I_C_Soldier_Para_3_F",
"I_C_Soldier_Para_4_F",
"I_C_Soldier_Para_6_F",
"I_C_Soldier_Para_8_F",
"I_C_Soldier_Para_1_F",
"I_C_Soldier_Para_5_F"
	];
	_ArmPool=	["rhsgref_BRDM2_HQ",
"rhsgref_BRDM2","LOP_PMC_Offroad_M2","I_C_Offroad_02_LMG_F"];
	_MotPool=	["LOP_PMC_Offroad",
"I_C_Offroad_02_unarmed_F",
"I_C_Van_01_transport_F",
"I_C_Van_02_transport_F",
"C_Truck_02_covered_F"];
	_ACHPool=	["I_C_Heli_Light_01_civil_F"];
	_CHPool=	["I_C_Heli_Light_01_civil_F"];
	_uavPool=	[];
	_stPool=	["rhsgref_nat_DSHKM"];
	_shipPool=	["CUP_I_RHIB_RACS"];
	_diverPool=	["I_diver_F"];
	_crewPool=	["I_G_engineer_F"];
	_heliCrew=	["I_G_engineer_F"];};

//////////////////////////////DEFAULT////////////////////////////////////////////////////
if(_InfPool isEqualTo []) then {_InfPool = ["O_SoldierU_SL_F"]};
if(_ArmPool isEqualTo []) then {_ArmPool = ["O_APC_Tracked_02_AA_F"]};
if(_MotPool isEqualTo []) then {_MotPool = ["O_Truck_02_transport_F"]};
if(_ACHPool isEqualTo []) then {_ACHPool = ["O_Heli_Attack_02_black_F"]};
if(_CHPool isEqualTo []) then {_CHPool = ["O_Heli_Light_02_F"]};
if(_uavPool isEqualTo []) then {_uavPool = ["O_UAV_01_F"]};
if(_stPool isEqualTo []) then {_stPool = ["O_Mortar_01_F"]};
if(_shipPool isEqualTo []) then {_shipPool = ["O_Boat_Transport_01_F"]};
if(_diverPool isEqualTo []) then {_diverPool = ["O_diver_exp_F"]};
if(_crewPool isEqualTo []) then {_crewPool = ["O_crew_F"]};
if(_heliCrew isEqualTo []) then {_heliCrew = ["O_helicrew_F"]};
////////////////////////////////////////////////////////////////////////////////////////
if (_type==0) then {
	for "_i" from 0 to 5 do{
		_unit=_InfPool select (floor(random(count _InfPool)));
		_tempArray set [count _tempArray,_unit];};
	};

if (_type==1) then {_tempArray=_diverPool};


// CREATE ARMOUR & CREW
if (_type==2) then {
				_tempUnit=_ArmPool select (floor(random(count _ArmPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_crewPool select (floor(random(count _crewPool)));
				_temparray set [count _temparray,_crew];
};

// CREATE ATTACK CHOPPER & CREW
if (_type==3) then {
				_tempUnit=_ACHPool select (floor(random(count _ACHPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_heliCrew select (floor(random(count _heliCrew)));
				_temparray set [count _temparray,_crew];
};

// CREATE TRANSPORT CHOPPER & CREW
if (_type==4) then {
				_tempUnit=_CHPool select (floor(random(count _CHPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_heliCrew select (floor(random(count _heliCrew)));
				_temparray set [count _temparray,_crew];
						};

// CREATE STATIC & CREW
if (_type==5) then {
				_tempUnit=_stPool select (floor(random(count _stPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_crewPool select (floor(random(count _crewPool)));
				_temparray set [count _temparray,_crew];

};
if (_type==6) then {_tempArray=_uavPool select (floor(random(count _uavPool)));};

// CREATE TRANSPORT & CREW
if (_type==7) then {
				_tempUnit=_MotPool select (floor(random(count _MotPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_crewPool select (floor(random(count _crewPool)));
				_temparray set [count _temparray,_crew];
				};

// CREATE BOAT & DIVER CREW
if (_type==8) then {
				_tempUnit=_shipPool select (floor(random(count _shipPool)));
				_temparray set [count _temparray,_tempUnit];
				_crew=_diverPool select (floor(random(count _diverPool)));
				_temparray set [count _temparray,_crew];
				};

// CREATE CARGO
if (_type==9) then {
		for "_i" from 0 to 4 do{
			_unit=_InfPool select (floor(random(count _InfPool)));
			_temparray set [count _temparray,_unit];
							};
};

// CREATE DIVER CARGO
if (_type==10) then {
		for "_i" from 0 to 4 do{
			_unit=_diverPool select (floor(random(count _diverPool)));
			_temparray set [count _temparray,_unit];
							};
};

//hint format ["%1",_tempArray];
_tempArray
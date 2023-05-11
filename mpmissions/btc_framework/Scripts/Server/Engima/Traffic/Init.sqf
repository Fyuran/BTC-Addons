/*
* See file Engima\Traffic\Documentation.txt for documentation and a full reference of
* how to customize and use Engima's Traffic.
*/

private _possibleVehicles = call {
	if (BTC_Civ==1) exitWith {
			["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]
		};
	if (BTC_Civ==2) exitWith {
			["LOP_TAK_Civ_Landrover","LOP_TAK_Civ_Offroad","LOP_TAK_Civ_UAZ","LOP_TAK_Civ_UAZ_Open","LOP_TAK_Civ_Ural_open","LOP_TAK_Civ_Ural","C_ISCCivs_GAZ_Grey_01","RDS_Gaz24_Civ_01","RDS_Gaz24_Civ_03","C_Truck_02_fuel_F","C_Van_01_fuel_F","C_Truck_02_box_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_vehicle_F","C_Van_02_service_F","C_Van_02_transport_F","RHS_Ural_Civ_02","C_IDAP_Van_02_medevac_F","C_IDAP_Truck_02_transport_F","C_IDAP_Truck_02_F","C_IDAP_Truck_02_water_F","C_ISCCivs_Skoda_01","C_ISCCivs_Skoda_Octavia_01","C_ISCCivs_VAZ_Decorated_01","C_ISCCivs_Vaz_Green_01","C_ISCCivs_Vaz_Red_01"]
		};
	if (BTC_Civ==3) exitWith {
			["RDS_JAWA353_Civ_01", "RDS_Old_bike_Civ_01", "RDS_MMT_Civ_01","RDS_Lada_Civ_01","RDS_Lada_Civ_02","RDS_Lada_Civ_03","RDS_Gaz24_Civ_01","RDS_Gaz24_Civ_02","RDS_Gaz24_Civ_03","RHS_Ural_Civ_03"]
		};
	[]
};
private _headlessClientPresent =  !(isNil Engima_Traffic_HeadlessClientName);
private _runOnThisMachine = true;

// Set traffic parameters.
[
	["SIDE", civilian],
	["VEHICLES", _possibleVehicles],
	["VEHICLES_COUNT", 10],
	["MIN_SPAWN_DISTANCE", 800],
	["MAX_SPAWN_DISTANCE", 1200],
	["MIN_SKILL", 0.4],
	["MAX_SKILL", 0.6],
	["AREA_MARKER", ""],
	["HIDE_AREA_MARKER", true],
	["DEBUG", false]
] spawn ENGIMA_TRAFFIC_StartTraffic;

/* ----------------------------------------------------------------------------
Function: findMilitaryBuildings

Description:
Marks on map any military structure belonging to the following classes

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    LordMac & Fyuran

---------------------------------------------------------------------------- */

private _mapSize = getNumber(configFile >> "CfgWorlds" >> worldName >> "MapSize");
private _centermap = [(_mapSize/2), (_mapSize/2), 0];
private _radius = [0,0,0] distance _centermap;
private _mil_array = [
	"Land_dp_mainFactory_F",
	"Land_Factory_Main_F",
	"Jbad_Ind_Coltan_Main"
	/*
	"Land_Cargo_House_V1_F",
	"Land_Cargo_House_V2_F",
	"Land_Cargo_House_V3_F",
	"Land_Bunker_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_BagBunker_Large_F",
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_Tower_V2_F",
	"Land_Cargo_Tower_V3_F",
	"Land_MilOffices_V1_F",
	"Land_Dome_Small_F",
	"Land_Dome_Big_F",
	"Land_Airport_Tower_F",
	"Land_i_Barracks_V1_F",
	"Land_i_Barracks_V2_F",
	"Land_u_Barracks_V2_F",
	"CUP_A2_fortress_01",
	"CUP_A2_vez",
	"cup_a2_fortified_nest_small_ep1",
	"land_vez",
	"land_fortified_nest_small_ep1",
	"land_fortified_nest_big_ep1",
	"land_fortified_nest_big",
	"land_fortress_01",
	"CUP_A2_barrack2",
	"CUP_A2_barrack2_ep1",
	"CUP_A2_barracks_i",
	"CUP_A2_barracks_i_ep1",
	"CUP_A2_fort_watchtower",
	"CUP_A2_fort_watchtower_ep1",
	"land_barrack2",
	"land_barrack2_ep1",
	"land_mil_barracks_i",
	"land_mil_barracks_i_ep1",
	"land_fort_watchtower",
	"Land_BagBunker_01_large_green_F",
	"LAND_t_2_FOP2",
	"LAND_t_sb_5",
	"land_fort_watchtower_ep1"
	"land_raz_hut01",
	"land_raz_hut02",
	"land_raz_hut03",
	"land_raz_hut04",
	"land_raz_hut05",
	"land_raz_hut06",
	"land_raz_hut07",
	"land_slum_house03_f"
	*/
];


private _building = nearestObjects [_centermap, _mil_array, _radius];
{
	_markername = format ["%1 %2", typeOf _x, _forEachIndex];
	_buildingMarker = createMarkerLocal [_markername, position _x];
	_buildingMarker setMarkerShapeLocal "ICON";
	_buildingMarker setMarkerTypeLocal "mil_dot";
	_buildingMarker setMarkerTextLocal _markername;
	_buildingMarker setMarkerColorLocal "ColorRed";
} forEach _building;

//sleep 30;

// END
//if (BTC_Debug) then {
//hint format ["World size is %1 x %1\n Center is %2-%2\n\nAi Units = %3\n END", _size,(_size/2),(count allunits)];
//nul = execvm "BTCScripts\debug.sqf"
//};
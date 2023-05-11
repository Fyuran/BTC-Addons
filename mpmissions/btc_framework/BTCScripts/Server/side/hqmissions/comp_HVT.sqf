/* ----------------------------------------------------------------------------
Function: comp_hvT.sqf

Description:
	Composition for HVT mission
Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    http://www.blacktemplars.altervista.org

---------------------------------------------------------------------------- */

/*
Grab data:
Mission: BTC_TEMPL_COMP_HTV_01
World: VR
Anchor position: [4053.78, 2598.74]
Area size: 200
Using orientation of objects: no
*/

private _comp_HVT =
[
	["Land_Radar_01_HQ_F",[11.5242,-44.7634,0],0,1,0,[],"","",true,false],
	["Land_Coil_F",[-7.25659,-12.5647,0],0,1,0,[],"","",false,false], 
	["Land_BagFence_Round_F",[7.35547,-17.5474,-0.00130129],136.191,1,0,[],"","",false,false], 
	["Land_BagFence_Round_F",[10.1228,-17.6084,-0.00130129],223.783,1,0,[],"","",false,false], 
	["Land_BagFence_Short_F",[6.77002,-19.6943,-0.000999928],94.4669,1,0,[],"","",false,false], 
	["Land_BagFence_Short_F",[10.4526,-19.7947,-0.000999928],91.3958,1,0,[],"","",false,false], 
	["rhsgref_tla_DSHKM",[8.97632,-20.8655,-0.0749998],359.438,1,0,[],"","",true,false], 
	["MetalBarrel_burning_F",[0.0493164,-23.6492,0],128.839,1,0,[],"","",true,false], 
	["Land_GarbagePallet_F",[-2.91406,-23.6726,0],221.857,1,0,[],"","",false,false], 
	["Land_Portable_generator_F",[-17.9829,-16.6228,0],120.003,1,0,[],"","",false,false], 
	["Land_PortableLight_single_F",[-17.3213,-17.387,0],45,1,0,[],"","",false,false], 
	["Land_Wreck_Offroad_F",[-6.44141,-24.9888,0],236.568,1,0,[],"","",false,false], 
	["Land_Pipes_small_F",[-17.1489,-20.0088,0],74.9995,1,0,[],"","",false,false], 
	["Land_Bricks_V1_F",[-18.3599,-19.7854,0],0.0024434,1,0,[],"","",false,false], 
	["Land_Misc_GContainer_Big",[26.3674,-7.12476,0],0,1,0,[],"","",false,false], 
	["Land_Bricks_V4_F",[-17.832,-21.124,0],165.003,1,0,[],"","",false,false], 
	["Land_BarrelEmpty_F",[-16.8789,-21.9854,0],359.989,1,0,[],"","",false,false], 
	["Land_BarrelSand_F",[-17.6289,-21.9854,0],359.989,1,0,[],"","",false,false], 
	["Land_Pallet_F",[-22.3564,-17.8704,0],195,1,0,[],"","",false,false], 
	["Land_WoodenBox_F",[-19.5942,-21.6052,0],120,1,0,[],"","",false,false], 
	["Land_CinderBlocks_F",[22.4048,-19.9688,0],16.0206,1,0,[],"","",false,false], 
	["Land_WheelCart_F",[-24.9873,-17.8757,0],225.007,1,0,[],"","",false,false], 
	["Land_Bricks_V2_F",[-18.8115,-25.2358,0],180.001,1,0,[],"","",false,false], 
	["Land_Saw_F",[-22.7314,-22.7454,0],359.983,1,0,[],"","",false,false], 
	["Land_Garbage_square5_F",[-23.4436,-21.9236,0],0,1,0,[],"","",false,false], 
	["Land_CinderBlocks_F",[-20.1875,-25.2786,0],359.997,1,0,[],"","",false,false], 
	["Land_Grinder_F",[-25.6406,-20.928,0],0.0171672,1,0,[],"","",false,false], 
	["Land_WorkStand_F",[-24.0474,-22.7739,0],29.9971,1,0,[],"","",false,false], 
	["Land_CinderBlocks_F",[27.3213,-19.1499,0],266.783,1,0,[],"","",false,false], 
	["Land_WoodenBox_F",[-10.3723,-35.1599,0],135.19,1,0,[],"","",false,false], 
	["Land_Wreck_Car3_F",[33.8486,-19.8877,0],94.6278,1,0,[],"","",false,false], 
	["Land_Tank_rust_F",[-24.8528,-32.3687,0],321.026,1,0,[],"","",false,false], 
	["Land_Bricks_V2_F",[32.897,-26.835,0],0.51404,1,0,[],"","",false,false], 
	["Land_Bricks_V1_F",[33.8088,-27.9785,0],264.029,1,0,[],"","",false,false], 
	["Land_Bricks_V4_F",[33.3081,-29.3989,0],250.681,1,0,[],"","",false,false], 
	["Land_Misc_Cargo2A_EP1",[37.3804,-35.0503,0],142.886,1,0,[],"","",false,false], 
	["RHS_ZU23_VDV",[-12.2612,-50.5251,-0.07514],269.343,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[35.282,-47.7695,-0.000999928],183.6,1,0,[],"","",false,false], 
	["rhsgref_tla_DSHKM",[34.6816,-49.9399,-0.0749998],87.0554,1,0,[],"","",true,false], 
	["Land_BagFence_Round_F",[37.4373,-48.3223,-0.00130129],225.324,1,0,[],"","",false,false], 
	["Land_BagFence_Short_F",[35.2373,-51.4534,-0.000999928],180.529,1,0,[],"","",false,false], 
	["Land_BagFence_Round_F",[37.4182,-51.0903,-0.00130129],312.916,1,0,[],"","",false,false], 
	["Land_GarbageBarrel_01_F",[-10.8354,-63.4639,0],71.2717,1,0,[],"","",false,false], 
	["Land_GarbageBarrel_01_F",[-11.0464,-64.2881,0],8.52355,1,0,[],"","",false,false], 
	["Land_Sacks_heap_F",[31.8311,-59.0247,0],93.11,1,0,[],"","",false,false], 
	["Land_ConcretePipe_F",[-34.3496,-58.2241,0],0.0640661,1,0,[],"","",false,false], 
	["Land_Wreck_Ural_F",[-8.7085,-68.0889,0.00151062],131.966,1,0,[],"","",false,false], 
	["Land_CerealsBox_F",[36.499,-59.678,0],212.192,1,0,[],"","",false,false], 
	["Land_BakedBeans_F",[36.3682,-59.7854,0],96.2567,1,0,[],"","",false,false], 
	["Land_Can_V2_F",[35.6123,-60.3577,0],186.941,1,0,[],"","",false,false], 
	["Land_Canteen_F",[35.7861,-60.2795,0],41.0899,1,0,[],"","",false,false], 
	["Land_Can_V1_F",[35.6045,-60.4788,0],252.534,1,0,[],"","",false,false], 
	["Land_BakedBeans_F",[35.7803,-60.4436,0],328.921,1,0,[],"","",false,false], 
	["Land_CampingChair_V1_F",[34.7334,-62.47,0],346.683,1,0,[],"","",false,false], 
	["rhsgref_tla_DSHKM",[12.4336,-70.7649,-0.0749998],181.119,1,0,[],"","",true,false], 
	["Land_Bucket_F",[39.167,-60.4387,0],246.285,1,0,[],"","",false,false], 
	["Land_Camping_Light_F",[33.2217,-64.0901,-0.000849724],178.63,1,0,[],"","",false,false], 
	["Land_CampingChair_V1_F",[32.7002,-64.7327,0],280.356,1,0,[],"","",false,false], 
	["Land_BagFence_Short_F",[11.2146,-71.7578,-0.000999928],269.476,1,0,[],"","",false,false], 
	["Land_MetalWire_F",[37.6943,-62.5588,0],207.203,1,0,[],"","",false,false], 
	["Land_BagFence_Short_F",[14.8987,-71.7349,-0.000999928],272.547,1,0,[],"","",false,false], 
	["Land_Campfire_F",[35.1201,-65.0774,0.0299988],209.89,1,0,[],"","",true,false], 
	["Land_BakedBeans_F",[37.04,-64.22,0],266.535,1,0,[],"","",false,false], 
	["Land_Garbage_square5_F",[36.2256,-64.7349,0],189.408,1,0,[],"","",false,false], 
	["Land_WoodPile_F",[38.9131,-63.7786,0],277.724,1,0,[],"","",false,false], 
	["Land_Gloves_F",[37.6729,-64.3918,0],281.032,1,0,[],"","",false,false], 
	["Land_Axe_F",[37.8623,-64.3088,0],24.8774,1,0,[],"","",false,false], 
	["Land_BagFence_Round_F",[11.6177,-73.9316,-0.00130129],41.8636,1,0,[],"","",false,false], 
	["Land_CanisterPlastic_F",[31.9912,-67.553,0],209.038,1,0,[],"","",false,false], 
	["Land_BagFence_Round_F",[14.3855,-73.9001,-0.00130129],314.272,1,0,[],"","",false,false], 
	["Land_CanisterPlastic_F",[32.3389,-68.1145,0],78.4225,1,0,[],"","",false,false], 
	["Land_TinContainer_F",[32.6631,-68.0432,0],269.434,1,0,[],"","",false,false], 
	["Land_Sleeping_bag_brown_F",[38.3916,-65.6255,0],281.451,1,0,[],"","",false,false], 
	["Land_FMradio_F",[36.0967,-68.095,0],171.781,1,0,[],"","",false,false], 
	["Land_Sleeping_bag_F",[35.1865,-68.4641,0],357.809,1,0,[],"","",false,false], 
	["Land_Sleeping_bag_F",[37.0693,-67.4937,0],317.349,1,0,[],"","",false,false], 
	["Land_Misc_Cargo2B",[23.6028,-76.8723,0],68.5126,1,0,[],"","",false,false], 
	["Land_Timbers_F",[34.0315,-87.2466,0.0232067],211.137,1,0,[],"","",false,false], 
	["Land_Ind_Timbers",[-9.13452,-101.261,0.0232067],127.015,1,0,[],"","",false,false], 
	["Land_WoodenCart_F",[9.61548,-99.3962,0],285.003,1,0,[],"","",false,false], 
	["Land_CinderBlocks_F",[6.95288,-101.34,0],139.385,1,0,[],"","",false,false], 
	["Land_CinderBlocks_F",[5.76489,-102.02,0],195.073,1,0,[],"","",false,false], 
	["Land_Pallet_vertical_F",[7.45288,-102.454,0],244.294,1,0,[],"","",false,false], 
	["Land_Pallets_stack_F",[8.47729,-102.393,0.268244],144.273,1,0,[],"","",false,false], 
	["Land_Bricks_V3_F",[10.032,-102.293,0],257.058,1,0,[],"","",false,false], 
	["Land_CinderBlocks_F",[6.69263,-103.231,0],279.9,1,0,[],"","",false,false], 
	["Land_Garbage_square5_F",[8.02002,-103.948,0],0,1,0,[],"","",false,false], 
	["Land_GarbagePallet_F",[8.39648,-103.822,0],330,1,0,[],"","",false,false], 
	["MetalBarrel_burning_F",[5.10718,-104.519,0],0,1,0,[],"","",true,false]
];
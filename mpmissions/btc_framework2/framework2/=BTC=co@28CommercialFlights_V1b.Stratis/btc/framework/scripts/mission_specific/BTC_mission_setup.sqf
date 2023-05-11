/* ----------------------------------------------------------------------------
Function: btc_missionsetup.sqf

Description:
    Several mission parameters are stored here
Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"

 //FPS test
GVAR(FPSTestPos) = 
["Stratis",[3215.78,6146.29,112.737],243.368,0.75,[-21.3889,0],0,0,720.021,0.3,0,1,0,1];
//["Malden",[7444.11,7605.45,133.283],328.93,0.75,[-24.9846,0],0,0,720.001,0.3,0,1,0,1];

if (!isDedicated && hasInterface) then {
    [burn_1,burn_2,burn_3,burn_4,burn_5,burn_6,burn_7,burn_8,burn_9] apply {_x call FUNC(burnObject)};
};

if(isServer) then {
    setDate [2020, 5, 7, GVAR(DATE), 0]; //[year, month, day, hour, minute]

    //CIV and Traffic
    GVAR(civ_blacklist) = ["civ_blacklist_1"]; //No civilians inside these areas
    GVAR(traffic_blacklist) = []; //No traffic inside these areas
    GVAR(city_blacklist) = []; //No locations inside these areas

    //Enemy module setup
    //FACTIONS: 0-CSAT, 1-NATO, 2-INDEPENDENT, 3-EAST TALIBAN RHS, 4-EAST ISS RHS, 5-INDEPENDENT BIS LDF, 6-INDEPENDENT BIS LDF SCIENTISTS + CBRN, 7-INDEPENDENT SERBIAN, 8-INDEPENDENT BANDITS, 9-INDEPENDENT SYNDIKAT
    //10-BLACK SUN
    /*[
        [
            [Trigger_1, Trigger_2, ...],
            [
                1-  [# of Groups in Houses, # of Units in Group(Default 1), Probability(Default 1=100%)],
                2-  [# of Patrols, # of Units in Patrols, Probability],
                3-  [# of Light Vehicles, # of Units inside, Probability],
                4-  [# of Armoured Vehicles, # of Units inside, Probability], 
                5-  [# of Statics, # of Units inside, Probability],
                6-  [# of Helicopters, # of Units inside, Probability]
            ]
            [# Faction, Extra Activation Distance] 
        ],
        [
            [Trigger_3, Trigger_4, ...], [...]
        ]...
    ]*/
    GVAR(EnemySpawn) = 
    [
        [
            [zone_S_1,zone_S_2,zone_S_3,zone_S_4], [[2,3], [4,2], [1,5,0.2], [1,0.5], [1,0.5]], [10,800]
        ],
        [
            [zone_M_1,zone_M_2,zone_M_3,zone_M_4,zone_M_5], [[5,3], [5,3], [2,5], [2,0.8], [1], [1,1,0.2]], [10,800]
        ]
    ];

    if(GVAR(DEBUG_LOG)) then {
        GVAR(EnemySpawn) pushBack [[zone_FPSTest_1], [[5,3], [5,3], [2,5], [2]], [1,800]]
    };
};
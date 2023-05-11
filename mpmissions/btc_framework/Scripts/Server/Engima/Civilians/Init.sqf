btc_engima_enemy_cqb_group = grpNull;

// Set Civilian parameters.
private _unitClasses = call { //Edit these to change civilian unit classes
    if (BTC_Civ==1) exitWith {
        ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"]
    };
    if (BTC_Civ==2) exitWith { ["C_ISCCivs_Civ_1_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_2_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_3_01","C_ISCCivs_Civ_4_01","C_ISCCivs_Civ_5_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_6_01","C_ISCCivs_Civ_7_01","LOP_Tak_Civ_Random","C_ISCCivs_Civ_8_01","C_ISCCivs_Civ_9_01","C_ISCCivs_Civ_10_01","C_ISCCivs_Civ_11_01","C_ISCCivs_Civ_12_01","LOP_Tak_Civ_Random"] };
    if (BTC_Civ==3) exitWith { ["RDS_Villager_random","RDS_woodlander_random"] };
    if (BTC_Civ==4) exitWith { ["C_man_p_beggar_F_afro","C_Man_casual_1_F_afro","C_Man_casual_2_F_afro","C_Man_casual_3_F_afro"] };
    [] //leave this at the bottom, return empty, function will deal with empty array
};

private _enemyUnitData = call { //Edit these to change enemy civilian unit classes and weapon classes
    if (BTC_Civ==1) exitWith {[["C_man_hunter_1_F"],["rhs_weap_akms_folded"]]};
    if (BTC_Civ==2) exitWith {[["LOP_Tak_Civ_Random"], ["rhs_weap_akms_folded"]]};
    if (BTC_Civ==3) exitWith {[["LOP_Tak_Civ_Random"],["rhs_weap_akms_folded"]]};
    if (BTC_Civ==4) exitWith {[["C_man_hunter_1_F"],["rhs_weap_akms_folded"]]};
    []
};

private _fnc_OnSpawnCallback = {
    if(BTC_ENEMY_CQB) then {
        if(isNull btc_engima_enemy_cqb_group) then {_this call BTC_ENGIMA_Enemy_CQB_Spawn};
    };
};
private _fnc_OnRemoveCallback = {
    if(BTC_ENEMY_CQB) then {
        if (_this getVariable ["isBTC_ENGIMA_Enemy_CQB",false]) then {_this call BTC_ENGIMA_Enemy_CQB_deSpawn};
    };
};

private _blackListMarkers = ["civ_blacklist_1"];
// Run script.
[
    ["UNIT_CLASSES", _unitClasses],
    ["ENEMY_UNIT_CLASSES",_enemyUnitData],
    ["UNITS_PER_BUILDING", 0.1],
    ["MAX_GROUPS_COUNT", 20],
    ["MIN_SPAWN_DISTANCE", 50],
    ["MAX_SPAWN_DISTANCE", 300],
    ["BLACKLIST_MARKERS", _blackListMarkers],
    ["HIDE_BLACKLIST_MARKERS", true],
    ["ON_UNIT_SPAWNED_CALLBACK", _fnc_OnSpawnCallback],
    ["ON_UNIT_REMOVE_CALLBACK", _fnc_OnRemoveCallback],
    ["DEBUG", false]
] spawn ENGIMA_CIVILIANS_StartCivilians;

[
    "VCM_ActivateAI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Vcom Active", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_ActivateAI = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_Debug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Debug Mode. Mostly systemchat messages.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	false,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_Debug = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_SIDEENABLED", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Sides impacted by Vcom.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[[1,0,2],[1,0],[1],[0],[2],[2,1],[2,0]],[["West, East, Resistance"],["West, East"],["West"],["East"],["Resistance"],["Resistance, West"],["Resistance, East"]],0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        VCM_SIDEENABLED = _this apply {[_x] call BIS_fnc_sideType};
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_ARTYENABLE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable AI use of Artillery", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_ARTYENABLE = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_ARTYSIDES", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Sides that will use FFE/VCOM Artillery", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[[1,0,2],[1,0],[1],[0],[2],[2,1],[2,0]],[["West, East, Resistance"],["West, East"],["West"],["East"],["Resistance"],["Resistance, West"],["Resistance, East"]],0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        VCM_ARTYSIDES = _this apply {[_x] call BIS_fnc_sideType};
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_StealVeh", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AI steal empty/unlocked vehicles?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_StealVeh = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_ADVANCEDMOVEMENT", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AI generate new waypoints to flank.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_ADVANCEDMOVEMENT = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_FRMCHANGE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AI change formations based on location.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_FRMCHANGE = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;


[
    "VCM_AIDISTANCEVEHPATH", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Distance AI will steal vehicles from.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1000,100,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AIDISTANCEVEHPATH = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_RAGDOLL", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AI Ragdoll when hit?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_RAGDOLL = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_RAGDOLLCHC", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Chance for AI to ragdoll when hit.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,100,50,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_RAGDOLLCHC = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_HEARINGDISTANCE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Distance AI can hear gunfire.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1500,800,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_HEARINGDISTANCE = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_WARNDIST", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Distance AI will call for reinforcements from.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,2500,1000,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_WARNDIST = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_WARNDELAY", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Time (seconds) AI wait before support called.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,300,30,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_WARNDELAY = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_STATICARMT", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Time (seconds) AI stay on unarmed Static Weapons", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,10000,300,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_STATICARMT = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_MINECHANCE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["AI mine placing chance", "This is checked every 30 seconds while in combat. 0 = disabled"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,100,10,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_MINECHANCE = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_ARTYDELAY", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Delay before artillery requests. SIDE BASED.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,5000,300,0], // data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_ARTYDELAY = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AIMagLimit", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Mag count AI begin to look for additional mags.","Set to 0 to disable"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,5,2,0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AIMagLimit = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////VCOM Driving Settings////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

[
    "VCM_DrivingActivated", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Enhanced AI Driving (Experimental)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM DRIVING", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	false,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        VCM_DrivingActivated = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_DrivingDist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Distance to search for obstacles", "How far from predicted position to search for obstacles. Predicted position varies depending on vehicle speed."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM DRIVING", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5,30,10,1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        VCM_DrivingDist = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////AI SKILL SETTINGS////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

[
    "VCM_SKILLCHANGE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AI impacted by Vcom skill settings.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	  true,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_SKILLCHANGE = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_SIDESPECIFICSKILL", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Side Specific Skill Parameters", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	  true,// data for this setting:
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_SIDESPECIFICSKILL = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

//Aiming Accuracy
[
    "VCM_AISKILL_AIMINGACCURACY_W", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Accuracy (West)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.25,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGACCURACY_W = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AISKILL_AIMINGACCURACY_E", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Accuracy (East)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.25,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGACCURACY_E = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AISKILL_AIMINGACCURACY_R", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Accuracy (Ind)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.25,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGACCURACY_R = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

//Aiming Shake
[
    "VCM_AISKILL_AIMINGSHAKE_W", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Shake (West)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.15,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGSHAKE_W = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AISKILL_AIMINGSHAKE_E", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Shake (East)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.15,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGSHAKE_E = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AISKILL_AIMINGSHAKE_R", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Shake (Ind)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.15,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGSHAKE_R = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

//Aiming Speed
[
    "VCM_AISKILL_AIMINGSPEED_W", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Speed (West)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.35,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGSPEED_W = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AISKILL_AIMINGSPEED_E", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Speed (East)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.35,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGSPEED_E = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "VCM_AISKILL_AIMINGSPEED_R", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "AI Aiming Speed (Ind)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VCOM SKILL SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0,1,0.35,3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        VCM_AISKILL_AIMINGSPEED_R = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

diag_log "VCOM: Loaded CBA settings";

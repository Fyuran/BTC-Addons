/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then {

    //COMMON
    btc_fnc_randomize_pos = compileScript ["core\fnc\common\randomize_pos.sqf"];
    btc_fnc_findsafepos = compileScript ["core\fnc\common\findsafepos.sqf"];
    btc_fnc_road_direction = compileScript ["core\fnc\common\road_direction.sqf"];

    //EXT_IED functions adapted for use without H&M framework
    btc_EXT_ied_fnc_Area = compileScript ["core\fnc\EXT_ied\area.sqf"];
    btc_EXT_ied_fnc_randomRoadPos = compileScript ["core\fnc\EXT_ied\randomRoadPos.sqf"];
    btc_EXT_ied_fnc_checkLoop = compileScript ["core\fnc\EXT_ied\checkLoop.sqf"];
    btc_EXT_ied_fnc_create = compileScript ["core\fnc\EXT_ied\create.sqf"];
    btc_EXT_ied_fnc_fired_near = compileScript ["core\fnc\EXT_ied\fired_near.sqf"];
    btc_EXT_ied_fnc_boom = compileScript ["core\fnc\EXT_ied\boom.sqf"];
        //Effects
        btc_EXT_deaf_fnc_earringing = compileScript ["core\fnc\EXT_ied\effects\earringing.sqf"];
};

/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\

//EXT_IED
//btc_ied_fnc_belt = compileScript ["core\fnc\ied\belt.sqf"];
//DEBUG
btc_debug_fnc_message = compileScript ["core\fnc\debug\message.sqf"];

/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
   
    //DEBUG
    btc_debug_fnc_marker = compileScript ["core\fnc\debug\marker.sqf"];

    //EXT_IED
        //Effects
        btc_EXT_ied_fnc_effect_blurEffect = compileScript ["core\fnc\EXT_ied\effects\effect_blurEffect.sqf"];
        btc_EXT_ied_fnc_effect_color_smoke = compileScript ["core\fnc\EXT_ied\effects\effect_color_smoke.sqf"];
        btc_EXT_ied_fnc_effect_rocks = compileScript ["core\fnc\EXT_ied\effects\effect_rocks.sqf"];
        btc_EXT_ied_fnc_effect_shock_wave = compileScript ["core\fnc\EXT_ied\effects\effect_shock_wave.sqf"];
        btc_EXT_ied_fnc_effect_smoke = compileScript ["core\fnc\EXT_ied\effects\effect_smoke.sqf"];
        btc_EXT_ied_fnc_effects = compileScript ["core\fnc\EXT_ied\effects\effects.sqf"];

};
/////////////////////HEADLESS\\\\\\\\\\\\\\\\\\\\\
  
if (!hasInterface && !isDedicated) then {
};

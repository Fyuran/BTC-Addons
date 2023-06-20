class Params {
     class btc_p_IED_title { // << IED options >>
        title = "<< IED options >>";
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_ied { // IEDs ratio:
        title = __EVAL(format ["      %1", "IED ratio:"]);
        values[]={0, 1, 2, 3};
        texts[]={$STR_DISABLED,$STR_A3_TIME_TRIALS_MISCTT_ROF_25,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL,$STR_A3_TIME_TRIALS_MISCTT_ROF_21}; //texts[]={"Off","Low","Normal","High"};
        default = 2;
    };
    class btc_p_ied_spot { // IEDs spotting difficulty:
        title = __EVAL(format ["      %1", "IED Spotting difficulty:"]);
        values[]={0, 1, 2};
        texts[]={"Very easy","Easy",$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL}; //texts[]={"Very easy","Easy","Normal"};
        default = 2;
    };
    class btc_p_ied_placement { // IEDs type of placement:
        title = __EVAL(format ["      %1", "IEDs type of placement:"]);
        values[]={2, -1, 3};
        texts[]={"Roadside","Middle",$STR_3DEN_ATTRIBUTES_OBJECTTEXTURE_RANDOM_TEXT}; //texts[]={"Roadside", "Middle", "Random"};
        default = 3;
    };
	class btc_p_ied_power { // Power of IED explosion:
        title = __EVAL(format ["      %1", "Power of IED explosion:"]);
        values[]={0, 1};
        texts[]={$STR_MEDIUM,$STR_SMALL};
        default = 0;
	};
    class btc_p_ied_drone { // Drone bomber:
        title = __EVAL(format ["      %1", "Drone bomber:"]);
        values[]={0, 1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_main_title { // << Other options >>
        title = "<< Other options >>";
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_debug { // Debug:
        title = __EVAL(format ["      %1", "DEBUG Options"]);
        values[]={0,1,2};
        texts[]={$STR_DISABLED,$STR_ENABLED, "Log Only"}; // texts[]={"Off","On","Log only"};
        default = 1;
    };
};

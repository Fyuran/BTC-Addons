class database_disclaimer_gui {
	idd = 19339;
	MovingEnable = false;
	onLoad = "playSound 'btc_sound_bombdefusal_release'";
	onUnload = "playSound 'btc_sound_bombdefusal_cancel'";
	class controls{
		class btc_database_frame: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.294,0.325,0.125,1)";
			x = 0.29375 * safezoneWAbs + safezoneXAbs;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.4125 * safezoneWAbs;
			h = 0.22 * safezoneH;
		};
		class btc_database_warning_text: RscText
		{
			idc = 1000;
			text = "WARNING:";
			x = 0.45875 * safezoneWAbs + safezoneXAbs;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneWAbs;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
			style = 0x02;
			sizeEx = 2 * GUI_GRID_H;
		};
		class btc_database_info_text: RscText
		{
			idc = 1001;
			text = "";
			x = 0.298906 * safezoneWAbs + safezoneXAbs;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.402187 * safezoneWAbs;
			h = 0.077 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
			style = 0x10;
			sizeEx = 1 * GUI_GRID_H;
			onLoad = "_text = player getVariable ['database_gui_event_text','ERROR'];(_this select 0) ctrlSetText _text";
		};
		class btc_database_confirm: RscButton
		{
			idc = -1;
			text = "ACCEPT";
			x = 0.340156 * safezoneWAbs + safezoneXAbs;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneWAbs;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.5,0,1};
			colorActive[] = {0,1,0,1};
			style = 0x02;
			sizeEx = 1 * GUI_GRID_H;
			onButtonClick = "_event = (ctrlParent (_this select 0)) getVariable ['database_gui_event',['']]; _event call CBA_fnc_serverEvent; CloseDialog 1; hint 'Database changed'";
		};
		class btc_database_decline: RscButton
		{
			idc = -1;
			text = "DECLINE";
			x = 0.62375 * safezoneWAbs + safezoneXAbs;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneWAbs;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,1};
			colorActive[] = {1,0,0,1};
			style = 0x02;
			sizeEx = 1 * GUI_GRID_H;
			onButtonClick = "CloseDialog 1;";
		};
	};
};
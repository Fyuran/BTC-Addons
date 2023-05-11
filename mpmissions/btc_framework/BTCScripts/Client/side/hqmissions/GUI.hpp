class btc_hqmissions_gui {
	idd = 19340;
	MovingEnable = false;
	onLoad = "playSound 'btc_sound_bombdefusal_release'";
	onUnload = "playSound 'btc_sound_bombdefusal_cancel'";
	class controls{
		class btc_RscInterlacing: RscInterlacingScreen {
			idc = 1507;
			x = 0.381406 * safeZoneWAbs + safeZoneXAbs;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.242344 * safeZoneWAbs;
			h = 0.44 * safezoneH;
		};
		class btc_RscLeftListBox: RscListbox {
			idc = 1500;
			onLoad = "_this call btc_fnc_side_hqmissions_fillList";
			x = 0.448438 * safeZoneWAbs + safeZoneXAbs;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.113437 * safeZoneWAbs;
			h = 0.352 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0.5,0,0.3};
		};
		class btc_RscLeftButton: RscButton {
			idc = 1503;
			text = "START";
			onButtonClick = "_this call btc_fnc_side_hqmissions_startMission";
			x = 0.587656 * safeZoneWAbs + safeZoneXAbs;
			y = 0.639 * safezoneH + safezoneY;
			w = 0.0309375 * safeZoneWAbs;
			h = 0.044 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0.5,0,0.3};
		};
		class btc_RscLeftRscText: RscText {
			idc = 1505;
			text = "LIST OF MISSIONS"; 
			style = 0x02;
			x = 0.448438 * safeZoneWAbs + safeZoneXAbs;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.113437 * safeZoneWAbs;
			h = 0.022 * safezoneH;
			colorText[] = {0,1,0,1};
		};
	};
	class controlsBackground {
		class btc_RscPicture: RscPicture {
			idc = 1508;
			text = "BTCScripts\Client\side\hqmissions\hqmissions_background.paa";
			x = 0.381406 * safeZoneWAbs + safeZoneXAbs;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.242344 * safeZoneWAbs;
			h = 0.44 * safezoneH;
		};
	};
};

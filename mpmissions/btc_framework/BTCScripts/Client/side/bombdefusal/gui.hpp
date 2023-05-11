#include "defines.hpp"

class bombdefusal_gui {
	idd = 19338;
	MovingEnable = false;
	onLoad = "playSound 'btc_sound_bombdefusal_release'";
	onUnload = "playSound 'btc_sound_bombdefusal_cancel'";
	class controls{
		class first_digit: RscText
		{
			idc = 1000;
			text = "0";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.077 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0,0,0,1};
			sizeEx = 5 * GUI_GRID_H;
		};
		class second_digit: RscText
		{
			idc = 1001;
			text = "0";
			style = ST_CENTER;
			x = 0.4845325 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 5 * GUI_GRID_H;
		};
		class third_digit: RscText
		{
			idc = 1002;
			text = "0";
			style = ST_CENTER;
			x = 0.509281 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 5 * GUI_GRID_H;
		};
		class fourth_digit: RscText
		{
			idc = 1003;
			text = "0";
			style = ST_CENTER;
			x = 0.5325063 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 5 * GUI_GRID_H;
		};
		class first_digit_minus: btc_side_bombdefusal_RscButton
		{
			idc = 1605;
			text = "-";
			x = 0.465968 * safezoneW + safezoneX;
			y = 0.5325 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[0,false] call btc_fnc_side_bombdefusal_gui_digit"; //[0,false] 0: first digit, false: it's a minus
		};
		class first_digit_plus: btc_side_bombdefusal_RscButton
		{
			idc = 1606;
			text = "+";
			x = 0.465968 * safezoneW + safezoneX;
			y = 0.433 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[0,true] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class second_digit_plus: btc_side_bombdefusal_RscButton
		{
			idc = 1607;
			text = "+";
			x = 0.49278 * safezoneW + safezoneX;
			y = 0.433 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[1,true] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class second_digit_minus: btc_side_bombdefusal_RscButton
		{
			idc = 1608;
			text = "-";
			x = 0.492782 * safezoneW + safezoneX;
			y = 0.5325 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[1,false] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class third_digit_minus: btc_side_bombdefusal_RscButton
		{
			idc = 1609;
			text = "-";
			x = 0.5175325 * safezoneW + safezoneX;
			y = 0.5325 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[2,false] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class third_digit_plus: btc_side_bombdefusal_RscButton
		{
			idc = 1610;
			text = "+";
			x = 0.5175325 * safezoneW + safezoneX;
			y = 0.433 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[2,true] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class fourth_digit_minus: btc_side_bombdefusal_RscButton
		{
			idc = 1611;
			text = "-";
			x = 0.543308 * safezoneW + safezoneX;
			y = 0.5325 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[3,false] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class fourth_digit_plus: btc_side_bombdefusal_RscButton
		{
			idc = 1612;
			text = "+";
			x = 0.543312 * safezoneW + safezoneX;
			y = 0.433 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			onButtonClick = "[3,true] call btc_fnc_side_bombdefusal_gui_digit";
		};
		class text_timer: RscText
		{
			idc = 1006;
			text = "TIME:";
			style = ST_CENTER;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class left_timer: RscText
		{
			idc = 1007;
			text = "00";
			style = ST_CENTER;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class right_timer: RscText
		{
			idc = 1008;
			text = "00";
			style = ST_CENTER;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0206251 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class separator_timer: RscText
		{
			idc = 1009;
			text = ":";
			style = ST_CENTER;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class Accept: btc_side_bombdefusal_RscButton
		{
			idc = 1600;
			text = "ACCEPT";
			style = ST_CENTER;
			x = 0.580438 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0242 * safezoneH;
			colorBackground[] = {0,1,0,1};
			onButtonClick = "[] call btc_fnc_side_bombdefusal_gui_accept";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class Clear: btc_side_bombdefusal_RscButton
		{
			idc = 1601;
			text = "CLEAR";
			style = ST_CENTER;
			x = 0.580438 * safezoneW + safezoneX;
			y = 0.4912 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0242 * safezoneH;
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] call btc_fnc_side_bombdefusal_gui_clear";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		/*
		class first_digit_red: btc_side_bombdefusal_RscButton
		{
			idc = 1602;

			text = "R";
			x = 0.465969 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
			colorActive[] = {1,0,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1000) ctrlSetTextColor [1,0,0,1];((ctrlParent (_this select 0)) displayCtrl 1000) setVariable['bombdefusal_digit_color',[1,0,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class first_digit_green: btc_side_bombdefusal_RscButton
		{
			idc = 1603;

			text = "G";
			x = 0.465969 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.5,0,1};
			colorActive[] = {0,1,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1000) ctrlSetTextColor [0,1,0,1];((ctrlParent (_this select 0)) displayCtrl 1000) setVariable['bombdefusal_digit_color',[0,1,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class first_digit_blue: btc_side_bombdefusal_RscButton
		{
			idc = 1604;

			text = "B";
			x = 0.465969 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0.5,1};
			colorActive[] = {0,0,1,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1000) ctrlSetTextColor [0,0,1,1];((ctrlParent (_this select 0)) displayCtrl 1000) setVariable['bombdefusal_digit_color',[0,0,1,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class second_digit_red: btc_side_bombdefusal_RscButton
		{
			idc = 1602;

			text = "R";
			x = 0.492782 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
			colorActive[] = {1,0,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1001) ctrlSetTextColor [1,0,0,1];((ctrlParent (_this select 0)) displayCtrl 1001) setVariable['bombdefusal_digit_color',[1,0,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class second_digit_green: btc_side_bombdefusal_RscButton
		{
			idc = 1603;

			text = "G";
			x = 0.49278 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.5,0,1};
			colorActive[] = {0,1,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1001) ctrlSetTextColor [0,1,0,1];((ctrlParent (_this select 0)) displayCtrl 1001) setVariable['bombdefusal_digit_color',[0,1,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class second_digit_blue: btc_side_bombdefusal_RscButton
		{
			idc = 1604;

			text = "B";
			x = 0.49278 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0.5,1};
			colorActive[] = {0,0,1,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1001) ctrlSetTextColor [0,0,1,1];((ctrlParent (_this select 0)) displayCtrl 1001) setVariable['bombdefusal_digit_color',[0,0,1,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class third_digit_red: btc_side_bombdefusal_RscButton
		{
			idc = 1602;

			text = "R";
			x = 0.517532 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
			colorActive[] = {1,0,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1002) ctrlSetTextColor [1,0,0,1];((ctrlParent (_this select 0)) displayCtrl 1002) setVariable['bombdefusal_digit_color',[1,0,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class third_digit_green: btc_side_bombdefusal_RscButton
		{
			idc = 1603;

			text = "G";
			x = 0.517532 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.5,0,1};
			colorActive[] = {0,1,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1002) ctrlSetTextColor [0,1,0,1];((ctrlParent (_this select 0)) displayCtrl 1002) setVariable['bombdefusal_digit_color',[0,1,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class third_digit_blue: btc_side_bombdefusal_RscButton
		{
			idc = 1604;

			text = "B";
			x = 0.517531 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0.5,1};
			colorActive[] = {0,0,1,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1002) ctrlSetTextColor [0,0,1,1];((ctrlParent (_this select 0)) displayCtrl 1002) setVariable['bombdefusal_digit_color',[0,0,1,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class fourth_digit_red: btc_side_bombdefusal_RscButton
		{
			idc = 1602;

			text = "R";
			x = 0.543312 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
			colorActive[] = {1,0,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1003) ctrlSetTextColor [1,0,0,1];((ctrlParent (_this select 0)) displayCtrl 1003) setVariable['bombdefusal_digit_color',[1,0,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class fourth_digit_green: btc_side_bombdefusal_RscButton
		{
			idc = 1603;

			text = "G";
			x = 0.543313 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.5,0,1};
			colorActive[] = {0,1,0,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1003) ctrlSetTextColor [0,1,0,1];((ctrlParent (_this select 0)) displayCtrl 1003) setVariable['bombdefusal_digit_color',[0,1,0,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};
		class fourth_digit_blue: btc_side_bombdefusal_RscButton
		{
			idc = 1604;

			text = "B";
			x = 0.543312 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0.5,1};
			colorActive[] = {0,0,1,1};
			onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 1003) ctrlSetTextColor [0,0,1,1];((ctrlParent (_this select 0)) displayCtrl 1003) setVariable['bombdefusal_digit_color',[0,0,1,1]];playSound 'btc_sound_bombdefusal_rollover';";
			//onLoad = "if !('ACE_DefusalKit' in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {(_this select 0) ctrlShow false};";
		};*/
	};
};

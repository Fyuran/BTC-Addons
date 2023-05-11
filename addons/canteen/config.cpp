#define item_xx(a,b) class _xx_##a {name = a; count = b;}
/*
PREP MACRO ’\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\fnc_<FNC>.sqf’
ADDON is already defined by CBA(PREFIX,COMPONENT)
*/
#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		name = "=BTC= Water Bottle & Canteen stamina regain";
		author = "=BTC= Black Templars Clan";
        authors[] = {"=BTC=Fyuran"};
		units[] = {"ACE_WaterBottle_Nearly_Empty_Item", "ACE_Canteen_Nearly_Empty_Item","ACE_Canteen_Nearly_Full_Item"};
		url = "http://www.blacktemplars.altervista.org";
		requiredVersion = 0.1;
		weapons[] = {"ACE_WaterBottle_Nearly_Empty","ACE_Canteen_Nearly_Empty","ACE_Canteen_Nearly_Full"};
		requiredAddons[] = {"ace_advanced_fatigue","ace_interaction","ace_medical_feedback","acex_field_rations"};
	};
};

class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
	class ACE_ItemCore;
	
	class ACE_WaterBottle;
	class ACE_WaterBottle_Half: ACE_WaterBottle {
        displayName = "$STR_acex_field_rations_WaterBottleHalf_DisplayName";
        descriptionShort = "$STR_acex_field_rations_WaterBottleHalf_Description";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_replacementItem = "ACE_WaterBottle_Nearly_Empty";
        acex_field_rations_refillItem = "ACE_WaterBottle";
        acex_field_rations_refillAmount = 0.5;
        acex_field_rations_refillTime = 8;
    };
	class ACE_WaterBottle_Nearly_Empty: ACE_WaterBottle {
        displayName = "Water Bottle (Nearly-Empty)";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
        acex_field_rations_replacementItem = "ACE_WaterBottle_Empty";
        acex_field_rations_refillItem = "ACE_WaterBottle_Half";
        acex_field_rations_refillAmount = 0.25;
		acex_field_rations_refillTime = 8;
	};
	
	class ACE_Canteen: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_acex_field_rations_Canteen_DisplayName";
        descriptionShort = "$STR_acex_field_rations_Canteen_Description";
        model = "\a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_canteen_co.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 10;
        acex_field_rations_consumeText = "$STR_ACEX_Field_Rations_DrinkingFromX";
        acex_field_rations_replacementItem = "ACE_Canteen_Nearly_Full";
        acex_field_rations_consumeAnims[] = {"acex_field_rations_drinkStand", "acex_field_rations_drinkCrouch", "acex_field_rations_drinkProne"};
        acex_field_rations_consumeSounds[] = {"acex_field_rations_drink1", "acex_field_rations_drink1", "acex_field_rations_drink2"};
    };
	class ACE_Canteen_Nearly_Full: ACE_Canteen {
        displayName = "Canteen (Nearly-Full)";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
        acex_field_rations_replacementItem = "ACE_Canteen_Half";
        acex_field_rations_refillItem = "ACE_Canteen";
        acex_field_rations_refillAmount = 0.75;
		acex_field_rations_refillTime = 8;
	};
	class ACE_Canteen_Half: ACE_Canteen {
        displayName = "$STR_acex_field_rations_CanteenHalf_DisplayName";
        descriptionShort = "$STR_acex_field_rations_CanteenHalf_Description";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_replacementItem = "ACE_Canteen_Nearly_Empty";
        acex_field_rations_refillItem = "ACE_Canteen";
        acex_field_rations_refillAmount = 0.5;
        acex_field_rations_refillTime = 8;
    };

	class ACE_Canteen_Nearly_Empty: ACE_Canteen {
        displayName = "Canteen (Nearly-Empty)";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
        acex_field_rations_replacementItem = "ACE_Canteen_Empty";
        acex_field_rations_refillItem = "ACE_Canteen";
        acex_field_rations_refillAmount = 0.25;
		acex_field_rations_refillTime = 8;
	};
};

class CfgVehicles {
	class Item_Base_F;
    class ACE_WaterBottle_Nearly_Empty_Item: Item_Base_F {
        author = "=BTC=Fyuran";
        scope = 2;
        scopeCurator = 2;
        displayName = "Water Bottle (Nearly-Empty)";
        vehicleClass = "Items";
        class TransportItems {
			item_xx(ACE_WaterBottle_Nearly_Empty,1);
        };
    };
	class ACE_Canteen_Nearly_Full_Item: ACE_WaterBottle_Nearly_Empty_Item {
        displayName = "Canteen (Nearly-Full)";
        class TransportItems {
			item_xx(ACE_Canteen_Nearly_Full,1);
        };
    };
	class ACE_Canteen_Nearly_Empty_Item: ACE_WaterBottle_Nearly_Empty_Item {
        displayName = "Canteen (Nearly-Empty)";
        class TransportItems {
			item_xx(ACE_Canteen_Nearly_Empty,1);
        };
    };
	
	class LandVehicle;
	class Car: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				class btc_ace_Actions {
					displayName = "BTC Menu";
					condition = "";
					exceptions[] = {};
					statement = "";
					priority = 2.1;
					icon = "\z\btc\addons\canteen\data\btc_ace_actions_icon.paa";
					class GVAR(WaterBottle) {
						displayName = "Refill Water Bottle (Half)";
						condition = "'ACE_WaterBottle_Half' in items _player";
						exceptions[] = {};
						icon = "\z\btc\addons\canteen\data\item_waterbottle_refill_icon.paa";
						statement = QUOTE(['ACE_WaterBottle_Half'] call FUNC(Refill));
					};
					class GVAR(WaterBottle_a): GVAR(WaterBottle) {
						displayName = "Refill Water Bottle (Nearly-Empty)";
						condition = "'ACE_WaterBottle_Nearly_Empty' in items _player";
						statement = QUOTE(['ACE_WaterBottle_Nearly_Empty'] call FUNC(Refill));
					};
					class GVAR(WaterBottle_b): GVAR(WaterBottle) {
						displayName = "Refill Water Bottle (Empty)";
						condition = "'ACE_WaterBottle_Empty' in items _player";
						statement = QUOTE(['ACE_WaterBottle_Empty'] call FUNC(Refill));
					};
					
					class GVAR(Canteen) {
						displayName = "Refill Canteen (Nearly-Full)";
						condition = "'ACE_Canteen_Nearly_Full' in items _player";
						exceptions[] = {};
						icon = "\z\btc\addons\canteen\data\item_canteen_refill_icon.paa";
						statement = QUOTE(['ACE_Canteen_Nearly_Full'] call FUNC(Refill));
					};
					class GVAR(Canteen_a): GVAR(Canteen) {
						displayName = "Refill Canteen (Half)";
						condition = "'ACE_Canteen_Half' in items _player";
						statement = QUOTE(['ACE_Canteen_Half'] call FUNC(Refill));
					};
					class GVAR(Canteen_b): GVAR(Canteen) {
						displayName = "Refill Canteen (Nearly-Empty)";
						condition = "'ACE_Canteen_Nearly_Empty' in items _player";
						statement = QUOTE(['ACE_Canteen_Nearly_Empty'] call FUNC(Refill));
					};
					class GVAR(Canteen_c): GVAR(Canteen) {
						displayName = "Refill Canteen (Empty)";
						condition = "'ACE_Canteen_Empty' in items _player";
						statement = QUOTE(['ACE_Canteen_Empty'] call FUNC(Refill));
					};
				};
			};
		};
	};
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class btc_ace_Actions {
				displayName = "BTC Menu";
				condition = "";
				exceptions[] = {};
				statement = "";
				priority = 2.1;
				icon = "\z\btc\addons\canteen\data\btc_ace_actions_icon.paa";
				class GVAR(WaterBottle) {
					displayName = "Drink Water Bottle (Full)";
					condition = "'ACE_WaterBottle' in items _player";
					exceptions[] = {};
					icon = "\z\btc\addons\canteen\data\item_waterbottle_drink_icon.paa";
					statement = QUOTE(['ACE_WaterBottle'] call FUNC(Drink));
				};
				class GVAR(WaterBottle_a): GVAR(WaterBottle) {
					displayName = "Drink Water Bottle (Half)";
					condition = "'ACE_WaterBottle_Half' in items _player";
					statement = QUOTE(['ACE_WaterBottle_Half'] call FUNC(Drink));
				};
				class GVAR(WaterBottle_b): GVAR(WaterBottle) {
					displayName = "Drink Water Bottle (Nearly-Empty)";
					condition = "'ACE_WaterBottle_Nearly_Empty' in items _player";
					statement = QUOTE(['ACE_WaterBottle_Nearly_Empty'] call FUNC(Drink));
				};
				
				class GVAR(Canteen) {
					displayName = "Drink Canteen (Full)";
					condition = "'ACE_Canteen' in items _player";
					exceptions[] = {};
					icon = "\z\btc\addons\canteen\data\item_canteen_drink_icon.paa";
					statement = QUOTE(['ACE_Canteen'] call FUNC(Drink));
				};
				class GVAR(Canteen_a): GVAR(Canteen) {
					displayName = "Drink Canteen (Nearly-Full)";
					condition = "'ACE_Canteen_Nearly_Full' in items _player";
					statement = QUOTE(['ACE_Canteen_Nearly_Full'] call FUNC(Drink));
				};
				class GVAR(Canteen_b): GVAR(Canteen) {
					displayName = "Drink Canteen (Half)";
					condition = "'ACE_Canteen_Half' in items _player";
					statement = QUOTE(['ACE_Canteen_Half'] call FUNC(Drink));
				};
				class GVAR(Canteen_c): GVAR(Canteen) {
					displayName = "Drink Canteen (Nearly-Empty)";
					condition = "'ACE_Canteen_Nearly_Empty' in items _player";
					statement = QUOTE(['ACE_Canteen_Nearly_Empty'] call FUNC(Drink));
				};
			};
		};
	};
};
class CfgSounds {
	class GVAR(Drink_sound) {
		name = GVAR(Drink_sound);
		sound[] = {"\z\btc\addons\canteen\data\drink.ogg",2,1,15};
		titles[] = {};
	};
	class GVAR(Refill_sound) {
		name = GVAR(Refill_sound);
		sound[] = {"\z\btc\addons\canteen\data\pour.ogg",2,1,15};
		titles[] = {};
	};
};

class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};
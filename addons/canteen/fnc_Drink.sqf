/* ----------------------------------------------------------------------------
Function: btc_canteen_fnc_Drink

Description:
   Drinking unit will regain max ACE Stamina

Parameters:
	ACE_player: OBJECT

Returns:

Examples:
    (begin example)
		["ACE_Canteen"] call btc_canteen_fnc_Drink
    (end)

Author:
    Fyuran

---------------------------------------------------------------------------- */
#include "script_component.hpp"
if(!params[
	["_item","",[""]]
]) exitWith {ERROR_MSG(format["btc_canteen_fnc_Drink: bad params %1", _this])};

[5,	_this,
{
	_args params ["_item"];
	ace_advanced_fatigue_anreserve = 2300; //GVAR of ace_advanced_fatigue
	private _targets = ACE_player nearEntities ["CAManBase", 20];
	["ace_medical_feedback_forceSay3D", [ACE_player, QGVAR(Drink_sound), 20], _targets] call CBA_fnc_targetEvent;
	[format["You took a sip of %1.", getText(configFile >> "CfgWeapons" >> _item >> "DisplayName")], 2.5, ACE_player] call ace_common_fnc_displayTextStructured;
	ACE_player removeItem _item;
	_new_item = call {
		if(_item IsEqualTo "ACE_WaterBottle") exitWith {"ACE_WaterBottle_Half"};
		if(_item IsEqualTo "ACE_WaterBottle_Half") exitWith {"ACE_WaterBottle_Nearly_Empty"};
		if(_item IsEqualTo "ACE_WaterBottle_Nearly_Empty") exitWith {"ACE_WaterBottle_Empty"};
		
		if(_item IsEqualTo "ACE_Canteen") exitWith {"ACE_Canteen_Nearly_Full"};
		if(_item IsEqualTo "ACE_Canteen_Nearly_Full") exitWith {"ACE_Canteen_Half"};
		if(_item IsEqualTo "ACE_Canteen_Half") exitWith {"ACE_Canteen_Nearly_Empty"};
		if(_item IsEqualTo "ACE_Canteen_Nearly_Empty") exitWith {"ACE_Canteen_Empty"};
		""
	};
	ACE_player addItem _new_item;
}, {}, "Drinking"] call ace_common_fnc_progressBar;
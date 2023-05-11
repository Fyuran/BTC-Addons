
#ifndef VCM_FNC_PATH
	#define VCM_FNC_PATH btc\framework\extScripts\Vcom\Functions\VCM_Functions
	#define QUOTE(var1) #var1
	#define VCM_FN_PREFIX(var1) fn_##var1
	#define VCM_QPATHTOF(var1) QUOTE(VCM_FNC_PATH\VCM_FN_PREFIX(var1.sqf))
	#define VCM_FUNC(var1) VCM_fnc_##var1
	#define VCM_QFUNC(var1) QUOTE(VCM_FUNC(var1))
#endif

if !(GVAR(VCOM)) exitWith {};

VCM_fnc_compileFunction = {
	params [["_funcFile", "", [""]], ["_funcName", "", [""]]];

	private _cachedFunc = uiNamespace getVariable _funcName;
	#ifdef DISABLE_COMPILE_CACHE
		if (isNil "_cachedFunc") then {
			uiNamespace setVariable [_funcName, compile preprocessFileLineNumbers _funcFile];
			missionNamespace setVariable [_funcName, uiNamespace getVariable _funcName];
		} else {
			missionNamespace setVariable [_funcName, _cachedFunc];
		};
	#else
		if (isNil "_cachedFunc") then {
			uiNamespace setVariable [_funcName, compileFinal preprocessFileLineNumbers _funcFile];
			missionNamespace setVariable [_funcName, uiNamespace getVariable _funcName];
		} else {
			missionNamespace setVariable [_funcName, _cachedFunc];
		};
	#endif
};


[VCM_QPATHTOF(VcomInit), VCM_QFUNC(VcomInit)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(VcomInitClient), VCM_QFUNC(VcomInitClient)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(ActRearm), VCM_QFUNC(ActRearm)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(AIHIT), VCM_QFUNC(AIHIT)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(AIHIT), VCM_QFUNC(AIHIT)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ArmStatics), VCM_QFUNC(ArmStatics)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ArtyCall), VCM_QFUNC(ArtyCall)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(ArtyManage), VCM_QFUNC(ArtyManage)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(BoxNrst), VCM_QFUNC(BoxNrst)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(CheckArty), VCM_QFUNC(CheckArty)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(Classname), VCM_QFUNC(Classname)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ClearBuilding), VCM_QFUNC(ClearBuilding)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(ClstEmy), VCM_QFUNC(ClstEmy)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ClstObj), VCM_QFUNC(ClstObj)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ClstWarn), VCM_QFUNC(ClstWarn)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(EmptyStatic), VCM_QFUNC(EmptyStatic)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(EnemyArray), VCM_QFUNC(EnemyArray)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(FindCover), VCM_QFUNC(FindCover)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(FlankMove), VCM_QFUNC(FlankMove)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ForceMove), VCM_QFUNC(ForceMove)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(FriendlyArray), VCM_QFUNC(FriendlyArray)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(FrmChnge), VCM_QFUNC(FrmChnge)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(Garrison), VCM_QFUNC(Garrison)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(GarrisonLight), VCM_QFUNC(GarrisonLight)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(HasMine), VCM_QFUNC(HasMine)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(HealSelf), VCM_QFUNC(HealSelf)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(HearingAids), VCM_QFUNC(HearingAids)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(Heights), VCM_QFUNC(Heights)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(IRCHECK), VCM_QFUNC(IRCHECK)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(KitChk), VCM_QFUNC(KitChk)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(KnowAbout), VCM_QFUNC(KnowAbout)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(MedicalHandler), VCM_QFUNC(MedicalHandler)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(MedicHeal), VCM_QFUNC(MedicHeal)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(MineMonitor), VCM_QFUNC(MineMonitor)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(MinePlant), VCM_QFUNC(MinePlant)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(PackStatic), VCM_QFUNC(PackStatic)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(RearmSelf), VCM_QFUNC(RearmSelf)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(RMedics), VCM_QFUNC(RMedics)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(RStatics), VCM_QFUNC(RStatics)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(SatchelPlant), VCM_QFUNC(SatchelPlant)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(SquadExc), VCM_QFUNC(SquadExc)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(WyptChk), VCM_QFUNC(WyptChk)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(vehiclecommandeer), VCM_QFUNC(vehiclecommandeer)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(VehicleCheck), VCM_QFUNC(VehicleCheck)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(VehicleMove), VCM_QFUNC(VehicleMove)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(IsTransport), VCM_QFUNC(IsTransport)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(isFlatEmpty), VCM_QFUNC(isFlatEmpty)] call VCM_fnc_compileFunction;

[VCM_QPATHTOF(SniperList), VCM_QFUNC(SniperList)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(SniperEngage), VCM_QFUNC(SniperEngage)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(RangeEngage), VCM_QFUNC(RangeEngage)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(ClstKnwnEnmy), VCM_QFUNC(ClstKnwnEnmy)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(IsDriver), VCM_QFUNC(IsDriver)] call VCM_fnc_compileFunction;
		
[VCM_QPATHTOF(VehicleDetection), VCM_QFUNC(VehicleDetection)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(MovePrediction), VCM_QFUNC(MovePrediction)] call VCM_fnc_compileFunction;
[VCM_QPATHTOF(UpdateDrivers), VCM_QFUNC(UpdateDrivers)] call VCM_fnc_compileFunction;

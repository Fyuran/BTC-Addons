
/* ----------------------------------------------------------------------------
Function: CBA_mission_settings

Description:
    Adds [BTC] Framework Mission Settings to mission

Parameters:

Returns:

Examples:
    (begin example)
    (end)

Author:
    =BTC=Fyuran

---------------------------------------------------------------------------- */
/* 	_setting     - Unique setting name. Matches resulting variable name <STRING>
    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    _script      - Script to execute when setting is changed. (optional) <CODE>
    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL> */
LOG("CBA_mission_settings.sqf executed");

[
    QGVAR(INTRO), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Intro", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["[BTC] Framework Mission Settings", "Mission Settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        LOG_2("intro set from %1 to %2",GVAR(INTRO),_this);
        if (_this && {GVAR(DEBUG_LOG)}) exitWith {hint format["[BTC] Framework: Both Intro and Debug Logging are enabled when only one can be"]};
    }, // function that will be executed once on mission start and every time the setting is changed.
	true // Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    QGVAR(VCOM), //enable or disable VCOMAI, has server and client inits
    "CHECKBOX",
    "Enable VCOM",
	["[BTC] Framework Mission Settings", "Mission Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

/* [
    QGVAR(CAS), //enable or disable CAS module
    "CHECKBOX",
    "Enable VCOM",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    true,
    true,
    {}
] call CBA_fnc_addSetting; */

[
    QGVAR(ENEMY), //enable or disable enemy spawn
    "CHECKBOX",
    "Enable Enemy Spawn Module",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    true,
    true,
    {}, 
	true
] call CBA_fnc_addSetting;

[
    QGVAR(DEBUG_ENEMY), //enable or disable enemy spawn markers
    "CHECKBOX",
    "Show Enemy Spawn Module Markers",
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    false,
    true,
    {
        _trgs = missionNamespace getVariable [QGVAR(enTrgs), []];
        if(_this) then {
            if (_trgs isEqualTo []) exitWith {};
            _trgs apply {
                _trgPos = getPosASL _x;
                (TriggerArea _x) params ["_a", "_b"];
                _mkr_1 = [format["%1_loc_debug",_x], _trgPos, 
                "Icon", [1, 1], "TYPE:", "hd_dot", "COLOR:", "ColorOPFOR", "TEXT:", vehicleVarName _x, "PERSIST"] call CBA_fnc_createMarker;
                _mkr_2 = [format["%1_locn_debug",_x], _trgPos, 
                "Ellipse", [_a, _b], "COLOR:", "ColorOPFOR", "PERSIST"] call CBA_fnc_createMarker;
                _mkr_2 setMarkerAlpha 0.5;
                _mkr_2 setMarkerBrush "SolidBorder";
                _x setVariable [QGVAR(CBADebugMrks), [_mkr_1, _mkr_2]];
            };
        } else {
            _trgs apply {
                _mrks = _x getVariable [QGVAR(CBADebugMrks), []];
                _mrks apply {deleteMarker _x};
            };
        };
    }, 
	false
] call CBA_fnc_addSetting;

[
    QGVAR(DEBUG_CITIES), //enable or disable locations markers
    "CHECKBOX",
    "Show Locations Markers",
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    false,
    true,
    {
        _cities = missionNamespace getVariable [QGVAR(city_all), []];
        if(_this) then {
            if (_cities isEqualTo []) exitWith {};
            _cities apply {
                _cPos = getPosASL _x;
                (TriggerArea _x) params ["_a", "_b"];
                _mkr_1 = [format["%1_loc_debug",_x], _cPos, 
                "Icon", [1, 1], "TYPE:", "hd_dot", "COLOR:", "ColorBlack", "TEXT:", _x getVariable [QGVAR(name), ""], "PERSIST"] call CBA_fnc_createMarker;
                _mkr_2 = [format["%1_locn_debug",_x], _cPos, 
                "Ellipse", [_a, _b], "COLOR:", "ColorOrange", "PERSIST"] call CBA_fnc_createMarker;
                _mkr_2 setMarkerAlpha 0.5;
                _mkr_2 setMarkerBrush "SolidBorder";
                _x setVariable [QGVAR(CBADebugMrks), [_mkr_1, _mkr_2]];
            };
        } else {
            _cities apply {
                _mrks = _x getVariable [QGVAR(CBADebugMrks), []];
                _mrks apply {deleteMarker _x};
            };
        };
    }, 
	false
] call CBA_fnc_addSetting;

/* 
[
    QGVAR(GAIA), //enable or disable gaia
    "CHECKBOX",
    "Enable GAIA",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    true,
    true,
    {}, 
	true
] call CBA_fnc_addSetting; */

[
    QGVAR(city_extra_radius), //extra radius to Locations' triggerArea
    "SLIDER",
    "Locations extra radius(For Civs and Traffic)",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    [1,1000,300,0],
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(CIV), //enable or disable civilian spawn
    "CHECKBOX",
    "Enable Civilians",
    ["[BTC] Framework Mission Settings", "Civilians Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(TRAFFIC), //enable or disable traffic spawn
    "CHECKBOX",
    "Enable Traffic",
    ["[BTC] Framework Mission Settings", "Traffic Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(NCivs), //number of civilians per location
    "SLIDER",
    "Number of civilians per location",
    ["[BTC] Framework Mission Settings", "Civilians Settings"],
    [1,10,3,0],
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(Ntraffic), //number of traffic per location
    "SLIDER",
    "Number of traffic per location",
    ["[BTC] Framework Mission Settings", "Traffic Settings"],
    [1,10,1,0],
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(CIVTYPE), //0-EUR, 1-TAK, 2-RUS, 3-AFRO
    "LIST",
    "Type of Civilians and Traffic",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    [[0, 1, 2, 3], ["Europeans", "Takistani", "Russians", "Africans"], 0],
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(FPS), //enable or disable fps debug on map
    "CHECKBOX",
    "Show FPS Markers",
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(DEBUG_LOG), //enable or disable Debug logging
    "CHECKBOX",
    "Enable FPS Debug logging with fixed camera",
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    false,
    true,
    {
        LOG_2("Debug log set from %1 to %2",GVAR(DEBUG_LOG),_this);
        if (_this && {GVAR(INTRO)}) exitWith {hint format["[BTC] Framework: Both Intro and Debug Logging are enabled when only one can be"]};
    },
	true
] call CBA_fnc_addSetting;

[
    QGVAR(FPSTestDelay), //Change FPS Test Duration
    "SLIDER",
    "Change FPS Test Duration",
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    [30,300,90,0],
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(FPSInterval), //Change FPS logging interval
    "SLIDER",
    "How many seconds each diag_log fps",
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    [1,30,5,0],
    true,
    {},
	true
] call CBA_fnc_addSetting;


[
    QGVAR(DEBUG_DRAWICONS), //enable or disable Player drawIcon debug
    "CHECKBOX",
    ["Show unit icons on map", "includes god mode and on MapSingleClick teleportation"],
    ["[BTC] Framework Mission Settings", "Debug Settings"],
    false,
    true,
    {
        if(_this) then {
            _handle = missionNamespace getVariable [QGVAR(drawIconsHandle), -1];
            if(_handle != -1) exitWith {};
            player allowDamage false;
            GVAR(drawIconsHandle) = addMissionEventHandler ["MapSingleClick", {
                params ["_units", "_pos", "_alt", "_shift"];
                vehicle player setPos _pos;
            }];
            [{!isNull (findDisplay 12)}, {
                GVAR(ctrlDrawIconsHandle) = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", FUNC(drawIcon)];
            }, []] call CBA_fnc_waitUntilAndExecute;
            LOG_1("Enabled showing debug icons on map by %1",player);
        } else {
            player allowDamage true;
            _handle = missionNamespace getVariable [QGVAR(drawIconsHandle), -1];
            removeMissionEventHandler ["MapSingleClick", _handle];
            GVAR(drawIconsHandle) = nil;
            _handle = missionNamespace getVariable [QGVAR(ctrlDrawIconsHandle), -1];
            ((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw", _handle];
            GVAR(ctrlDrawIconsHandle) = nil;
            LOG_1("Disabled showing debug icons on map by %1",player);
        };
    },
	false
] call CBA_fnc_addSetting;

[
    QGVAR(FLYBY), //enable or disable Ambient flybies
    "CHECKBOX",
    "Enable Flyby",
    ["[BTC] Framework Mission Settings", "Ambient Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(ANIMALS), //enable or disable Animal spawning
    "CHECKBOX",
    "Enable Animals",
    ["[BTC] Framework Mission Settings", "Ambient Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(SHORTER_NIGHTS), //enable or disable Shorter Nights
    "CHECKBOX",
    "Enable Shorter Nights",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    true,
    true,
    {},
	true
] call CBA_fnc_addSetting;

[
    QGVAR(TIMEACC), //Change Time Acc
    "LIST",
    "Choose Time Acceleration",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    [[1, 12, 24], ["1x", "12x", "24"], 0],
    true,
    {},
	false
] call CBA_fnc_addSetting;

[
    QGVAR(DATE), //Change starting time
    "LIST",
    "Choose Starting Time",
    ["[BTC] Framework Mission Settings", "Mission Settings"],
    [[6, 12, 1, 0], ["06:00","12:00","01:00 full moon", "00:00 no moon"], 0],
    true,
    {},
	true
] call CBA_fnc_addSetting;
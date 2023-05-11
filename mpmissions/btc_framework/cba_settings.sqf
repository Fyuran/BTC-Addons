// ACE Advanced Ballistics
force force ace_advanced_ballistics_ammoTemperatureEnabled = false;
force force ace_advanced_ballistics_barrelLengthInfluenceEnabled = false;
force force ace_advanced_ballistics_bulletTraceEnabled = false;
force force ace_advanced_ballistics_enabled = false;
force force ace_advanced_ballistics_muzzleVelocityVariationEnabled = false;
force force ace_advanced_ballistics_simulationInterval = 0.05;

// ACE Advanced Fatigue
force force ace_advanced_fatigue_enabled = true;
force force ace_advanced_fatigue_enableStaminaBar = true;
ace_advanced_fatigue_fadeStaminaBar = true;
force force ace_advanced_fatigue_loadFactor = 0.5;
force force ace_advanced_fatigue_performanceFactor = 1;
force force ace_advanced_fatigue_recoveryFactor = 1;
force ace_advanced_fatigue_swayFactor = 0.5;
force force ace_advanced_fatigue_terrainGradientFactor = 1;

// ACE Advanced Throwing
force force ace_advanced_throwing_enabled = true;
force force ace_advanced_throwing_enablePickUp = true;
force force ace_advanced_throwing_enablePickUpAttached = true;
force force ace_advanced_throwing_showMouseControls = true;
force force ace_advanced_throwing_showThrowArc = true;

// ACE Arsenal
force force ace_arsenal_allowDefaultLoadouts = true;
force force ace_arsenal_allowSharedLoadouts = true;
force force ace_arsenal_camInverted = false;
force force ace_arsenal_enableIdentityTabs = true;
force force ace_arsenal_enableModIcons = true;
force force ace_arsenal_EnableRPTLog = false;
force force ace_arsenal_fontHeight = 4.5;

// ACE Artillery
force ace_artillerytables_advancedCorrections = false;
force ace_artillerytables_disableArtilleryComputer = false;
force ace_mk6mortar_airResistanceEnabled = false;
force ace_mk6mortar_allowCompass = true;
force ace_mk6mortar_allowComputerRangefinder = true;
force ace_mk6mortar_useAmmoHandling = false;

// ACE Captives
force force ace_captives_allowHandcuffOwnSide = true;
force force ace_captives_allowSurrender = true;
force force ace_captives_requireSurrender = 2;
force force ace_captives_requireSurrenderAi = false;

// ACE Common
force ace_common_allowFadeMusic = true;
force force ace_common_checkPBOsAction = 0;
force force ace_common_checkPBOsCheckAll = true;
force force ace_common_checkPBOsWhitelist = "[btc_console]";
ace_common_displayTextColor = [0,0,0,0.1];
ace_common_displayTextFontColor = [1,1,1,1];
ace_common_settingFeedbackIcons = 1;
ace_common_settingProgressBarLocation = 0;
force ace_noradio_enabled = true;
ace_parachute_hideAltimeter = true;

// ACE Cook off
force force ace_cookoff_ammoCookoffDuration = 0.5;
force force ace_cookoff_enable = 0;
force force ace_cookoff_enableAmmobox = false;
force force ace_cookoff_enableAmmoCookoff = false;
force force ace_cookoff_probabilityCoef = 0.5;

// ACE Crew Served Weapons
force ace_csw_ammoHandling = 2;
force ace_csw_defaultAssemblyMode = false;
ace_csw_dragAfterDeploy = false;
force ace_csw_handleExtraMagazines = true;
force ace_csw_progressBarTimeCoefficent = 1;

// ACE Explosives
force force ace_explosives_explodeOnDefuse = false;
force force ace_explosives_punishNonSpecialists = true;
force force ace_explosives_requireSpecialist = false;

// ACE Fragmentation Simulation
force force ace_frag_enabled = true;
force force ace_frag_maxTrack = 10;
force force ace_frag_maxTrackPerFrame = 10;
force force ace_frag_reflectionsEnabled = false;
force force ace_frag_spallEnabled = false;

// ACE Goggles
force force ace_goggles_effects = 2;
force ace_goggles_showClearGlasses = true;
force force ace_goggles_showInThirdPerson = false;

// ACE Hearing
force force ace_hearing_autoAddEarplugsToUnits = true;
force force ace_hearing_disableEarRinging = false;
force force ace_hearing_earplugsVolume = 0.5;
force force ace_hearing_enableCombatDeafness = true;
force force ace_hearing_enabledForZeusUnits = true;
force force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Interaction
force force ace_interaction_disableNegativeRating = false;
force force ace_interaction_enableMagazinePassing = true;
force force ace_interaction_enableTeamManagement = true;

// ACE Interaction Menu
ace_gestures_showOnInteractionMenu = 2;
ace_interact_menu_actionOnKeyRelease = true;
ace_interact_menu_addBuildingActions = false;
ace_interact_menu_alwaysUseCursorInteraction = false;
ace_interact_menu_alwaysUseCursorSelfInteraction = true;
ace_interact_menu_colorShadowMax = [0,0,0,1];
ace_interact_menu_colorShadowMin = [0,0,0,0.25];
ace_interact_menu_colorTextMax = [1,1,1,1];
ace_interact_menu_colorTextMin = [1,1,1,0.25];
ace_interact_menu_cursorKeepCentered = false;
ace_interact_menu_cursorKeepCenteredSelfInteraction = false;
ace_interact_menu_menuAnimationSpeed = 0;
ace_interact_menu_menuBackground = 0;
ace_interact_menu_menuBackgroundSelf = 0;
ace_interact_menu_selectorColor = [1,0,0];
ace_interact_menu_shadowSetting = 2;
ace_interact_menu_textSize = 2;
ace_interact_menu_useListMenu = false;
ace_interact_menu_useListMenuSelf = false;

// ACE Logistics
force force ace_cargo_enable = true;
force force ace_cargo_loadTimeCoefficient = 5;
force force ace_cargo_paradropTimeCoefficent = 2.5;
force ace_rearm_distance = 20;
force force ace_rearm_level = 0;
force force ace_rearm_supply = 0;
force force ace_refuel_hoseLength = 12;
force force ace_refuel_rate = 1;
force force ace_repair_addSpareParts = true;
force force ace_repair_autoShutOffEngineWhenStartingRepair = true;
force force ace_repair_consumeItem_toolKit = 0;
force force ace_repair_displayTextOnRepair = true;
force force ace_repair_engineerSetting_fullRepair = 0;
force force ace_repair_engineerSetting_repair = 0;
force force ace_repair_engineerSetting_wheel = 0;
force force ace_repair_fullRepairLocation = 3;
force ace_repair_fullRepairRequiredItems = ["ToolKit"];
force ace_repair_miscRepairRequiredItems = ["ToolKit"];
force force ace_repair_repairDamageThreshold = 0.6;
force force ace_repair_repairDamageThreshold_engineer = 0.4;
force force ace_repair_wheelRepairRequiredItems = [];

// ACE Magazine Repack
force force ace_magazinerepack_timePerAmmo = 1.5;
force force ace_magazinerepack_timePerBeltLink = 8;
force force ace_magazinerepack_timePerMagazine = 2;

// ACE Map
force force ace_map_BFT_Enabled = false;
force force ace_map_BFT_HideAiGroups = false;
force force ace_map_BFT_Interval = 1;
force force ace_map_BFT_ShowPlayerNames = false;
force force ace_map_DefaultChannel = -1;
force force ace_map_mapGlow = true;
force force ace_map_mapIllumination = true;
force force ace_map_mapLimitZoom = false;
force force ace_map_mapShake = true;
force force ace_map_mapShowCursorCoordinates = false;
force force ace_markers_moveRestriction = 0;

// ACE Map Gestures
ace_map_gestures_defaultColor = [1,0.88,0,0.7];
ace_map_gestures_defaultLeadColor = [1,0.88,0,0.95];
force force ace_map_gestures_enabled = true;
force ace_map_gestures_interval = 0.03;
force ace_map_gestures_maxRange = 7;
ace_map_gestures_nameTextColor = [0.2,0.2,0.2,0.3];

// ACE Map Tools
force force ace_maptools_drawStraightLines = true;
force force ace_maptools_rotateModifierKey = 1;

// ACE Medical
force force ace_medical_ai_enabledFor = 0;
force force ace_medical_AIDamageThreshold = 1;
force force ace_medical_bleedingCoefficient = 0.1;
force force ace_medical_blood_bloodLifetime = 120;
force force ace_medical_blood_enabledFor = 1;
force force ace_medical_blood_maxBloodObjects = 100;
force force ace_medical_fatalDamageSource = 0;
force force ace_medical_feedback_painEffectType = 1;
force force ace_medical_fractures = 1;
force force ace_medical_gui_enableActions = 0;
force force ace_medical_gui_enableMedicalMenu = 1;
force force ace_medical_gui_enableSelfActions = true;
force force ace_medical_gui_maxDistance = 3;
force force ace_medical_gui_openAfterTreatment = true;
force force ace_medical_ivFlowRate = 2;
force force ace_medical_limping = 1;
force force ace_medical_painCoefficient = 1;
force force ace_medical_playerDamageThreshold = 1;
force force ace_medical_spontaneousWakeUpChance = 0.12;
force force ace_medical_spontaneousWakeUpEpinephrineBoost = 1;
force force ace_medical_statemachine_AIUnconsciousness = false;
force force ace_medical_statemachine_cardiacArrestTime = 1800;
force force ace_medical_statemachine_fatalInjuriesAI = 0;
force force ace_medical_statemachine_fatalInjuriesPlayer = 2;
force force ace_medical_treatment_advancedBandages = false;
force force ace_medical_treatment_advancedDiagnose = false;
force force ace_medical_treatment_advancedMedication = false;
force force ace_medical_treatment_allowLitterCreation = true;
force force ace_medical_treatment_allowSelfIV = 1;
force force ace_medical_treatment_allowSelfStitch = 0;
force force ace_medical_treatment_allowSharedEquipment = 0;
force force ace_medical_treatment_clearTraumaAfterBandage = false;
force force ace_medical_treatment_consumePAK = 0;
force force ace_medical_treatment_consumeSurgicalKit = 0;
force force ace_medical_treatment_convertItems = 0;
force force ace_medical_treatment_cprSuccessChance = 0.8;
force force ace_medical_treatment_holsterRequired = 0;
force force ace_medical_treatment_litterCleanupDelay = 120;
force force ace_medical_treatment_locationEpinephrine = 0;
force force ace_medical_treatment_locationPAK = 3;
force force ace_medical_treatment_locationsBoostTraining = true;
force force ace_medical_treatment_locationSurgicalKit = 3;
force force ace_medical_treatment_maxLitterObjects = 100;
force force ace_medical_treatment_medicEpinephrine = 0;
force force ace_medical_treatment_medicPAK = 1;
force force ace_medical_treatment_medicSurgicalKit = 1;
force force ace_medical_treatment_timeCoefficientPAK = 1;
force force ace_medical_treatment_woundReopening = false;

// ACE Name Tags
ace_nametags_defaultNametagColor = [0.77,0.51,0.08,1];
ace_nametags_nametagColorBlue = [0.67,0.67,1,1];
ace_nametags_nametagColorGreen = [0.67,1,0.67,1];
ace_nametags_nametagColorMain = [1,1,1,1];
ace_nametags_nametagColorRed = [1,0.67,0.67,1];
ace_nametags_nametagColorYellow = [1,1,0.67,1];
force ace_nametags_playerNamesMaxAlpha = 0.8;
force ace_nametags_playerNamesViewDistance = 5;
force ace_nametags_showCursorTagForVehicles = false;
ace_nametags_showNamesForAI = false;
ace_nametags_showPlayerNames = 1;
ace_nametags_showPlayerRanks = true;
ace_nametags_showSoundWaves = 1;
ace_nametags_showVehicleCrewInfo = true;
ace_nametags_tagSize = 2;

// ACE Nightvision
force force ace_nightvision_aimDownSightsBlur = 0.1;
force force ace_nightvision_disableNVGsWithSights = false;
force force ace_nightvision_effectScaling = 0.1;
force force ace_nightvision_fogScaling = 0.8;
force force ace_nightvision_noiseScaling = 0.1;
ace_nightvision_shutterEffects = true;

// ACE Overheating
ace_overheating_displayTextOnJam = true;
force ace_overheating_enabled = true;
force ace_overheating_overheatingDispersion = true;
ace_overheating_showParticleEffects = true;
ace_overheating_showParticleEffectsForEveryone = false;
force ace_overheating_unJamFailChance = 0.1;
force ace_overheating_unJamOnreload = false;

// ACE Pointing
force force ace_finger_enabled = true;
force force ace_finger_indicatorColor = [0.83,0.68,0.21,0.75];
force force ace_finger_indicatorForSelf = true;
force force ace_finger_maxRange = 4;

// ACE Pylons
force ace_pylons_enabledForZeus = true;
force ace_pylons_enabledFromAmmoTrucks = true;
force ace_pylons_rearmNewPylons = false;
force ace_pylons_requireEngineer = false;
force ace_pylons_requireToolkit = true;
force ace_pylons_searchDistance = 15;
force ace_pylons_timePerPylon = 5;

// ACE Quick Mount
force ace_quickmount_distance = 3;
force ace_quickmount_enabled = true;
ace_quickmount_enableMenu = 3;
ace_quickmount_priority = 0;
force ace_quickmount_speed = 18;

// ACE Respawn
force force ace_respawn_removeDeadBodiesDisconnected = true;
force force ace_respawn_savePreDeathGear = true;

// ACE Scopes
force ace_scopes_correctZeroing = true;
force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force ace_scopes_defaultZeroRange = 100;
force ace_scopes_enabled = true;
force ace_scopes_forceUseOfAdjustmentTurrets = false;
force ace_scopes_overwriteZeroRange = false;
force ace_scopes_simplifiedZeroing = false;
ace_scopes_useLegacyUI = false;
force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force ace_scopes_zeroReferenceHumidity = 0;
force ace_scopes_zeroReferenceTemperature = 15;

// ACE Spectator
force ace_spectator_enableAI = false;
ace_spectator_maxFollowDistance = 5;
force ace_spectator_restrictModes = 0;
force ace_spectator_restrictVisions = 0;

// ACE Switch Units
force ace_switchunits_enableSafeZone = true;
force ace_switchunits_enableSwitchUnits = false;
force ace_switchunits_safeZoneRadius = 100;
force ace_switchunits_switchToCivilian = false;
force ace_switchunits_switchToEast = false;
force ace_switchunits_switchToIndependent = false;
force ace_switchunits_switchToWest = false;

// ACE Uncategorized
force ace_fastroping_requireRopeItems = false;
force ace_gforces_enabledFor = 1;
force ace_hitreactions_minDamageToTrigger = 0.1;
ace_inventory_inventoryDisplaySize = 0;
force ace_laser_dispersionCount = 2;
force ace_microdagr_mapDataAvailable = 2;
force ace_microdagr_waypointPrecision = 3;
ace_optionsmenu_showNewsOnMainMenu = true;
force ace_overpressure_distanceCoefficient = 1;
ace_tagging_quickTag = 1;

// ACE User Interface
force ace_ui_allowSelectiveUI = true;
ace_ui_ammoCount = false;
ace_ui_ammoType = true;
ace_ui_commandMenu = true;
ace_ui_firingMode = true;
ace_ui_groupBar = false;
ace_ui_gunnerAmmoCount = true;
ace_ui_gunnerAmmoType = true;
ace_ui_gunnerFiringMode = true;
ace_ui_gunnerLaunchableCount = true;
ace_ui_gunnerLaunchableName = true;
ace_ui_gunnerMagCount = true;
ace_ui_gunnerWeaponLowerInfoBackground = true;
ace_ui_gunnerWeaponName = true;
ace_ui_gunnerWeaponNameBackground = true;
ace_ui_gunnerZeroing = true;
ace_ui_magCount = true;
ace_ui_soldierVehicleWeaponInfo = true;
ace_ui_staminaBar = true;
ace_ui_stance = true;
ace_ui_throwableCount = true;
ace_ui_throwableName = true;
ace_ui_vehicleAltitude = true;
ace_ui_vehicleCompass = true;
ace_ui_vehicleDamage = true;
ace_ui_vehicleFuelBar = true;
ace_ui_vehicleInfoBackground = true;
ace_ui_vehicleName = true;
ace_ui_vehicleNameBackground = true;
ace_ui_vehicleRadar = true;
ace_ui_vehicleSpeed = true;
ace_ui_weaponLowerInfoBackground = true;
ace_ui_weaponName = true;
ace_ui_weaponNameBackground = true;
ace_ui_zeroing = true;

// ACE Vehicle Lock
force ace_vehiclelock_defaultLockpickStrength = 10;
force ace_vehiclelock_lockVehicleInventory = false;
force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE Vehicles
ace_vehicles_hideEjectAction = true;
force ace_vehicles_keepEngineRunning = false;

// ACE View Distance Limiter
force ace_viewdistance_enabled = true;
force ace_viewdistance_limitViewDistance = 10000;
ace_viewdistance_objectViewDistanceCoeff = 0;
ace_viewdistance_viewDistanceAirVehicle = 0;
ace_viewdistance_viewDistanceLandVehicle = 0;
ace_viewdistance_viewDistanceOnFoot = 0;

// ACE Weapons
ace_common_persistentLaserEnabled = false;
force ace_laserpointer_enabled = true;
ace_reload_displayText = true;
ace_reload_showCheckAmmoSelf = false;
ace_weaponselect_displayText = true;

// ACE Weather
force force ace_weather_enabled = false;
force force ace_weather_showCheckAirTemperature = false;
force force ace_weather_updateInterval = 60;
force force ace_weather_windSimulation = false;

// ACE Wind Deflection
force ace_winddeflection_enabled = true;
force ace_winddeflection_simulationInterval = 0.05;
force ace_winddeflection_vehicleEnabled = true;

// ACE Zeus
force ace_zeus_autoAddObjects = false;
force ace_zeus_canCreateZeus = -1;
force ace_zeus_radioOrdnance = false;
force ace_zeus_remoteWind = false;
force ace_zeus_revealMines = 0;
force ace_zeus_zeusAscension = false;
force ace_zeus_zeusBird = false;

// ACEX Field Rations
force force acex_field_rations_affectAdvancedFatigue = true;
force force acex_field_rations_enabled = false;
force force acex_field_rations_hudShowLevel = 0;
force force acex_field_rations_hudTransparency = -1;
force force acex_field_rations_hudType = 0;
force force acex_field_rations_hungerSatiated = 1;
force force acex_field_rations_thirstQuenched = 1;
force force acex_field_rations_timeWithoutFood = 2;
force force acex_field_rations_timeWithoutWater = 2;

// ACEX Fortify
acex_fortify_settingHint = 2;

// ACEX Headless
force force acex_headless_delay = 15;
force force acex_headless_enabled = true;
force force acex_headless_endMission = 0;
force force acex_headless_log = false;
force acex_headless_transferLoadout = 0;

// ACEX Sitting
force force acex_sitting_enable = true;

// ACEX View Restriction
force acex_viewrestriction_mode = 0;
force acex_viewrestriction_modeSelectiveAir = 0;
force acex_viewrestriction_modeSelectiveFoot = 0;
force acex_viewrestriction_modeSelectiveLand = 0;
force acex_viewrestriction_modeSelectiveSea = 0;
acex_viewrestriction_preserveView = false;

// ACEX Volume
acex_volume_enabled = false;
acex_volume_fadeDelay = 1;
acex_volume_lowerInVehicles = false;
acex_volume_reduction = 5;
acex_volume_remindIfLowered = false;
acex_volume_showNotification = true;

// Achilles - Available Factions
Achilles_var_BLU_CTRG_F = true;
Achilles_var_BLU_F = true;
Achilles_var_BLU_F_A = true;
Achilles_var_BLU_F_D = true;
Achilles_var_BLU_F_WD = true;
Achilles_var_BLU_G_F = true;
Achilles_var_BLU_GEN_F = true;
Achilles_var_BLU_T_F = true;
Achilles_var_BLU_W_F = true;
Achilles_var_CIV_F = true;
Achilles_var_CIV_IDAP_F = true;
Achilles_var_CUP_I_RACS = true;
Achilles_var_CUP_O_TK = true;
Achilles_var_FIR_AWS_ENEMY_F = true;
Achilles_var_FIR_AWS_FRND_F = true;
Achilles_var_IND_C_F = true;
Achilles_var_IND_E_F = true;
Achilles_var_IND_F = true;
Achilles_var_IND_G_F = true;
Achilles_var_IND_L_F = true;
Achilles_var_Interactive_F = true;
Achilles_var_ISC_Civs = true;
Achilles_var_LOP_AA = true;
Achilles_var_LOP_AFR = true;
Achilles_var_LOP_AFR_Civ = true;
Achilles_var_LOP_AFR_OPF = true;
Achilles_var_LOP_AM = true;
Achilles_var_LOP_AM_OPF = true;
Achilles_var_LOP_BH = true;
Achilles_var_LOP_CDF = true;
Achilles_var_LOP_ChDKZ = true;
Achilles_var_LOP_CHR_Civ = true;
Achilles_var_LOP_GRE = true;
Achilles_var_LOP_IA = true;
Achilles_var_LOP_IRA = true;
Achilles_var_LOP_IRAN = true;
Achilles_var_LOP_ISTS = true;
Achilles_var_LOP_ISTS_OPF = true;
Achilles_var_LOP_NAPA = true;
Achilles_var_LOP_NK = true;
Achilles_var_LOP_PESH = true;
Achilles_var_LOP_PESH_IND = true;
Achilles_var_LOP_PMC = true;
Achilles_var_LOP_RACS = true;
Achilles_var_LOP_SLA = true;
Achilles_var_LOP_SYR = true;
Achilles_var_LOP_TAK_Civ = true;
Achilles_var_LOP_TKA = true;
Achilles_var_LOP_TRK = true;
Achilles_var_LOP_UA = true;
Achilles_var_LOP_UKR = true;
Achilles_var_LOP_UN = true;
Achilles_var_LOP_US = true;
Achilles_var_LOP_UVF = true;
Achilles_var_O_GERArmy_WDL = true;
Achilles_var_OPF_F = true;
Achilles_var_OPF_G_F = true;
Achilles_var_OPF_R_F = true;
Achilles_var_OPF_T_F = true;
Achilles_var_OPF_V_F = true;
Achilles_var_rds_rus_civ = true;
Achilles_var_rhs_faction_insurgents = true;
Achilles_var_rhs_faction_msv = true;
Achilles_var_rhs_faction_rva = true;
Achilles_var_rhs_faction_socom = true;
Achilles_var_rhs_faction_tv = true;
Achilles_var_rhs_faction_usaf = true;
Achilles_var_rhs_faction_usarmy = true;
Achilles_var_rhs_faction_usarmy_d = true;
Achilles_var_rhs_faction_usarmy_wd = true;
Achilles_var_rhs_faction_usmc = true;
Achilles_var_rhs_faction_usmc_d = true;
Achilles_var_rhs_faction_usmc_wd = true;
Achilles_var_rhs_faction_usn = true;
Achilles_var_rhs_faction_vdv = true;
Achilles_var_rhs_faction_vdv_45 = true;
Achilles_var_rhs_faction_vmf = true;
Achilles_var_rhs_faction_vpvo = true;
Achilles_var_rhs_faction_vv = true;
Achilles_var_rhs_faction_vvs = true;
Achilles_var_rhs_faction_vvs_c = true;
Achilles_var_rhsgref_faction_cdf_air = true;
Achilles_var_rhsgref_faction_cdf_air_b = true;
Achilles_var_rhsgref_faction_cdf_ground = true;
Achilles_var_rhsgref_faction_cdf_ground_b = true;
Achilles_var_rhsgref_faction_cdf_ng = true;
Achilles_var_rhsgref_faction_cdf_ng_b = true;
Achilles_var_rhsgref_faction_chdkz = true;
Achilles_var_rhsgref_faction_chdkz_g = true;
Achilles_var_rhsgref_faction_hidf = true;
Achilles_var_rhsgref_faction_nationalist = true;
Achilles_var_rhsgref_faction_tla = true;
Achilles_var_rhsgref_faction_un = true;
Achilles_var_rhssaf_faction_airforce = true;
Achilles_var_rhssaf_faction_airforce_opfor = true;
Achilles_var_rhssaf_faction_army = true;
Achilles_var_rhssaf_faction_army_opfor = true;
Achilles_var_rhssaf_faction_un = true;
Achilles_var_rki_naf = true;
Achilles_var_sab_air_faction_ssw_0 = true;
Achilles_var_sab_air_faction_ssw_0_fs = true;
Achilles_var_sab_air_faction_ssw_0_ija = true;
Achilles_var_sab_air_faction_ssw_0_lw = true;
Achilles_var_sab_air_faction_ssw_0_trt = true;
Achilles_var_sab_air_faction_ssw_0_x = true;
Achilles_var_sab_air_faction_ssw_0_z = true;
Achilles_var_sab_air_faction_ssw_1 = true;
Achilles_var_sab_air_faction_ssw_1_af = true;
Achilles_var_sab_air_faction_ssw_1_raaf = true;
Achilles_var_sab_air_faction_ssw_1_raf = true;
Achilles_var_sab_air_faction_ssw_1_t = true;
Achilles_var_sab_air_faction_ssw_1_trt = true;
Achilles_var_sab_air_faction_ssw_2 = true;
Achilles_var_sab_air_faction_ssw_2_af = true;
Achilles_var_sab_air_faction_ssw_2_ch = true;
Achilles_var_sab_air_faction_ssw_2_fin = true;
Achilles_var_sab_air_faction_ssw_2_fr = true;
Achilles_var_sab_air_faction_ssw_2_it = true;
Achilles_var_sab_air_faction_ssw_2_rocaf = true;
Achilles_var_sab_air_faction_ssw_2_trt = true;
Achilles_var_sab_air_faction_ssw_2_v = true;
Achilles_var_Virtual_F = true;
Achilles_var_VSM_GP = true;

// Achilles - Available Modules
Achilles_var_Achilles_ACE_Heal_Module = true;
Achilles_var_Achilles_ACE_ImmersiveHeal_Module = true;
Achilles_var_Achilles_ACE_Injury_Module = true;
Achilles_var_Achilles_AddECM_Module = true;
Achilles_var_Achilles_Animation_Module = true;
Achilles_var_Achilles_Attach_To_Module = true;
Achilles_var_Achilles_Bind_Variable_Module = true;
Achilles_var_Achilles_Buildings_Destroy_Module = true;
Achilles_var_Achilles_Buildings_LockDoors_Module = true;
Achilles_var_Achilles_Buildings_ToggleLight_Module = true;
Achilles_var_Achilles_CAS_Module = true;
Achilles_var_Achilles_Change_Ability_Module = true;
Achilles_var_Achilles_Change_Altitude_Module = true;
Achilles_var_Achilles_Chatter_Module = true;
Achilles_var_Achilles_Create_Universal_Target_Module = true;
Achilles_var_Achilles_DevTools_FunctionViewer = true;
Achilles_var_Achilles_DevTools_ShowInAnimViewer = true;
Achilles_var_Achilles_DevTools_ShowInConfig = true;
Achilles_var_Achilles_Earthquake_Module = true;
Achilles_var_Achilles_Hide_Objects_Module = true;
Achilles_var_Achilles_IED_Module = true;
Achilles_var_Achilles_Make_Invincible_Module = true;
Achilles_var_Achilles_Module_Arsenal_AddFull = true;
Achilles_var_Achilles_Module_Arsenal_CopyToClipboard = true;
Achilles_var_Achilles_Module_Arsenal_CreateCustom = true;
Achilles_var_Achilles_Module_Arsenal_Paste = true;
Achilles_var_Achilles_Module_Arsenal_Remove = true;
Achilles_var_Achilles_Module_Change_Side_Relations = true;
Achilles_var_Achilles_Module_Equipment_Attach_Dettach_Effect = true;
Achilles_var_Achilles_Module_FireSupport_CASBomb = true;
Achilles_var_Achilles_Module_FireSupport_CASGun = true;
Achilles_var_Achilles_Module_FireSupport_CASGunMissile = true;
Achilles_var_Achilles_Module_FireSupport_CASMissile = true;
Achilles_var_Achilles_Module_Manage_Advanced_Compositions = true;
Achilles_var_Achilles_Module_Player_Set_Frequencies = true;
Achilles_var_Achilles_Module_Rotation = true;
Achilles_var_Achilles_Module_Spawn_Advanced_Composition = true;
Achilles_var_Achilles_Module_Spawn_Carrier = true;
Achilles_var_Achilles_Module_Spawn_Destroyer = true;
Achilles_var_Achilles_Module_Spawn_Effects = true;
Achilles_var_Achilles_Module_Spawn_Explosives = true;
Achilles_var_Achilles_Module_Spawn_Intel = true;
Achilles_var_Achilles_Module_Supply_Drop = true;
Achilles_var_Achilles_Module_Zeus_AssignZeus = true;
Achilles_var_Achilles_Module_Zeus_SwitchUnit = true;
Achilles_var_Achilles_Nuke_Module = true;
Achilles_var_Achilles_Patrol_Module = true;
Achilles_var_Achilles_Set_Date_Module = true;
Achilles_var_Achilles_Set_Height_Module = true;
Achilles_var_Achilles_Set_Weather_Module = true;
Achilles_var_Achilles_Sit_On_Chair_Module = true;
Achilles_var_Achilles_SuicideBomber_Module = true;
Achilles_var_Achilles_Suppressive_Fire_Module = true;
Achilles_var_Achilles_SurrenderUnit_Module = true;
Achilles_var_Achilles_Toggle_Simulation_Module = true;
Achilles_var_Achilles_Transfer_Ownership_Module = true;
Achilles_var_Ares_Artillery_Fire_Mission_Module = true;
Achilles_var_Ares_Module_Bahaviour_Garrison_Nearest = true;
Achilles_var_Ares_Module_Bahaviour_UnGarrison = true;
Achilles_var_Ares_Module_Behaviour_Search_Nearby_And_Garrison = true;
Achilles_var_Ares_Module_Behaviour_Search_Nearby_Building = true;
Achilles_var_Ares_Module_Dev_Tools_Create_Mission_SQF = true;
Achilles_var_Ares_Module_Dev_Tools_Execute_Code = true;
Achilles_var_Ares_Module_Equipment_Flashlight_IR_ON_OFF = true;
Achilles_var_Ares_Module_Equipment_NVD_TACLIGHT_IR = true;
Achilles_var_Ares_Module_Equipment_Turret_Optics = true;
Achilles_var_Ares_Module_Player_Change_Player_Side = true;
Achilles_var_Ares_Module_Player_Create_Teleporter = true;
Achilles_var_Ares_Module_Player_Teleport = true;
Achilles_var_Ares_Module_Reinforcements_Create_Lz = true;
Achilles_var_Ares_Module_Reinforcements_Create_Rp = true;
Achilles_var_Ares_Module_Reinforcements_Spawn_Units = true;
Achilles_var_Ares_Module_Spawn_Submarine = true;
Achilles_var_Ares_Module_Spawn_Trawler = true;
Achilles_var_Ares_Module_Zeus_Add_Remove_Editable_Objects = true;
Achilles_var_Ares_Module_Zeus_Hint = true;
Achilles_var_Ares_Module_Zeus_Switch_Side = true;
Achilles_var_Ares_Module_Zeus_Visibility = true;
Achilles_var_ModulePunishment_F = true;

// Achilles - Curator Vision Modes
achilles_curator_vision_blackhot = false;
achilles_curator_vision_blackhotgreencold = false;
achilles_curator_vision_blackhotredcold = false;
achilles_curator_vision_greenhotcold = false;
achilles_curator_vision_nvg = true;
achilles_curator_vision_redgreen = false;
achilles_curator_vision_redhot = false;
achilles_curator_vision_whitehot = true;
achilles_curator_vision_whitehotredcold = false;

// Achilles - Debug
Achilles_Debug_Output_Enabled = false;

// Achilles - Module Defaults
Achilles_var_setRadioFrequenciesLR_Default = "50";
Achilles_var_setRadioFrequenciesSR_Default = "150";

// Achilles - User Interface
Achilles_var_iconSelection = "Achilles_var_iconSelection_Ares";
Achilles_var_moduleTreeCollapse = true;
Achilles_var_moduleTreeDLC = true;
Achilles_var_moduleTreeHelmet = false;
Achilles_var_moduleTreeSearchPatch = false;

// CBA UI
cba_ui_notifyLifetime = 4;
cba_ui_StorePasswords = 1;

// CBA Weapons
cba_disposable_dropUsedLauncher = 2;
force cba_disposable_replaceDisposableLauncher = true;
cba_events_repetitionMode = 1;
cba_optics_usePipOptics = true;

// TFAR - Clientside settings
TFAR_default_radioVolume = 6;
TFAR_intercomDucking = 0.2;
TFAR_intercomVolume = 0.1;
TFAR_moveWhileTabbedOut = false;
TFAR_oldVolumeHint = false;
TFAR_pluginTimeout = 4;
TFAR_PosUpdateMode = 0.1;
TFAR_showChannelChangedHint = true;
TFAR_ShowDiaryRecord = true;
TFAR_showTransmittingHint = true;
TFAR_ShowVolumeHUD = false;
TFAR_tangentReleaseDelay = 0;
TFAR_VolumeHudTransparency = 0;
TFAR_volumeModifier_forceSpeech = false;

// Goobin's Gameplay Enhancements Canting
gge_canting_var_crosshairColour = [1,1,1,1];
force force gge_canting_var_crosshairMode = false;
force force gge_canting_var_disableLaser = true;
force force gge_canting_var_enableGunLight = true;
force force gge_canting_var_toggleADSMode = true;

// Goobin's Gameplay Enhancements Core
gge_core_var_debugMode = false;


// TFAR - Global settings
force TFAR_AICanHearPlayer = false;
force TFAR_AICanHearSpeaker = false;
force TFAR_allowDebugging = true;
TFAR_curatorCamEars = false;
force TFAR_defaultIntercomSlot = 0;
force TFAR_enableIntercom = true;
force TFAR_experimentalVehicleIsolation = true;
force TFAR_fullDuplex = true;
force TFAR_giveLongRangeRadioToGroupLeaders = false;
force TFAR_giveMicroDagrToSoldier = true;
force TFAR_givePersonalRadioToRegularSoldier = false;
force TFAR_globalRadioRangeCoef = 1;
force TFAR_instantiate_instantiateAtBriefing = false;
TFAR_noAutomoveSpectator = false;
force TFAR_objectInterceptionEnabled = true;
force TFAR_objectInterceptionStrength = 400;
force tfar_radiocode_east = "_opfor";
force tfar_radiocode_independent = "_independent";
force tfar_radiocode_west = "_bluefor";
force tfar_radioCodesDisabled = false;
force TFAR_SameLRFrequenciesForSide = false;
force TFAR_SameSRFrequenciesForSide = false;
force TFAR_setting_defaultFrequencies_lr_east = "";
force TFAR_setting_defaultFrequencies_lr_independent = "";
force TFAR_setting_defaultFrequencies_lr_west = "";
force TFAR_setting_defaultFrequencies_sr_east = "";
force TFAR_setting_defaultFrequencies_sr_independent = "";
force TFAR_setting_defaultFrequencies_sr_west = "";
force TFAR_setting_DefaultRadio_Airborne_east = "TFAR_mr6000l";
force TFAR_setting_DefaultRadio_Airborne_Independent = "TFAR_anarc164";
force TFAR_setting_DefaultRadio_Airborne_West = "TFAR_anarc210";
force TFAR_setting_DefaultRadio_Backpack_east = "TFAR_mr3000";
force TFAR_setting_DefaultRadio_Backpack_Independent = "TFAR_anprc155";
force TFAR_setting_DefaultRadio_Backpack_west = "TFAR_rt1523g";
force TFAR_setting_DefaultRadio_Personal_east = "TFAR_fadak";
force TFAR_setting_DefaultRadio_Personal_Independent = "TFAR_anprc148jem";
force TFAR_setting_DefaultRadio_Personal_West = "TFAR_anprc152";
force TFAR_setting_DefaultRadio_Rifleman_East = "TFAR_pnr1000a";
force TFAR_setting_DefaultRadio_Rifleman_Independent = "TFAR_anprc154";
force TFAR_setting_DefaultRadio_Rifleman_West = "TFAR_rf7800str";
force TFAR_spectatorCanHearEnemyUnits = true;
force TFAR_spectatorCanHearFriendlies = true;
force TFAR_takingRadio = 2;
force TFAR_Teamspeak_Channel_Name = "TaskForceRadio";
force TFAR_Teamspeak_Channel_Password = "123";
force tfar_terrain_interception_coefficient = 7;
force TFAR_voiceCone = true;

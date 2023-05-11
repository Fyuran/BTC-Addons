GAIA_scripts =  "Scripts\Server\gaia\scripts\";
GAIA_fsm     =  "Scripts\Server\gaia\fsm\";

// GAIA
fnc_GAIA		= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GAIA.sqf");
fnc_GAIA_AnalyzeTargets = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GAIA_AnalyzeTargets.sqf");
fnc_GAIA_AnalyzeForces	= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GAIA_AnalyzeForces.sqf");
fnc_GAIA_ConflictAreas	= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GAIA_ConflictAreas.sqf");
fnc_GAIA_Classify	= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GAIA_Classify.sqf");
fnc_GAIA_IssueOrders	= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GAIA_IssueOrders.sqf");


// Cache
gaia_fn_cache		= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_cache.sqf");
gaia_fn_cache_stage_2	= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_cache_stage_2.sqf");
gaia_fn_sync		= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_sync.sqf");
gaia_fn_uncache		= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_uncache.sqf");
gaia_fn_uncache_stage_2 = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_uncache_stage_2.sqf");
gaia_fn_nearPlayer	= compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_nearPlayer.sqf");
gaia_fn_gaia_cache_init = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_gaia_cache_init.sqf");

fn_cache_original_group	  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_cache_original_group.sqf");
fn_uncache_original_group = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fn_uncache_original_group.sqf");


// Behavior Functions
fnc_GetCAPoints		   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GetCAPoints.sqf");
fnc_DoTask		   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_DoTask.sqf");
fnc_GetZoneIntendFomGroup  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GetZoneIntendFomGroup.sqf");
fnc_GetDistanceClosestZone = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GetDistanceClosestZone.sqf");
fnc_AddGroupToGAIA	   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_AddGroupToGAIA.sqf");
fnc_HasLOS		   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_HasLOS.sqf");
fnc_SortGroupsByCA	   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_SortGroupsByCA.sqf");
fnc_FireFlare		   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_FireFlare.sqf");


// Orders
fnc_GetPosition	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_GetPosition.sqf");
fnc_addWaypoint	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_addWaypoint.sqf");
fnc_AddAttackWaypoint  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_AddAttackWaypoint.sqf");
fnc_RemoveWayPoints    = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_RemoveWayPoints.sqf");
fnc_CreateBuildingWP   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_CreateBuildingWP.sqf");
fnc_CreateWP	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_CreateWP.sqf");
fnc_DoPatrolInf	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolInf.sqf");
fnc_DoPatrolRecon      = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolRecon.sqf");
fnc_DoPatrol	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrol.sqf");
fnc_DoPatrolCar	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolCar.sqf");
fnc_DoPatrolMotorRecon = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolMotorRecon.sqf");
fnc_DoPatrolMechInf    = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolMechInf.sqf");
fnc_DoPatrolMotorInf   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolMotorInf.sqf");
fnc_DoPatrolShip       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolShip.sqf");
fnc_DoPatrolHeli       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolHeli.sqf");
fnc_DoFortify	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoFortify.sqf");
fnc_DoWait	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoWait.sqf");


// fnc_DoPatrolMotorizedRecon					= compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPatrolMotorizedRecon.sqf");
fnc_DoAttackRecon      = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackRecon.sqf");
fnc_DoAttackInf	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackInf.sqf");
fnc_DoAttackCar	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackCar.sqf");
fnc_DoAttackMotorRecon = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackMotorRecon.sqf");
fnc_DoAttackMotorInf   = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackMotorInf.sqf");
fnc_DoAttack	       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttack.sqf");
fnc_DoAttackMechInf    = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackMechInf.sqf");
fnc_DoAttackTank       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackTank.sqf");
fnc_DoAttackShip       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackShip.sqf");
fnc_DoAttackHeli       = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoAttackHeli.sqf");

fnc_DoTransportCar  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoTransportCar.sqf");
fnc_DoTransportTank = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoTransportTank.sqf");
fnc_DoTransportHeli = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoTransportHeli.sqf");


fnc_DoClear		     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoClear.sqf");
fnc_DoClearRecon	     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoClearRecon.sqf");
fnc_DoClearInf		     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoClearInf.sqf");
fnc_DoSupport		     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoSupport.sqf");
fnc_DoHide		     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoHide.sqf");
fnc_DoOrganizeTransportation = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoOrganizeTransportation.sqf");
fnc_DoPark		     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoPark.sqf");
fnc_DoMortar		     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "orders\fnc_DoMortar.sqf");


// Subfunctions Positioning

fnc_PosIsInMarker		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_PosIsInMarker.sqf");
fnc_GetDirectionalPos		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GetDirectionalPos.sqf");
fnc_findClosestPosition		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_findclosestposition.sqf");
fnc_getMarkerCorners		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getmarkercorners.sqf");
fnc_getMarkerShape		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getmarkershape.sqf");
fnc_getPosFromCircle		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getposfromcircle.sqf");
fnc_getPosFromEllipse		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getposfromellipse.sqf");
fnc_getPosFromRectangle		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getposfromrectangle.sqf");
fnc_getPosFromSquare		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getposfromsquare.sqf");
fnc_isBlacklisted		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_isblacklisted.sqf");
fnc_isInCircle			  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_isincircle.sqf");
fnc_isInEllipse			  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_isinellipse.sqf");
fnc_isInRectangle		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_isinrectangle.sqf");
fnc_isSamePosition		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_issameposition.sqf");
fnc_rotatePosition		  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_rotateposition.sqf");
fnc_getNearestBuildingPosDistance = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_getNearestBuildingPosDistance.sqf");
fnc_GetZoneStatusBehavior	  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_GetZoneStatusBehavior.sqf");
fnc_TimeOut			  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_TimeOut.sqf");
fnc_isCleared			  = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_isCleared.sqf");

// Terrain functions
fnc_ScanTerrain = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_ScanTerrain.sqf");

// Statistic function
fnc_CountUnitTypes    = compileFinal preprocessfilelinenumbers (GAIA_scripts       + "fnc_CountUnitTypes.sqf");
fnc_ClassifyUnits     = compileFinal preprocessfilelinenumbers (GAIA_scripts + "fnc_ClassifyUnits.sqf");
fnc_AnalyseUnit	      = compileFinal preprocessfilelinenumbers (GAIA_scripts       + "fnc_AnalyseUnit.sqf");
fnc_GetTurretsWeapons = compileFinal preprocessfilelinenumbers (GAIA_scripts       + "fnc_GetTurretsWeapons.sqf");

// garrison specific
// define functions hint

gaia_CBA_fnc_taskDefend = compileFinal preProcessFileLineNumbers (GAIA_scripts + "Fortify\gaia_CBA_fnc_taskDefend.sqf");
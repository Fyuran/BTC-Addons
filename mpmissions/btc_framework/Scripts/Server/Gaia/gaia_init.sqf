/*
  Created by Spirit, 5-1-2014

*/
// From what range away from closest player should units be cached (in meters or what every metric system arma uses)?
// To test this set it to 20 meters. Then make sure you get that close and move away.
// You will notice 2 levels of caching 1 all but leader, 2 completely away
// Stage 2 is 2 x GAIA_CACHE_STAGE_1. So default 2000, namely 2 x 1000
GAIA_CACHE_STAGE_1				= 1000;
// The follow 3 influence how close troops should be to known conflict to be used. (so they wont travel all the map to support)
// How far should footmobiles be called in to support attacks.
// This is also the range that is used by the transport system. If futher then the below setting from a zone, they can get transport.
MCC_GAIA_MAX_SLOW_SPEED_RANGE  = 900;
// How far should vehicles be called in to support attacks. (including boats)
MCC_GAIA_MAX_MEDIUM_SPEED_RANGE= 4500;
// How far should air units be called in to support attacks.
MCC_GAIA_MAX_FAST_SPEED_RANGE  = 80000;
// How logn should mortars and artillery wait (in seconds) between fire support missions.
MCC_GAIA_MORTAR_TIMEOUT				 = 300;
// DANGEROUS SETTING!!!
// If set to TRUE gaia will even send units that she does NOT control into attacks. Be aware ONLy for attacks.
// They will not suddenly patrol if set to true.
MCC_GAIA_ATTACKS_FOR_NONGAIA	 = false;

// If set to false, ai will not use smoke and flares (during night)
MCC_GAIA_AMBIANT							 = true;

// Influence how high the chance is (when applicaple) that units do smokes and flare (so not robotic style)
// Default is 20 that is a chance of 1 out of 20 when they are applicable to use smokes and flares
MCC_GAIA_AMBIANT_CHANCE				 = 20;
// The seconds of rest a transporter takes after STARTING his last order
MCC_GAIA_TRANSPORT_RESTTIME		= 40;

// We set the markers invisible (if you use more then 100 markers, then increase). Or delete if you want them visible
private ["_mkr"];
for "_x" from 1 to 100 do {
	_mkr = str _x;
	if !(markerPos _mkr isEqualTo [0,0,0]) then {
		if(BTC_DEBUG) then {
		    _mkr setMarkerColor "ColorPink";
		    _mkr setMarkerBrush "BDIAGONAL";
		    _mkr2 = createMarker [format["%1_gaia_debug_text",_x], markerPos _mkr];
		    _mkr2 setMarkerShape "ICON";
		    _mkr2 setMarkerType "hd_dot";
		    _mkr2 setMarkerText format ["GAIA ID: %1", _x];
		}else {_mkr setMarkerAlpha 0};
	};
};

GAIA_INIT = FALSE;

//GAIA Public (local) variables
MCC_GAIA_DEBUG						= BTC_DEBUG;
MCC_GAIA_CA_DEBUG					= [];


MCC_GAIA_CACHE						= false;
GAIA_CACHE_SLEEP					= 0.5;


GAIA_CACHE_STAGE_2				= (2*GAIA_CACHE_STAGE_1);
MCC_GAIA_CACHE_STAGE2			= [];




// dont CHANGE without knowledge
MCC_GAIA_OPERATIONAL 			= false;

//Used for the breadcrumb blacklist system. How far should a waypoint be from a position a unit has last been?
MCC_GAIA_CYCLE								 = 1;
MCC_GAIA_AWARENESSRANGE				 = 100;
MCC_GAIA_CLEARRANGE						 = 70;
MCC_GAIA_SHARETARGET_DELAY		 = 10;


//If an order is older then 10 minutes, cancel it. There is probbaly something wrong.
MCC_GAIA_MAX_ORDER_AGE				 = 5000;



//Side specific
MCC_GAIA_CA_WEST					= [];
MCC_GAIA_CA_EAST					= [];
MCC_GAIA_CA_INDEP					= [];
MCC_GAIA_ZONES_INDEP			= [];
MCC_GAIA_ZONES_POS_INDEP	= [];
MCC_GAIA_ZONES_EAST				= [];
MCC_GAIA_ZONES_POS_EAST		= [];
MCC_GAIA_ZONES_WEST				= [];
MCC_GAIA_ZONES_POS_WEST		= [];
MCC_GAIA_GROUPS_WEST			= [];
MCC_GAIA_GROUPS_EAST			= [];
MCC_GAIA_GROUPS_INDEP			= [];
MCC_GAIA_BREADCRUMBS_WEST	= [];
MCC_GAIA_BREADCRUMBS_EAST	= [];
MCC_GAIA_BREADCRUMBS_INDEP= [];
MCC_GAIA_WPPOS_WEST				= [];
MCC_GAIA_WPPOS_EAST				= [];
MCC_GAIA_WPPOS_INDEP			= [];
MCC_GAIA_ZONESTATUS_WEST	=	[]; for "_i" from 0 to 90 do  { MCC_GAIA_ZONESTATUS_WEST set [_i,"0"];};
MCC_GAIA_ZONESTATUS_EAST	=	[]; for "_i" from 0 to 90 do  { MCC_GAIA_ZONESTATUS_EAST set [_i,"0"];};
MCC_GAIA_ZONESTATUS_INDEP	=	[]; for "_i" from 0 to 90 do  { MCC_GAIA_ZONESTATUS_INDEP set [_i,"0"];};
MCC_GAIA_TARGETS_WEST			= []; for "_i" from 0 to 90 do  { MCC_GAIA_TARGETS_WEST set [_i,[]];};
MCC_GAIA_TARGETS_EAST			= []; for "_i" from 0 to 90 do  { MCC_GAIA_TARGETS_EAST set [_i,[]];};
MCC_GAIA_TARGETS_INDEP		= []; for "_i" from 0 to 90 do  { MCC_GAIA_TARGETS_INDEP set [_i,[]];};




//We spawn GAIA for each side (but dont worry, it will only be really active if there are units.)
//Still a smarter solution is welcome.

[WEST] 				spawn fnc_GAIA;
[EAST] 				spawn fnc_GAIA;
[resistance] spawn fnc_GAIA;

[] spawn gaia_fn_gaia_cache_init;

GAIA_INIT = TRUE;

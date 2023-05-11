[] execVM "Scripts\Server\eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "Scripts\Server\eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
[["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;

[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
[["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;

[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

//--------------WARNING: IF REQUESTED FACTION UNIT IS EMPTY SCRIPT WILL FAIL example: _stPool = [];

/*
// SOLO FANTERIA        : 4 gruppi GARRISON + 4 Gruppi PATROL
[["INF_01"],[4,1],[4,1],[0,0],[0],[0],[0,0],[0,0,1500,EAST,TRUE,TRUE]] call EOS_Spawn;

// SOLO MECCANIZZATI    :4 veicoli ognuno con fanteria dentro
[["MECH_01"],[0,0],[0,0],[4,2],[0],[0],[0,0],[0,0,1500,EAST,TRUE,TRUE]] call EOS_Spawn;

// SOLO ARMORED TANKS   :4 carri
[["TANK_01"],[0,0],[0,0],[0,0],[4],[0],[0,0],[0,0,1500,EAST,TRUE,TRUE]] call EOS_Spawn;

// SOLO STATICHE        :5 statiche
[["TURR_01"],[0,0],[0,0],[0,0],[0],[5],[0,0],[0,0,1500,EAST,TRUE,TRUE]] call EOS_Spawn;

// SOLO HELI CARGO      : 1 Elicottero con fanteria dentro
 [["HELI_01"],[0,0],[0,0],[0,0],[0],[0],[1,3],[0,0,1500,EAST,TRUE,TRUE]] call EOS_Spawn;

// SOLO HELI ATTACCO      : 1 Elicottero da attacco
[["HELI_02"],[0,0],[0,0],[0,0],[0],[0],[1,0],[0,0,1500,EAST,TRUE,TRUE]] call EOS_Spawn;
*/






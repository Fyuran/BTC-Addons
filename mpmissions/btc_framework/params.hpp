class BTC_DATE_TITLE
{
	title = "Date and time options:"; // Param name visible in the list
	values[] = {0}; // Values; must be integers; has to have the same number of elements as 'texts'
	texts[] = {""};  // Description of each selectable item
	default = 0;  // Default value; must be listed in 'values' array, otherwise 0 is used
	// Default values that are not whole numbers do not work. Param will default to 0 (or 1 if defined)
};

		class BTC_DATE
		{
			title = "      Date";
			values[] = {6,12,1,0};
			texts[] = {"06:00","12:00","01:00 full moon", "00:00 no moon"};
			default = 12;
		};

		class BTC_TIMEACC
		{
			title = "      Time acceleration multiplier";
			values[] = {1,12,24};
			texts[] = {"1x","12x","24x"};
			default = 12;
		};

		class BTC_SHORTER_NIGHTS
		{
			title = "      Shorter nights";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 1;
		};

class BTC_AMBIENT_TITLE
{
	title = "Ambient options:";
	values[] = {0};
	texts[] = {""};
	default = 0;
};

		class BTC_ANIMALS
		{
			title = "      Animals herds";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 1;
		};

		class BTC_DUSTSTORM
		{
			title = "      Dust storm";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 0;
		};

		class BTC_FLYBY
		{
			title = "      Ambient Flybyes";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 1;
		};

class BTC_GAMEOP_TITLE
{
	title = "Mission options:";
	values[] = {0};
	texts[] = {""};
	default = 0;
};

		class BTC_FUEL_CONSUMPTION
		{
			title = "      Faster fuel consumption";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 1;
		};

		class BTC_MISSIONTIMER
		{
			title = "      Mission Timer(Side)";
			values[] = {0,30,45,60,90,120,150,180,210};
			texts[] = {"Off","30 minutes","45 minutes","60 minutes","90 minutes","120 minutes","150 minutes","180 minutes","210 minutes"};
			default = 0;
		};

		class BTC_ENEMY_CQB
		{
			title = "      Enemy CQB(Engima)";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 1;
		};

		class BTC_TANKASTIC
		{
			title = "      Available Tanks(Tankastic):";
			values[] = {0};
			texts[] = {"BLUFOR:[Merkava MK IV LIC,Leopard 2SG], OPFOR:[T14 Armata, T100 Black Eagle]"};
			default = 0;
		};

class BTC_PERSISTENCE_TITLE
{
	title = "Persistence options:";
	values[] = {0};
	texts[] = {""};
	default = 0;
};

		class BTC_PERSISTENCE
		{
			title = "      Turn Off/On Persistence";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 1;
		};

		class BTC_PERSISTENCE_CLEAR
		{
			title = "      Clear Database";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 0;
		};

class BTC_OTHER_TITLE
{
	title = "Other options:";
	values[] = {0};
	texts[] = {""};
	default = 0;
};

		class BTC_DEBUG
		{
			title = "      Debug";
			values[] = {0,1};
			texts[] = {"Off","On"};
			default = 0;
		};
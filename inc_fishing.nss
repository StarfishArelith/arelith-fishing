#include "inc_fish_gen"
#include "inc_ship_seagrid"
#include "inc_ship_funcs"
#include "gs_inc_istate"
#include "gs_inc_encounter"

//void main() {}

/*#########################*/
/*# Function declarations #*/
/*#########################*/

//uses Berley on the current area whether via ship deck or via fishing spot
void UseBerley(object oActivator, object oItem);

//begins the process of fishing
void StartFishing(object oPC);

//takes bait int from rod and breaks it down into a value that the main fishing script can understand, 1,2,3,6,7,8,9 = small, 5 = medium, 4 = large, 10 = huge
int BaitInterface(int iBaitInput);

//get area local ID from resref, local ID being what is used to refer to a given area in this file
void GetAreaLIDFromResrefAndIntitiateFishing(string areaResref);

//generate a fish based on water and biome type and rolls
void GenerateFishCatch(int iWaterType, int iBiomeType, int iOffset = 0);

//rarity scale, applicable to the above
//Random(9) + 1
//9 	= rare
//8-6 	= uncommon
//1-5 	= common

//gives a drop from the junk table
void GiveJunkLoot();

//the fisherman rolled a 1
void FishingFail();

//spawn a hostile creature
void SpawnFishingEnemy();

//deal with fishing boat location
void GenShip();

//deal with specific East Frontier fishing spot biome crossover
void GenEastFrontier();

//takes a catch by ID, returns catch resref, catch message and catch exp reward
void SpawnFishingItemFromStruct(int itemToGive);

//handle no bait equipped
void NoBait();

//spawns an enemy encounter
void SpawnEnemyForActivity();

//calculate fishing duration based on inputs
float CalcFishingTime(float fTime, object oFisherman);

//returns an int based on what rod is equipped
int CheckWhatRodIsEquipped(object oFisherman);

//returns a hook based on what is currently applied to the rod
string GetHookStatus(object oRod);

//return 0 if no hook, 1-5 if hook or -1 if error
int CheckIfHasHook(object oRod);

//performs changes to the rod item
void UpdateRodHookStatus(object oRod, object oHook, object oPC);

//return 0 if no bait on rod, 1-10 if bait or -1 if error
int CheckIfHasBait(object oTarget);

//performs changes to the rod item
void UpdateRodBaitStatus(object oRod, object oBait, object oPC);

//returns a bait based on what is currently applied to the rod
string GetBaitStatus(object oRod);

//if a bait is used on an item, this fires and handles it
void HandleBait(object oTarget, object oItem, object oActivator);

//if a hook is used on an item, this fires and handles it
void HandleHook(object oTarget, object oItem, object oActivator);

//used in gs_m_activate in the shovel section to find worms
int DigForWorms(object oDigger);

//is the item a fishing rod?
int IsRod(object oItem);

//calculate and return how many bugs are in the jar
int GetTotalBugsInJar(object oJar);

//add a new bug to the jar
void AddBugToJar(object oJar, object oBug, int iAmount);

//handle dialog for removing bug from jar
void RemoveBugFromJar(object oJar);

//is the passed object a valid bug?
int IsBug(object oBug);

//generates contents to fill the jar
void GenerateBugs(object oJar, int iMultiplier, int iSpaceInJar);

//todo: store ship x/y on player and use that to do fishing on sea encounters

/*#############################*/
/*# Constant var declarations #*/
/*#############################*/

//max number of lucky rolls allowed
const int LUCKY_MAX_VALUE = 5;

//non fish harvests
const string HARVEST_EGG = "ir_freshegg";

//fishing time, update this if the fishing duration is changed
const float TIME_MINIMUM = 8.0f;

//bug jar stuff
const int BUG_JAR_CAPACITY = 40;

//berley duration
const int BERLEY_DURATION = 300; //seconds (5 mins)

//potion effect
const string FEATHER_FALL = "FEATHER_FALL";

//potion items
const string POT_BIRD = "sfpo_002";//feather fall

//food items
const string FOOD_SHARK_FIN_SOUP = "sf_hv039";//sharkfin soup
const string FOOD_SARDINE_SKEWER = "sf_hv030";//sardine skewer
const string FOOD_JELLY_EEL = "sf_hv042";//jellied eel
const string FOOD_SALMON_STEAK = "sf_hv029";//salmon steak
const string FOOD_FERMENTED_MACKEREL = "sf_hv026";//fermented mackerel
const string FOOD_SIMPLE_PLATTER = "sf_hv044";//simple seafood platter
const string FOOD_FINE_PLATTER = "sf_hv045";//fine seafood platter
const string FOOD_LAVISH_PLATTER = "sf_hv046";//lavish seafood platter

//areas by resref, name, server
//UD (Underdark water)
const string UD_DARKFALLS = "area051";//"Underdark (Upper) The Darkfalls" lake underdark
const string UD_URDLENPASS = "urdlenent";//Underdark (Middle) Urdlen's Pass" beach(for now) underdark
const string UD_GREATSCAREAST = "udscareast1";//"Underdark (Upper) Great Scar (East)" lake underdark
const string UD_RIVERDELTAEAST = "udrivdelta";//"Underdark (Middle) River Delta (East)" river underdark
const string UD_ZHURKWOODGROVE = "ud_petforgrove";//"Underdark (Middle) Zurkhwood Grove" beach underdark
const string UD_FLOODPLAIN1 = "ud_floodplains2";//"Underdark (Upper) Flood Plains" river underdark
const string UD_FLOODPLAIN2 = "ud_floodplains3";//"Underdark (Upper) Flood Plains" river underdark
const string UD_FLOODPLAIN3 = "ud_floodplains4";//"Underdark (Upper) Flood Plains" river underdark
const string UD_FLOODPLAIN4 = "ud_floodplains5";//"Underdark (Upper) Flood Plains" river underdark
const string UD_ROTHEFIELDS = "ud_fldplains1";//"Underdark (Andunor) Rothe Fields" lake underdark
const string UD_HIDDENCAVE = "gvd_a_slaveguild";//"Underdark (Andunor) Hidden Cave" river underdark
const string UD_DEEPGATE = "udcityhub3";//"Underdark (Andunor) The Deep Gate" river underdark
const string UD_WESTWHEEL = "udcityhub2";//"Underdark (Andunor) West Wheel" river underdark
const string UD_THESHARPS = "udcitydist1a";//"Underdark (Andunor) The Sharps" river (area is supposed to have a fishing spot but doesn't, something strange happening here)

//C&P (Temperate water)
const string CP_CORDORNORTH = "ir_crdr_outskirt";//"Cordor (Northern Outskirts)" river
const string CP_FARMLANDS = "ir_crdr_out2";//"Cordor (Farmlands)" river
const string CP_COALMINE = "cordorcoalmines3";//"Cordor (Farmlands) Coal Mines (Grotto)" beach

//Surface (Temperature as marked)
const string SF_DARKSPIRESWILDERNESS = "ar_fl_dswildmain";//"Dark Spires (Wilderness)" cold river
const string SF_DARKSPIRESBASECAMP = "ir_whiteelkcamp";//"Dark Spires (Base Camp)" cold river
const string SF_FORESTCAMPSITE = "camp";//"Campsite" temperate river
const string SF_FORESTCROSSROADSNORTH = "arelithforestnor";//Arelith Forest (Northern Crossroads)
const string SF_WHIDERSHINTOWN = "whidfestgrounds";//"Whidershin Edge (Festival Grounds)" temperate river
const string SF_BENWICKTOURNEYGROUNDS = "tournamentground";//"Benwick (Tournament Grounds)" temperate river
const string SF_SEASANDBANK = "sandbanks";//"Arelith (At Sea) Sandbanks" temperate beach
const string SF_SEASHIPWRECK = "ar_ats_shipwreck";//"Arelith (At Sea) Shipwrecks" temperate beach
const string SF_PASSOFDESPAIR = "passdespairnew";//"Pass of Despair" temperate river
const string SF_CROWSNEST = "midport3";//"Southern Peninsula (Crow's Nest)" warm beach
const string SF_JUNGLECOAST = "ir_newjunglecoas";//"Southern Peninsula (Jungles) Coast" warm beach
const string SF_JUNGLEHUT = "ir_newjunghut";//"Southern Peninsula (Jungles) Hut" warm beach
const string SF_ARELITHSEND = "ir_junglegrove";//"Southern Peninsula (Jungles) Arelith's End" warm beach
const string SF_HORDECAMP = "ir_jungcoastcamp";//"Southern Peninsula (Jungles) Horde Camp" warm beach
const string SF_BENDIRGORGE = "ir_westbendi2";//"Bendir Dale (Uplands) Gorge" temperate river
const string SF_RADIANTHEARTFALLS = "ir_templetriad";//"Minmir (Falls of Ascension)" cold river
const string SF_DRUIDICSTONES = "ir_skmtdruidgrov";//"Skull Crags (Upper Mountains) Druidic Stones" cold lake
const string SF_FOOTHILLSNORTH = "arelithlowhill2";//"Skull Crags (Foothills) North" temperate river
const string SF_SHYRMEADOW = "ir_rivlandplain";//"Upper Shyr (Meadows)" temperate river
const string SF_SHYRFARM = "ir_farmland1";//"Upper Shyr (Farmstead)" temperate river
const string SF_LOGGINGGROUNDS = "ir_guldloggrnd";//"Guldorand (Logging Grounds)" cold river
const string SF_DARROWDEEP = "ir_darrowdeep";//"Darrowdeep Castle" temperate river
const string SF_BRAMBLENORTH = "ir_corfrontier3";//"Bramble Woods (Trader's Route) North" temperate river
const string SF_BRAMBLESOUTH = "ir_corfrontier2";//"Bramble Woods (Trader's Route) South" temperate river
const string SF_CORDORFRONTIER = "ir_corfrontier1";//"Cordor Frontier" temperate river
const string SF_LOWLANDSWAMPS = "ir_bullywugcamp";//"Lowland Swamps (Marsh Pond)" swamp
const string SF_BENDIRRIVERBANK = "ir_bendirriverba";//"Bendir Dale (Riverbank)" temperate river
const string SF_BENDIRVILLAGE = "ir_bendirdale";//"Bendir Dale (Earthkin Village)" temperate river
const string SF_SENCLIFF = "illysfarne";//"Sencliff" temperate beach
const string SF_PRIVATEDOCK = "cordordocks";//"Cordor (The Walled City) Private Docks" temperate beach
const string SF_TRADERSROUTE1 = "bendtradrout1";//"Bendir Dale (Trader's Route)" south temperate river
const string SF_TRADERSROUTE2 = "bendtradrout2";//"Bendir Dale (Trader's Route)" NE    temperate river
const string SF_CORDOREASTFRONTIER = "arefrontiereast";//The below coordinates are due to that map having two fishing spots and represent the location of each
																		 //"Cordor Frontier (East)" Fishing spot location: X 29.488704681 | Y 164.409606934 	temperate river
																		 //"Cordor Frontier (East)" Fishing spot location: X 86.561820984 | Y 4.214305401 	temperate beach
const string SF_RAYNESLANDING = "ar_isls_rynpt001";//"Arelith (Islands) Rayne's Landing (Troubadour's Rest)" warm beach
const string SF_ANSRIVARRPOND = "af_new_templa002";//"Arelith Forest (Shallow Wood) Ansrivarr Pond" temperate river

//Guld (Temperature as marked)
const string GD_OLDMINEROAD = "guldcitmineroad";//"Guldorand (Mountains) Old Mine Road" cold lake
const string GD_JORMUNDULROCKS = "guldjorstones";//"Guldorand (Mountains) Jormundul Rocks" cold lake
const string GD_FORTRESSCITY = "guldcitya";//"Guldorand (Fortress City)" cold river

//DS (Temperature as marked)
const string DS_DESERTCOAST = "ir_sibjung1";//"Sibayad (Desert) Coast" warm beach
const string DS_MYRKFAELINN = "skaludhub";//"Skal (Upperdark) Myrk-Fælinn" cold lake underdark
const string DS_TUNDRA = "skaltundra2";//"Skal (Dun Umra) Tundra" cold river
const string DS_DUNMAGOG = "sep_skalmag1_006";//"Skal (Dun Magog) Eastern Slopes" cold river

//fishing rods
const int ROD_NONE = 0;//no rod
const int ROD_SIMPLE = 1;//simple rod
const int ROD_STURDY = 2;//sturdy rod
const int ROD_REINFORCED = 3;//reinforced rod

//hooks
const int HOOK_NONE = 0;//no hook
const int HOOK_COPPER = 1;//copper hook
const int HOOK_IRON = 2;//iron hook
const int HOOK_DAMASK = 3;//damask hook
const int HOOK_LUCKY = 4;//lucky hook (lucky catch)
const int HOOK_RUNIC = 5;//runic hook (shorter time)

//baits
const int BAIT_NONE = 0; //no bait
const int BAIT_CATERPILLAR = 1; //caterpillar
const int BAIT_DRAGONFLY = 2; //dragonfly
const int BAIT_GRUB = 3; //grub
const int BAIT_LARGE = 4; //large bait
const int BAIT_MEDIUM = 5; //medium bait
const int BAIT_BEETLE = 6; //shiny beetle
const int BAIT_SMALL = 7; //small bait
const int BAIT_SPIDER = 8; //small spider
const int BAIT_WORM = 9; //worm
const int BAIT_HUGE = 10;//huge bait

//bugjar baits resref

const string RESREF_BAIT_CATERPILLAR = "sf_hv007";//caterpillar
const string RESREF_BAIT_DRAGONFLY = "sf_hv008";//dragonfly
const string RESREF_BAIT_GRUB = "sf_hv009";//grub
const string RESREF_BAIT_BEETLE = "sf_hv006";//shiny beetle
const string RESREF_BAIT_SPIDER = "sf_hv010";//small spider
const string RESREF_BAIT_WORM = "sf_hv011";//worm

//what the Bug Jar can hold
const string VAR_TAG_BEETLE = "BEET";
const string VAR_TAG_CATERPILLAR = "CTRP";
const string VAR_TAG_DRAGONFLY = "DRGN";
const string VAR_TAG_GRUB = "GRUB";
const string VAR_TAG_SPIDER = "SPDR";
const string VAR_TAG_WORM = "WORM";

//normal fish drops item list
const string HARVEST_SMALL_MEAT = "gs_item899";
const string HARVEST_MEDIUM_MEAT = "gs_item898";
const string HARVEST_LARGE_MEAT = "gs_item897";
const string HARVEST_MEDIUM_HIDE = "gs_item896";
const string HARVEST_LARGE_HIDE = "gs_item854";
const string HARVEST_INK = "mi_ink";
const string HARVEST_OIL = "flaskofoil";
const string HARVEST_PEARL = "pearl";

const string HARVEST_LUMPFISH_FLUID = "sf_hv000";
const string HARVEST_GLIMSHELL = "sf_hv001";
const string HARVEST_JELLY = "sf_hv002";

const string HARVEST_COD_LIVER = "sf_hv013";
const string HARVEST_CRAB_LEG = "sf_hv014";
const string HARVEST_DARK_ROE = "sf_hv015";
const string HARVEST_FISH_BONES = "sf_hv016";
const string HARVEST_FISH_GUTS = "sf_hv017";
const string HARVEST_GOLD_SCALE = "sf_hv018";
const string HARVEST_GUTTED_SARDINE = "sf_hv019";
const string HARVEST_BIOLUMINESCENT_GEL = "sf_hv020";
const string HARVEST_LUMINOUS_SCALE = "sf_hv021";

const string HARVEST_ORANGE_ROE = "sf_hv023";
const string HARVEST_MACKEREL_CHUNK = "sf_hv024";
const string HARVEST_SHARP_PINCER = "sf_hv025";

const string HARVEST_RAINBOW_SCALE = "sf_hv027";
const string HARVEST_SALMON_FILLET = "sf_hv028";

const string HARVEST_SHARK_TOOTH = "sf_hv032";
const string HARVEST_SHARK_FIN = "sf_hv033";
const string HARVEST_STINGRAY_BARB = "sf_hv034";
const string HARVEST_STONEFISH_SPINE = "sf_hv035";
const string HARVEST_TENTACLE = "sf_hv036";
const string HARVEST_JELLYFISH_STINGER = "sf_hv037";
const string HARVEST_TOUGH_SHELL = "sf_hv038";

const string HARVEST_AMMONITE_SHELL = "sf_hv040";
const string HARVEST_GUTTED_EEL = "sf_hv041";

const string HARVEST_SAIL_FIN = "sf_hv047";

//fish drop treasure list
const string LOOT_BELJURIL = "ar_item_beljur";
const string LOOT_ROGUE_STONE = "ar_item_rogsto";
const string LOOT_STAR_SAPPHIRE = "ar_item_stsaph";
const string LOOT_MITHRIL_DUST = "ar_it_mithrildus";
const string LOOT_FISH_BOOT = "sf_fishboot";
const string LOOT_DRAGON_HIDE = "DRAGONHIDE";
const string LOOT_MAP_PIECE = "ar_it_mapiece";
const string LOOT_LUCKY_HOOK = "sf_hk003";
const string LOOT_RUNIC_HOOK = "sf_hk004";
const string LOOT_ILLITHID_TENTACLE = "AR_IT_SUBMISC001";

/*########################*/
/*# Function definitions #*/
/*########################*/

void UseBerley(object oActivator, object oItem)
{
	int iCurrentTime = svTIGetTimestamp();
    int iLastTime = GetLocalInt(GetArea(oActivator), "BERLEY");
    if ((iCurrentTime - iLastTime) > BERLEY_DURATION) //apply berley to fishing spot
    {
    	SendMessageToPC(oActivator, Colorize("You put some berley in the water.", COLOR_GREEN));
    	gsCMReduceItem(oItem);
    	SetLocalInt(GetArea(oActivator), "BERLEY", iCurrentTime);
	}
	else //berley was already applied to fishing spot
	{
		SendMessageToPC(oActivator, Colorize("You reckon that you don't need to use any more for now.", COLOR_ORANGE));
	}
}

void StartFishing(object oPC)
{
	int iHookEquipped = CheckIfHasHook(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC));

	//has berley been applied to the area? < 300 yes, else no
	int iCurrentTime = svTIGetTimestamp();
	int iLastTime = GetLocalInt(GetArea(oPC), "BERLEY");

	//base fishing duration
	float fDuration = 33.0f;

	//add duration variance
	if(Random(3) + 1 != 3)
	{
		fDuration += IntToFloat(ClampedRandom(-10, 10));
	}

	if(CheckWhatRodIsEquipped(oPC) == ROD_NONE)
	{
		SendMessageToPC(oPC, Colorize("You must have a fishing rod equipped to fish.", COLOR_RED));
		return;
	}

	fDuration = CalcFishingTime(fDuration, oPC);   

	AssignCommand(oPC, ClearAllActions());
	SendMessageToPC(oPC, Colorize("You cast out your line...", COLOR_SPRING_GREEN));
	if(iHookEquipped == HOOK_NONE)
	{
		SendMessageToPC(oPC, Colorize("...And then pull it back in. You forgot to attach a hook to your line.", COLOR_RED));
	}
	else
	{
		// Feedback and Start Timer for Player
		SetLocalString(oPC, "TIMER_EVENT", "timer_fishing");
		NWNX_Player_StopGuiTimingBar(oPC);
		NWNX_Player_StartGuiTimingBar(oPC, fDuration, "ca_givefish");
	}
}

void GenerateBugs(object oJar, int iMultiplier, int iSpaceInJar)
{
	int numberOfBugsToAdd = (Random(5) + 3) * iMultiplier;

	if(numberOfBugsToAdd > iSpaceInJar)
	{
		numberOfBugsToAdd = iSpaceInJar;
	}

	int i;
	for(i = 0 ; i < numberOfBugsToAdd ; i++)
	{
		switch(Random(6))
		{
			case 0:
				SetLocalInt(oJar, VAR_TAG_CATERPILLAR, GetLocalInt(oJar, VAR_TAG_CATERPILLAR) + 1);
				break;
			case 1:
				SetLocalInt(oJar, VAR_TAG_DRAGONFLY, GetLocalInt(oJar, VAR_TAG_DRAGONFLY) + 1);
				break;
			case 2:
				SetLocalInt(oJar, VAR_TAG_GRUB, GetLocalInt(oJar, VAR_TAG_GRUB) + 1);
				break;
			case 3:
				SetLocalInt(oJar, VAR_TAG_BEETLE, GetLocalInt(oJar, VAR_TAG_BEETLE) + 1);
				break;
			case 4:
				SetLocalInt(oJar, VAR_TAG_SPIDER, GetLocalInt(oJar, VAR_TAG_SPIDER) + 1);
				break;
			case 5:
				SetLocalInt(oJar, VAR_TAG_WORM, GetLocalInt(oJar, VAR_TAG_WORM) + 1);
				break;
		}
	}
	SendMessageToPC(OBJECT_SELF,Colorize("You found " + IntToString(numberOfBugsToAdd) + " bugs.",COLOR_GREEN));
}

void SpawnEnemyForActivity()
{
	int nCount = gsENGetEncounterLimit(GetArea(OBJECT_SELF));
    if (nCount > 0)
    {
        location lLocation = gsENGetSpawnLocation(OBJECT_SELF);
        float fRating1     = gsENGetRatingAtLocation(lLocation);
        float fRating2     = gsENGetMinimumRating(GetArea(OBJECT_SELF));

        if (fRating1 < fRating2) fRating1 = fRating2;

        if (fRating1 > 0.0)
        {
            //spawn
            gsENSpawnAtLocation(fRating1, nCount, lLocation, 5.0, FALSE);
        }
    }
}

int IsBug(object oBug)
{
	if(IsRod(oBug)) //prevents the bug jar from seeing bug-baited rods as bugs
	{
		return FALSE;
	}
	else if(GetLocalInt(oBug, "BAIT") == 1 || GetLocalInt(oBug, "BAIT") == 2 || GetLocalInt(oBug, "BAIT") == 3 || GetLocalInt(oBug, "BAIT") == 6 || GetLocalInt(oBug, "BAIT") == 8 || GetLocalInt(oBug, "BAIT") == 9)
	{
		return GetLocalInt(oBug, "BAIT");
	}
	return FALSE;
}

void AddBugToJar(object oJar, object oBug, int iAmount)
{
	switch(IsBug(oBug))
	{
		case BAIT_CATERPILLAR:
			SetLocalInt(oJar, VAR_TAG_CATERPILLAR, iAmount);
			break;
		case BAIT_DRAGONFLY:
			SetLocalInt(oJar, VAR_TAG_DRAGONFLY, iAmount);
			break;
		case BAIT_GRUB:
			SetLocalInt(oJar, VAR_TAG_GRUB, iAmount);
			break;
		case BAIT_BEETLE:
			SetLocalInt(oJar, VAR_TAG_BEETLE, iAmount);
			break;
		case BAIT_SPIDER:
			SetLocalInt(oJar, VAR_TAG_SPIDER, iAmount);
			break;
		case BAIT_WORM:
			SetLocalInt(oJar, VAR_TAG_WORM, iAmount);
			break;
	}
}

int GetTotalBugsInJar(object oJar)
{
	int totalBugs = 0;
	totalBugs = GetLocalInt(oJar,VAR_TAG_BEETLE) + GetLocalInt(oJar,VAR_TAG_CATERPILLAR) + GetLocalInt(oJar,VAR_TAG_DRAGONFLY) + GetLocalInt(oJar,VAR_TAG_GRUB) + GetLocalInt(oJar,VAR_TAG_SPIDER) + GetLocalInt(oJar,VAR_TAG_WORM);
	return totalBugs;
}

int IsRod(object oItem)
{
	if(GetResRef(oItem) == "sf_fishrod_001" || GetResRef(oItem) == "sf_fishrod_002" || GetResRef(oItem) == "sf_fishrod_003")
	{
		return TRUE;
	}
	return FALSE;
}

int DigForWorms(object oActivator)
{
	int iWormRoll = d10();
	
	if(iWormRoll > 8 && GetIsAreaNatural(GetArea(oActivator)) == 1)
	{
		int iMassRoll = d10();
		
		if(iMassRoll > 9)//found a worm mass
        {
            FloatingTextStringOnCreatureSafe("You found a mass of worms!", oActivator);
            CreateItemOnObject("sf_hv011", oActivator, 10);
        }
        else
	    {
	        FloatingTextStringOnCreatureSafe("You found a worm!", oActivator);
	        CreateItemOnObject("sf_hv011", oActivator, 1);
	    }
	    return TRUE;
	}
	return FALSE;
}

float CalcFishingTime(float fTime, object oFisherman)
{
	/*
		fTime cannot go below 0. it starts at 33, each bonus decreases fTime by fTime * 0.3 except for the hooks.
		33, 23.1, 16.7, 11.16
		then -1, -2 or -3 off of that base value based on hook to a minimum of 8.16
		any future changes must not allow fTime to drop below 0
	*/

	int iCurrentTime = svTIGetTimestamp();
	int iLastTime = GetLocalInt(GetArea(OBJECT_SELF),"BERLEY");

	//get bait and hook vars, more attachments would be added to rod local vars and updated here and in inc_fishing
   if(GetResRef(GetItemInSlot(INVENTORY_SLOT_BOOTS, oFisherman)) == "sf_fishboot")
   {
      fTime = fTime - (fTime * 0.3f);
   }
   if((iCurrentTime - iLastTime) < 300 && (iCurrentTime - iLastTime) > 0)
   {
      fTime = fTime - (fTime * 0.3f);
   }

   int iHookEquipped = GetLocalInt(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oFisherman), "HOOK");
   if(iHookEquipped == HOOK_RUNIC)
   {
      fTime = fTime - (fTime * 0.3f);
   }
   else if(iHookEquipped == HOOK_DAMASK)
   {
      fTime = fTime - 3;
   }
   else if(iHookEquipped == HOOK_IRON)
   {
      fTime = fTime - 2;
   }
   else if(iHookEquipped == HOOK_COPPER)
   {
      fTime = fTime - 1;
   }

   if(fTime < TIME_MINIMUM)
   {
   	fTime = TIME_MINIMUM;
   }

   return fTime;
}

int CheckWhatRodIsEquipped(object oFisherman)
{
   //possible future functionality here
   if(GetResRef(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oFisherman)) == "sf_fishrod_001")
   {
      return ROD_SIMPLE;
   }
   else if(GetResRef(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oFisherman)) == "sf_fishrod_002")
   {
      return ROD_STURDY;
   }
   else if(GetResRef(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oFisherman)) == "sf_fishrod_003")
   {
   	return ROD_REINFORCED;
   }

   return ROD_NONE;
}

void HandleHook(object oTarget, object oItem, object oActivator)
{
	//HCONFRM is confirmation variable to overwrite hook
	//0 unconfirmed, will not replace
	//1 confirmed, will replace

	if(!CheckIfHasHook(oTarget))
	{
		UpdateRodHookStatus(oTarget, oItem, oActivator);
	}
	else
	{
		if(!GetLocalInt(oTarget,"HCONFRM"))
		{
			SendMessageToPC(oActivator,Colorize("You've already got a " + GetHookStatus(oTarget) + " on your rod. Use again to confirm.",COLOR_ORANGE));
			SetLocalInt(oTarget,"HCONFRM", TRUE);
		}
		else
		{
			UpdateRodHookStatus(oTarget, oItem, oActivator);
			SetLocalInt(oTarget,"HCONFRM", FALSE);
		}
	}
}

string GetHookStatus(object oRod)
{
	//the current hook
	string sHookStatus = "";

	//hooks
	//0 no hook
	//1 copper hook
	//2 iron hook
	//3 damask hook
	//4 lucky hook
	//5 runic hook

	switch(GetLocalInt(oRod,"HOOK"))
	{
		case HOOK_COPPER:
			sHookStatus = "Copper Hook";
			break;
		case HOOK_IRON:
			sHookStatus = "Iron Hook";
			break;
		case HOOK_DAMASK:
			sHookStatus = "Damask Hook";
			break;
		case HOOK_LUCKY:
			sHookStatus = "Lucky Hook";
			break;
		case HOOK_RUNIC:
			sHookStatus = "Runic Hook";
			break;
		default:
			sHookStatus = "None";
			break;
	}
	return sHookStatus;
}

int CheckIfHasHook(object oRod)
{
	return GetLocalInt(oRod,"HOOK");
}

void UpdateRodHookStatus(object oRod, object oHook, object oPC)
{
	SetLocalInt(oRod,"HCONFRM", FALSE);
   SetLocalInt(oRod,"HOOK", GetLocalInt(oHook,"HOOK"));
   SetDescription(oRod, "");
   SetDescription(oRod, GetDescription(oRod) + "\n\nBait: " + GetBaitStatus(oRod) + "\nHook: " + GetHookStatus(oRod));
   gsCMReduceItem(oHook);
   SendMessageToPC(oPC,Colorize("You put a " + GetHookStatus(oRod) + " on your rod.",COLOR_GREEN));
}

void HandleBait(object oTarget, object oItem, object oActivator)
{
	//BCONFRM is confirmation variable to overwrite bait
	//0 unconfirmed, will not replace
	//1 confirmed, will replace

	if(!CheckIfHasHook(oTarget))
	{
		SendMessageToPC(oActivator,Colorize("You can't attach bait without a hook!",COLOR_RED));
	}
	else
	{
		if(!CheckIfHasBait(oTarget))
		{
			UpdateRodBaitStatus(oTarget, oItem, oActivator);
			SetLocalInt(oTarget,"BCONFRM", FALSE);
		}
		else
		{
			if(!GetLocalInt(oTarget,"BCONFRM"))
			{
				SendMessageToPC(oActivator,Colorize("You've already got a " + GetBaitStatus(oTarget) + " on your hook. Use again to confirm.", COLOR_ORANGE));
				SetLocalInt(oTarget,"BCONFRM", TRUE);
			}
			else
			{
				UpdateRodBaitStatus(oTarget, oItem, oActivator);
				SetLocalInt(oTarget,"BCONFRM", FALSE);
			}
		}
	}
}

int CheckIfHasBait(object oRod)
{
	return GetLocalInt(oRod,"BAIT");
}

void UpdateRodBaitStatus(object oRod, object oBait, object oPC)
{
	SetLocalInt(oRod,"BCONFRM", FALSE);
   SetLocalInt(oRod,"BAIT", GetLocalInt(oBait,"BAIT"));
   SetDescription(oRod, "");
   SetDescription(oRod, GetDescription(oRod) + "\n\nBait: " + GetBaitStatus(oRod) + "\nHook: " + GetHookStatus(oRod));
   gsCMReduceItem(oBait);
   SendMessageToPC(oPC,Colorize("You put a " + GetBaitStatus(oRod) + " on your hook.", COLOR_GREEN));
}

string GetBaitStatus(object oRod)
{
	//the current bait
	string sBaitStatus = "";

	switch(GetLocalInt(oRod,"BAIT"))
	{
		case BAIT_CATERPILLAR:
			sBaitStatus = "Caterpillar";
			break;
		case BAIT_DRAGONFLY:
			sBaitStatus = "Dragonfly";
			break;
		case BAIT_GRUB:
			sBaitStatus = "Grub";
			break;
		case BAIT_LARGE:
			sBaitStatus = "Large Bait";
			break;
		case BAIT_MEDIUM:
			sBaitStatus = "Medium Bait";
			break;
		case BAIT_BEETLE:
			sBaitStatus = "Shiny Beetle";
			break;
		case BAIT_SMALL:
			sBaitStatus = "Small Bait";
			break;
		case BAIT_SPIDER:
			sBaitStatus = "Small Spider";
			break;
		case BAIT_WORM:
			sBaitStatus = "Worm";
			break;
		case BAIT_HUGE:
			sBaitStatus = "Huge Bait";
			break;
		default:
			sBaitStatus = "None";
			break;
	}
	return sBaitStatus;
}

int BaitInterface(int iBaitInput)
{
	int baitReturn = 0;
	switch(iBaitInput)
	{
		case BAIT_WORM:
		case BAIT_SPIDER:
		case BAIT_SMALL:
		case BAIT_BEETLE:
		case BAIT_GRUB:
		case BAIT_DRAGONFLY:
		case BAIT_CATERPILLAR:
			baitReturn = 1;
			break;
		case BAIT_MEDIUM:
			baitReturn = 2;
			break;
		case BAIT_LARGE:
			baitReturn = 3;
			break;
		case BAIT_HUGE:
			baitReturn = 4;
			break;
		default:
			baitReturn = 0;
			break;
	}

	return baitReturn;
}

//create fish appropriate to roll, water and temperature
void GenerateFishCatch(int iWaterType, int iBiomeType, int iOffset = 0)
{
	struct CatchTable currentCatchTable = GetCatchTable(iWaterType, iBiomeType);

	int iHookEquipped = CheckIfHasHook(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF));

	//prevents infinite lucky rolls
	int iOffsetSafety = LUCKY_MAX_VALUE;
	if(iOffset > 0)
	{
		iOffsetSafety = iOffset - 1;
	}

	int iRoll = d20() + iOffsetSafety;
	if(iHookEquipped == HOOK_LUCKY)//if lucky fish hook, fish with advantage
	{
		int iRollLucky = d20() + iOffsetSafety;
		if(iRollLucky > iRoll)
		{
			iRoll = iRollLucky;
		}
	}
	if(iRoll > 19)//if you roll lucky you can catch double. on the rare chance that they roll multiples, it keeps stacking
	{
		SetLocalInt(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF), "LUCKY", TRUE);
		GenerateFishCatch(iWaterType, iBiomeType, iOffset = iOffsetSafety);
		string sLucky = Colorize("L",COLOR_RED) + Colorize("u",COLOR_ORANGE) + Colorize("c",COLOR_YELLOW) + Colorize("k",COLOR_LIME_GREEN) + Colorize("y",COLOR_SLATE_BLUE);
		SendMessageToPC(OBJECT_SELF, sLucky);
		GenerateFishCatch(iWaterType, iBiomeType, iOffset = iOffsetSafety);
	}
	else if(iRoll > 2 && iRoll < 20)
	{
		SetLocalInt(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF), "LUCKY", FALSE);
		switch(BaitInterface(GetLocalInt(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF), "BAIT")))
		{
			case 0://no bait
				NoBait();
				break;

			case 1://small bait
				iRoll = Random(9) + 1;
				if(iRoll == 9)//rare
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallRareCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallRareCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallRareCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallRareCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallRareCatchE);
							break;
					}
				}
				else if(iRoll > 5 && iRoll < 9)//uncommon
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallUnCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallUnCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallUnCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallUnCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallUnCommonCatchE);
							break;
					}
				}
				else//common
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iSmallCommonCatchE);
							break;
					}
				}
				break;
			
			case 2://med bait
				iRoll = Random(9) + 1;
				if(iRoll == 9)//rare
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iMediRareCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iMediRareCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iMediRareCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iMediRareCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iMediRareCatchE);
							break;
					}
				}
				else if(iRoll > 5 && iRoll < 9)//uncommon
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iMediUnCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iMediUnCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iMediUnCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iMediUnCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iMediUnCommonCatchE);
							break;
					}
				}
				else//common
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iMediCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iMediCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iMediCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iMediCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iMediCommonCatchE);
							break;
					}
				}
				break;
			
			case 3://large bait
				iRoll = Random(9) + 1;
				if(iRoll == 9)//rare
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iLargRareCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iLargRareCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iLargRareCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iLargRareCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iLargRareCatchE);
							break;
					}
				}
				else if(iRoll > 5 && iRoll < 9)//uncommon
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iLargUnCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iLargUnCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iLargUnCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iLargUnCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iLargUnCommonCatchE);
							break;
					}
				}
				else//common
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iLargCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iLargCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iLargCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iLargCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iLargCommonCatchE);
							break;
					}
				}
				break;
			
			case 4://xl bait
				iRoll = Random(9) + 1;
				if(iRoll == 9)//rare
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgRareCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgRareCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgRareCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgRareCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgRareCatchE);
							break;
					}
				}
				else if(iRoll > 5 && iRoll < 9)//uncommon
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgUnCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgUnCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgUnCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgUnCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgUnCommonCatchE);
							break;
					}
				}
				else//common
				{
					iRoll = Random(5) + 1;
					switch(iRoll)
					{
						case 1:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgCommonCatchA);
							break;
						case 2:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgCommonCatchB);
							break;
						case 3:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgCommonCatchC);
							break;
						case 4:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgCommonCatchD);
							break;
						case 5:
							SpawnFishingItemFromStruct(currentCatchTable.iXLrgCommonCatchE);
							break;
					}
				}
				break;
			
			default:
				SendMessageToPC(OBJECT_SELF, Colorize("...Something has gone wrong with your BAIT. Please send in a bug report to the Bug Forum, tell us where you were when you encountered this message.", COLOR_RED));
				break;
		}
	}
	else
	{
		FishingFail();
	}
}

void FishingFail()
{
	object oRod = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
	int iRoll = d20();
	if(iRoll > 9)
	{
		GiveJunkLoot();
	}
	else if(iRoll > 1 && iRoll < 10)
	{
		iRoll = Random(10) + 1;
		if(iRoll > 1)
		{
			SendMessageToPC(OBJECT_SELF, Colorize("...You feel a tug but when you pull it up there is nothing caught and the bait is missing.", COLOR_ORANGE));

			SetLocalInt(oRod,"BCONFRM", FALSE);
   		SetLocalInt(oRod,"BAIT", BAIT_NONE);
   		SetDescription(oRod, "");
    		SetDescription(oRod, GetDescription(oRod) + "\n\nBait: " + GetBaitStatus(oRod) + "\nHook: " + GetHookStatus(oRod));
			
		}
		else
		{
			SendMessageToPC(OBJECT_SELF, Colorize("...Your attempts at fishing have been noticed by something nearby.", COLOR_RED));
			DelayCommand(10.0f,SpawnEnemyForActivity());
		}
	}
	else
	{
		SendMessageToPC(OBJECT_SELF, Colorize("...Your line snaps.", COLOR_RED));
		
		SetLocalInt(oRod,"BCONFRM", FALSE);
		SetLocalInt(oRod,"BAIT", BAIT_NONE);

		SetLocalInt(oRod,"HCONFRM", FALSE);
		SetLocalInt(oRod,"HOOK", BAIT_NONE);
		SetDescription(oRod, "");
		SetDescription(oRod, GetDescription(oRod) + "\n\nBait: " + GetBaitStatus(oRod) + "\nHook: " + GetHookStatus(oRod));

		gsISSetItemState(oRod, gsISGetItemState(oRod) - Random(3) + 1);
	}
}

void GenEastFrontier()
{
	//X 29.488704681 | Y 164.409606934 	temperate river
	//X 86.561820984 | Y 4.214305401 	temperate beach
	location lCurrentLocation = GetLocation(OBJECT_SELF);
	vector vCurrentPosition = GetPositionFromLocation(lCurrentLocation);
	if(vCurrentPosition.y > 80.0f)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_TEMPERATE);
	}
}

void GenShip()
{
	int nTile = SGGetCurrentTile(GetArea(OBJECT_SELF));
	int yPos = SGGetNSByTile(nTile);
	
	if(yPos == 3)//far north, cold water
	{
		GenerateFishCatch(BIOME_OCEAN, TEMPERATURE_COLD);
	}
	else if(yPos == -3)//far south, warm water
	{
		GenerateFishCatch(BIOME_OCEAN, TEMPERATURE_WARM);
	}
	else
	{
		GenerateFishCatch(BIOME_OCEAN, TEMPERATURE_TEMPERATE);
	}
}

void GiveJunkLoot()
{
	int iRoll = Random(11) + 1;
	switch(iRoll)
	{
		case 1:
			SpawnFishingItemFromStruct(JUNK_CRAB_LEG);
			break;
		
		case 2:
			SpawnFishingItemFromStruct(JUNK_FISH_BONES);
			break;
		
		case 3:
			SpawnFishingItemFromStruct(JUNK_BONE);
			break;
		
		case 4:
			SpawnFishingItemFromStruct(JUNK_SKULL);
			break;
		
		case 5:
			SpawnFishingItemFromStruct(JUNK_SOFT_WOOD);
			break;
		
		case 6:
			SpawnFishingItemFromStruct(JUNK_KELP);
			break;
		
		case 7:
			SpawnFishingItemFromStruct(JUNK_RING);
			break;
		
		case 8:
			SpawnFishingItemFromStruct(JUNK_NECKLACE);
			break;
		
		case 9:
			SpawnFishingItemFromStruct(JUNK_BOOTS);
			break;
		
		case 10:
			SpawnFishingItemFromStruct(JUNK_DOLL);
			break;

		case 11:
			SpawnFishingItemFromStruct(LOOT_FISHRING);
			break;

		default:
			SendMessageToPC(OBJECT_SELF, Colorize("...Something has gone wrong with the FISH. Please send in a bug report to the Bug Forum, tell us where you were when you encountered this message.",COLOR_RED));
			break;
	}
}

void SpawnFishingItemFromStruct(int itemToGive)
{
	object oRod = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);

	if(itemToGive == CATCH_NONE)
	{
		SendMessageToPC(OBJECT_SELF, GetCatchFromID(itemToGive).message);
		return;
	}
	if(itemToGive == JUNK_DOLL)//check to see if they fished up a doll
	{
		int iRoll = Random(20) + 1;
		if(iRoll == 1)//the doll was evil and alive, it attacks
		{
			SendMessageToPC(OBJECT_SELF, Colorize("...You catch a waterlogged doll. It wriggles off the hook with a shriek!",COLOR_RED));
			CreateObject(OBJECT_TYPE_CREATURE, "ir_witchbobbet", GetLocation(OBJECT_SELF));
		}
	}
	SendMessageToPC(OBJECT_SELF, GetCatchFromID(itemToGive).message);

	//see i_sf_bait for BCONFRM

	if(!GetLocalInt(oRod, "LUCKY"))
	{
		SetLocalInt(oRod,"BCONFRM", FALSE);
		SetLocalInt(oRod,"BAIT", 0);
		SetDescription(oRod, "");
		SetDescription(oRod, GetDescription(oRod) + "\n\nBait: " + GetBaitStatus(oRod) + "\nHook: " + GetHookStatus(oRod));
	}

	CreateItemOnObject(GetCatchFromID(itemToGive).resref, OBJECT_SELF, 1);
	
	if(GetCatchFromID(itemToGive).exp > 0)
	{
		GiveXPToCreature(OBJECT_SELF, GetCatchFromID(itemToGive).exp);
	}
}

void NoBait()
{
	object oRod = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
	int iRoll = Random(10) + 1;
	if(iRoll > 7)
	{
		GiveJunkLoot();
	}
	else
	{
		SendMessageToPC(OBJECT_SELF, Colorize("...After a while of waiting it seems nothing wants to bite. Perhaps some bait will help.",COLOR_ORANGE));
		//bait should already be empty, enforcing this for sanity
		SetLocalInt(oRod,"BAIT",0);
	}
}

void GetAreaLIDFromResrefAndIntitiateFishing(string areaResref)
{
	if(areaResref == UD_DARKFALLS)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_URDLENPASS)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_GREATSCAREAST)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_RIVERDELTAEAST)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_ZHURKWOODGROVE)
	{
		GenerateFishCatch(BIOME_OCEAN, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_FLOODPLAIN1)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_FLOODPLAIN2)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_FLOODPLAIN3)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_FLOODPLAIN4)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_ROTHEFIELDS)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_HIDDENCAVE)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_DEEPGATE)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_WESTWHEEL)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == UD_THESHARPS)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == CP_CORDORNORTH)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == CP_FARMLANDS)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == CP_COALMINE)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_DARKSPIRESWILDERNESS)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == SF_DARKSPIRESBASECAMP)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == SF_FORESTCAMPSITE)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_FORESTCROSSROADSNORTH)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_WHIDERSHINTOWN)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_BENWICKTOURNEYGROUNDS)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_SEASANDBANK)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_SEASHIPWRECK)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_TEMPERATE);
	}
	else if(GetIsShip(GetArea(OBJECT_SELF)))
	{
		GenShip();
	}
	else if(areaResref == SF_PASSOFDESPAIR)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_CROWSNEST)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == SF_JUNGLECOAST)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == SF_JUNGLEHUT)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == SF_ARELITHSEND)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == SF_HORDECAMP)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == SF_BENDIRGORGE)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_RADIANTHEARTFALLS)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == SF_DRUIDICSTONES)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_COLD);
	}
	else if(areaResref == SF_FOOTHILLSNORTH)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);//check this
	}
	else if(areaResref == SF_SHYRMEADOW)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_SHYRFARM)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_LOGGINGGROUNDS)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == SF_DARROWDEEP)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_BRAMBLENORTH)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_BRAMBLESOUTH)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_CORDORFRONTIER)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_LOWLANDSWAMPS)
	{
		GenerateFishCatch(BIOME_SWAMP, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_BENDIRRIVERBANK)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_BENDIRVILLAGE)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_SENCLIFF)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_PRIVATEDOCK)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_TRADERSROUTE1)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_TRADERSROUTE2)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == SF_CORDOREASTFRONTIER)
	{
		GenEastFrontier();
	}
	else if(areaResref == SF_RAYNESLANDING)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == SF_ANSRIVARRPOND)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_TEMPERATE);
	}
	else if(areaResref == GD_OLDMINEROAD)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_COLD);
	}
	else if(areaResref == GD_JORMUNDULROCKS)
	{
		GenerateFishCatch(BIOME_LAKES, TEMPERATURE_COLD);
	}
	else if(areaResref == GD_FORTRESSCITY)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == DS_DESERTCOAST)
	{
		GenerateFishCatch(BIOME_BEACH, TEMPERATURE_WARM);
	}
	else if(areaResref == DS_MYRKFAELINN)
	{
		GenerateFishCatch(BIOME_MYRKFAE, TEMPERATURE_UNDERDARK);
	}
	else if(areaResref == DS_TUNDRA)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == DS_DUNMAGOG)
	{
		GenerateFishCatch(BIOME_RIVER, TEMPERATURE_COLD);
	}
	else if(areaResref == "playground")
	{
		GenerateFishCatch(BIOME_OCEAN, TEMPERATURE_UNDERDARK);
	}
}
#include "inc_color"

//void main() {}

//gets a CatchTable from passed arguments
struct CatchTable GetCatchTable(int iWaterType, int iBiomeType);

//gets int ID from resref
struct CatchType GetCatchFromID(int catchID);


//stores types of catches
struct CatchType
{
	string message;	//message on catch
	string resref;	//item resref
	int exp;		//exp to give
};

//stores a predefined catch table
struct CatchTable
{
	int iSmallCommonCatchA;
	int iSmallCommonCatchB;
	int iSmallCommonCatchC;
	int iSmallCommonCatchD;
	int iSmallCommonCatchE;

	int iSmallUnCommonCatchA;
	int iSmallUnCommonCatchB;
	int iSmallUnCommonCatchC;
	int iSmallUnCommonCatchD;
	int iSmallUnCommonCatchE;

	int iSmallRareCatchA;
	int iSmallRareCatchB;
	int iSmallRareCatchC;
	int iSmallRareCatchD;
	int iSmallRareCatchE;

	int iMediCommonCatchA;
	int iMediCommonCatchB;
	int iMediCommonCatchC;
	int iMediCommonCatchD;
	int iMediCommonCatchE;

	int iMediUnCommonCatchA;
	int iMediUnCommonCatchB;
	int iMediUnCommonCatchC;
	int iMediUnCommonCatchD;
	int iMediUnCommonCatchE;

	int iMediRareCatchA;
	int iMediRareCatchB;
	int iMediRareCatchC;
	int iMediRareCatchD;
	int iMediRareCatchE;

	int iLargCommonCatchA;
	int iLargCommonCatchB;
	int iLargCommonCatchC;
	int iLargCommonCatchD;
	int iLargCommonCatchE;

	int iLargUnCommonCatchA;
	int iLargUnCommonCatchB;
	int iLargUnCommonCatchC;
	int iLargUnCommonCatchD;
	int iLargUnCommonCatchE;

	int iLargRareCatchA;
	int iLargRareCatchB;
	int iLargRareCatchC;
	int iLargRareCatchD;
	int iLargRareCatchE;

	int iXLrgCommonCatchA;
	int iXLrgCommonCatchB;
	int iXLrgCommonCatchC;
	int iXLrgCommonCatchD;
	int iXLrgCommonCatchE;

	int iXLrgUnCommonCatchA;
	int iXLrgUnCommonCatchB;
	int iXLrgUnCommonCatchC;
	int iXLrgUnCommonCatchD;
	int iXLrgUnCommonCatchE;

	int iXLrgRareCatchA;
	int iXLrgRareCatchB;
	int iXLrgRareCatchC;
	int iXLrgRareCatchD;
	int iXLrgRareCatchE;
};

//biome type
const int BIOME_OCEAN = 0;
const int BIOME_BEACH = 1;
const int BIOME_RIVER = 2;
const int BIOME_LAKES = 3;
const int BIOME_MYRKFAE = 4;//used once for a cold/UD crossover
const int BIOME_SWAMP = 5;

//biome temperature
const int TEMPERATURE_UNDERDARK = 0;
const int TEMPERATURE_TEMPERATE = 1;
const int TEMPERATURE_WARM = 2;
const int TEMPERATURE_COLD = 3;

//table of catches by ID
//null
const int CATCH_NONE = 0;//nothing

//fish
const int CATCH_JELLYFISH = 1;//jellyfish
const int CATCH_ANGLERFISH = 2;//anglerfish
const int CATCH_SNAIL = 3;//aquatic snail
const int CATCH_BASS = 4;//bass
const int CATCH_TUNA = 5;//tuna
const int CATCH_BLUETETRA = 6;//blue tetra
const int CATCH_BREAM = 7;//bream
const int CATCH_AMMONITE = 8;//ammonite
const int CATCH_COELACANTH = 9;//coelacanth
const int CATCH_EEL = 10;//eel
const int CATCH_EMBERTAIL = 11;//embertail
const int CATCH_PERCH = 12;//perch
const int CATCH_ISOPOD = 13;//isopod
const int CATCH_GHOSTCRAB = 14;//ghost crab
const int CATCH_GIANTLAMPREY = 15;//giant lamprey
const int CATCH_GILTSCALE = 16;//giltscale
const int CATCH_GLOOMSHARK = 17;//gloom shark
const int CATCH_GLOWEYE = 18;//gloweye
const int CATCH_MEGALODON = 19;//megalodon
const int CATCH_GREENTETRA = 20;//green tetra
const int CATCH_GULPER = 21;//gulper
const int CATCH_JEWELSHRIMP = 22;//shrimp
const int CATCH_KINGCRAB = 23;//king crab
const int CATCH_LUMPFISH = 24;//lumpfish
const int CATCH_MACKEREL = 25;//mackerel
const int CATCH_MINNOW = 26;//minnow
const int CATCH_MOONFISH = 27;//moonfish
const int CATCH_MULLET = 28;//mullet
const int CATCH_OCTOPUS = 29;//octopus
const int CATCH_PINKTETRA = 30;//pink tetra
const int CATCH_SALMON = 31;//salmon
const int CATCH_FLOUNDER = 32;//flounder
const int CATCH_SARDINE = 33;//sardine
const int CATCH_SQUID = 34;//CATCH_SQUID
const int CATCH_STINGRAY = 35;//stingray
const int CATCH_STONEFISH = 36;//stonefish
const int CATCH_STURGEON = 37;//sturgeon
const int CATCH_SUNFISH = 38;//sunfish
const int CATCH_TROUT = 39;//trout
const int CATCH_COD = 40;//cod

//junk
const int JUNK_CRAB_LEG = 41;//crab leg
const int JUNK_FISH_BONES = 42;//fishbones
const int JUNK_BONE = 43;//bone
const int JUNK_SKULL = 44;//skull
const int JUNK_SOFT_WOOD = 45;//softwood
const int JUNK_KELP = 46;//kelp
const int JUNK_RING = 47;//ring
const int JUNK_NECKLACE = 48;//necklace
const int JUNK_BOOTS = 49;//stinky boots
const int JUNK_DOLL = 50;//doll

//treasure
const int LOOT_FISHRING = 51;//fish king ring

//vanilla fish (filler)
const int CATCH_FISH = 52;//default small fish
const int CATCH_FLATFISH = 53;//default medium fish
const int CATCH_LUNKER = 54;//default large fish

//the meat of the mechanic, the actual drop tables
struct CatchTable GetCatchTable(int iWaterType, int iBiomeType)
{
	struct CatchTable returnCatchTable;

	if(iWaterType == BIOME_OCEAN && iBiomeType == TEMPERATURE_UNDERDARK)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchC = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_COD;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_STONEFISH;
		returnCatchTable.iSmallRareCatchB = CATCH_SQUID;
		returnCatchTable.iSmallRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchE = CATCH_FISH;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_COD;
		returnCatchTable.iMediCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediCommonCatchD = CATCH_SQUID;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_OCTOPUS;
		returnCatchTable.iMediUnCommonCatchB = CATCH_GIANTLAMPREY;
		returnCatchTable.iMediUnCommonCatchC = CATCH_ANGLERFISH;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iMediRareCatchA = CATCH_GULPER;
		returnCatchTable.iMediRareCatchB = CATCH_AMMONITE;
		returnCatchTable.iMediRareCatchC = CATCH_GLOOMSHARK;
		returnCatchTable.iMediRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchE = CATCH_LUNKER;

		returnCatchTable.iLargCommonCatchA = CATCH_OCTOPUS;
		returnCatchTable.iLargCommonCatchB = CATCH_MOONFISH;
		returnCatchTable.iLargCommonCatchC = CATCH_GLOOMSHARK;
		returnCatchTable.iLargCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargUnCommonCatchA = CATCH_GULPER;
		returnCatchTable.iLargUnCommonCatchB = CATCH_EMBERTAIL;
		returnCatchTable.iLargUnCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_COELACANTH;
		returnCatchTable.iLargRareCatchB = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_EMBERTAIL;
		returnCatchTable.iXLrgCommonCatchB = CATCH_GLOOMSHARK;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_COELACANTH;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_COELACANTH;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_ISOPOD;
		returnCatchTable.iXLrgRareCatchB = CATCH_COELACANTH;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_BEACH && iBiomeType == TEMPERATURE_UNDERDARK)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchC = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_EEL;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_STONEFISH;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_GHOSTCRAB;
		returnCatchTable.iSmallRareCatchB = CATCH_SQUID;
		returnCatchTable.iSmallRareCatchC = JUNK_KELP;
		returnCatchTable.iSmallRareCatchD = CATCH_FISH;
		returnCatchTable.iSmallRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_GHOSTCRAB;
		returnCatchTable.iMediCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediCommonCatchD = CATCH_SQUID;
		returnCatchTable.iMediCommonCatchE = CATCH_FISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_OCTOPUS;
		returnCatchTable.iMediUnCommonCatchB = CATCH_GIANTLAMPREY;
		returnCatchTable.iMediUnCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iMediRareCatchA = CATCH_GLOOMSHARK;
		returnCatchTable.iMediRareCatchB = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_GLOOMSHARK;
		returnCatchTable.iMediRareCatchE = CATCH_LUNKER;

		returnCatchTable.iLargCommonCatchA = CATCH_OCTOPUS;
		returnCatchTable.iLargCommonCatchB = CATCH_OCTOPUS;
		returnCatchTable.iLargCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargUnCommonCatchA = CATCH_GLOOMSHARK;
		returnCatchTable.iLargUnCommonCatchB = CATCH_GLOOMSHARK;
		returnCatchTable.iLargUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgCommonCatchA = CATCH_GLOOMSHARK;
		returnCatchTable.iXLrgCommonCatchB = CATCH_GLOOMSHARK;
		returnCatchTable.iXLrgCommonCatchC = CATCH_GLOOMSHARK;
		returnCatchTable.iXLrgCommonCatchD = CATCH_GLOOMSHARK;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_EMBERTAIL;
		returnCatchTable.iXLrgRareCatchB = CATCH_EMBERTAIL;
		returnCatchTable.iXLrgRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_RIVER && iBiomeType == TEMPERATURE_UNDERDARK)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SALMON;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchB = CATCH_SALMON;
		returnCatchTable.iSmallRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchD = CATCH_FISH;
		returnCatchTable.iSmallRareCatchE = CATCH_JEWELSHRIMP;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_GIANTLAMPREY;
		returnCatchTable.iMediCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchE = CATCH_SALMON;

		returnCatchTable.iMediUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediUnCommonCatchB = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchC = CATCH_FISH;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_EEL;

		returnCatchTable.iMediRareCatchA = CATCH_EEL;
		returnCatchTable.iMediRareCatchB = CATCH_JELLYFISH;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_FISH;
		returnCatchTable.iMediRareCatchE = CATCH_LUNKER;

		returnCatchTable.iLargCommonCatchA = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchB = CATCH_GIANTLAMPREY;
		returnCatchTable.iLargCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchD = CATCH_GIANTLAMPREY;
		returnCatchTable.iLargCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargUnCommonCatchA = CATCH_JELLYFISH;
		returnCatchTable.iLargUnCommonCatchB = CATCH_JELLYFISH;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_COELACANTH;
		returnCatchTable.iLargRareCatchB = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchD = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgCommonCatchD = CATCH_COELACANTH;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_COELACANTH;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgRareCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchB = CATCH_JELLYFISH;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_STURGEON;
		returnCatchTable.iXLrgRareCatchE = CATCH_COELACANTH;
	}
	else if(iWaterType == BIOME_LAKES && iBiomeType == TEMPERATURE_UNDERDARK)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SALMON;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchB = CATCH_SALMON;
		returnCatchTable.iSmallRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchD = CATCH_FISH;
		returnCatchTable.iSmallRareCatchE = CATCH_JEWELSHRIMP;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_EEL;
		returnCatchTable.iMediCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchE = CATCH_SALMON;

		returnCatchTable.iMediUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediUnCommonCatchB = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchC = CATCH_FISH;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_EEL;

		returnCatchTable.iMediRareCatchA = CATCH_EEL;
		returnCatchTable.iMediRareCatchB = CATCH_ANGLERFISH;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_FISH;
		returnCatchTable.iMediRareCatchE = CATCH_LUNKER;

		returnCatchTable.iLargCommonCatchA = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchB = CATCH_ANGLERFISH;
		returnCatchTable.iLargCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchD = CATCH_ANGLERFISH;
		returnCatchTable.iLargCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargUnCommonCatchA = CATCH_ANGLERFISH;
		returnCatchTable.iLargUnCommonCatchB = CATCH_ANGLERFISH;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_COELACANTH;
		returnCatchTable.iLargRareCatchB = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchD = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgCommonCatchD = CATCH_COELACANTH;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_COELACANTH;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgRareCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchB = CATCH_ANGLERFISH;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_STURGEON;
		returnCatchTable.iXLrgRareCatchE = CATCH_COELACANTH;
	}
	else if(iWaterType == BIOME_MYRKFAE && iBiomeType == TEMPERATURE_UNDERDARK)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_BLUETETRA;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_BLUETETRA;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_BLUETETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchC = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchE = CATCH_TROUT;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_TROUT;
		returnCatchTable.iMediUnCommonCatchB = CATCH_TROUT;
		returnCatchTable.iMediUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iMediRareCatchA = CATCH_GILTSCALE;
		returnCatchTable.iMediRareCatchB = CATCH_ANGLERFISH;
		returnCatchTable.iMediRareCatchC = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchD = CATCH_EEL;
		returnCatchTable.iMediRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargCommonCatchA = CATCH_TROUT;
		returnCatchTable.iLargCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchD = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchE = CATCH_ANGLERFISH;

		returnCatchTable.iLargUnCommonCatchA = CATCH_GILTSCALE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_ANGLERFISH;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_COELACANTH;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_COELACANTH;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_COELACANTH;
		returnCatchTable.iXLrgRareCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_SWAMP && iBiomeType == TEMPERATURE_UNDERDARK)//unused
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallRareCatchA = CATCH_NONE;
		returnCatchTable.iSmallRareCatchB = CATCH_NONE;
		returnCatchTable.iSmallRareCatchC = CATCH_NONE;
		returnCatchTable.iSmallRareCatchD = CATCH_NONE;
		returnCatchTable.iSmallRareCatchE = CATCH_NONE;

		returnCatchTable.iMediCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediRareCatchA = CATCH_NONE;
		returnCatchTable.iMediRareCatchB = CATCH_NONE;
		returnCatchTable.iMediRareCatchC = CATCH_NONE;
		returnCatchTable.iMediRareCatchD = CATCH_NONE;
		returnCatchTable.iMediRareCatchE = CATCH_NONE;

		returnCatchTable.iLargCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargRareCatchA = CATCH_NONE;
		returnCatchTable.iLargRareCatchB = CATCH_NONE;
		returnCatchTable.iLargRareCatchC = CATCH_NONE;
		returnCatchTable.iLargRareCatchD = CATCH_NONE;
		returnCatchTable.iLargRareCatchE = CATCH_NONE;

		returnCatchTable.iXLrgCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgRareCatchA = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchB = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchC = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchD = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchE = CATCH_NONE;
	}
	else if(iWaterType == BIOME_OCEAN && iBiomeType == TEMPERATURE_TEMPERATE)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchC = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchD = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_SARDINE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_COD;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FLOUNDER;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_SALMON;

		returnCatchTable.iSmallRareCatchA = CATCH_SQUID;
		returnCatchTable.iSmallRareCatchB = CATCH_KINGCRAB;
		returnCatchTable.iSmallRareCatchC = CATCH_SALMON;
		returnCatchTable.iSmallRareCatchD = CATCH_MACKEREL;
		returnCatchTable.iSmallRareCatchE = CATCH_MULLET;

		returnCatchTable.iMediCommonCatchA = CATCH_COD;
		returnCatchTable.iMediCommonCatchB = CATCH_FLOUNDER;
		returnCatchTable.iMediCommonCatchC = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchD = CATCH_EEL;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_SQUID;
		returnCatchTable.iMediUnCommonCatchB = CATCH_KINGCRAB;
		returnCatchTable.iMediUnCommonCatchC = CATCH_MACKEREL;
		returnCatchTable.iMediUnCommonCatchD = CATCH_MULLET;
		returnCatchTable.iMediUnCommonCatchE = CATCH_SALMON;

		returnCatchTable.iMediRareCatchA = CATCH_OCTOPUS;
		returnCatchTable.iMediRareCatchB = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchC = CATCH_TUNA;
		returnCatchTable.iMediRareCatchD = CATCH_OCTOPUS;
		returnCatchTable.iMediRareCatchE = CATCH_LUNKER;

		returnCatchTable.iLargCommonCatchA = CATCH_SQUID;
		returnCatchTable.iLargCommonCatchB = CATCH_KINGCRAB;
		returnCatchTable.iLargCommonCatchC = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchD = CATCH_MACKEREL;
		returnCatchTable.iLargCommonCatchE = CATCH_MULLET;

		returnCatchTable.iLargUnCommonCatchA = CATCH_TUNA;
		returnCatchTable.iLargUnCommonCatchB = CATCH_OCTOPUS;
		returnCatchTable.iLargUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchD = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_TUNA;
		returnCatchTable.iLargRareCatchB = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_TUNA;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_MEGALODON;
		returnCatchTable.iXLrgRareCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_BEACH && iBiomeType == TEMPERATURE_TEMPERATE)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchC = CATCH_BREAM;
		returnCatchTable.iSmallCommonCatchD = CATCH_BREAM;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_BREAM;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_FLOUNDER;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_SQUID;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_EEL;

		returnCatchTable.iSmallRareCatchA = CATCH_KINGCRAB;
		returnCatchTable.iSmallRareCatchB = CATCH_SQUID;
		returnCatchTable.iSmallRareCatchC = JUNK_KELP;
		returnCatchTable.iSmallRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchE = CATCH_MULLET;

		returnCatchTable.iMediCommonCatchA = CATCH_BREAM;
		returnCatchTable.iMediCommonCatchB = CATCH_FLOUNDER;
		returnCatchTable.iMediCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchD = CATCH_SQUID;
		returnCatchTable.iMediCommonCatchE = CATCH_EEL;

		returnCatchTable.iMediUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediUnCommonCatchB = CATCH_KINGCRAB;
		returnCatchTable.iMediUnCommonCatchC = CATCH_MULLET;
		returnCatchTable.iMediUnCommonCatchD = CATCH_OCTOPUS;
		returnCatchTable.iMediUnCommonCatchE = CATCH_BASS;

		returnCatchTable.iMediRareCatchA = CATCH_STURGEON;
		returnCatchTable.iMediRareCatchB = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchC = CATCH_SALMON;
		returnCatchTable.iMediRareCatchD = CATCH_SARDINE;
		returnCatchTable.iMediRareCatchE = CATCH_KINGCRAB;

		returnCatchTable.iLargCommonCatchA = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchB = CATCH_KINGCRAB;
		returnCatchTable.iLargCommonCatchC = CATCH_MULLET;
		returnCatchTable.iLargCommonCatchD = CATCH_OCTOPUS;
		returnCatchTable.iLargCommonCatchE = CATCH_BASS;

		returnCatchTable.iLargUnCommonCatchA = CATCH_STURGEON;
		returnCatchTable.iLargUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_OCTOPUS;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_TUNA;
		returnCatchTable.iLargRareCatchB = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_BASS;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgRareCatchA = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_RIVER && iBiomeType == TEMPERATURE_TEMPERATE)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_PERCH;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_TROUT;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_GREENTETRA;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_MULLET;

		returnCatchTable.iSmallRareCatchA = CATCH_GREENTETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_GLOWEYE;
		returnCatchTable.iSmallRareCatchC = CATCH_SALMON;
		returnCatchTable.iSmallRareCatchD = CATCH_BASS;
		returnCatchTable.iSmallRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediCommonCatchA = CATCH_TROUT;
		returnCatchTable.iMediCommonCatchB = CATCH_MULLET;
		returnCatchTable.iMediCommonCatchC = CATCH_PERCH;
		returnCatchTable.iMediCommonCatchD = CATCH_FISH;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_GLOWEYE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_SALMON;
		returnCatchTable.iMediUnCommonCatchC = CATCH_BASS;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_EEL;

		returnCatchTable.iMediRareCatchA = CATCH_STURGEON;
		returnCatchTable.iMediRareCatchB = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_EEL;
		returnCatchTable.iMediRareCatchE = CATCH_BASS;

		returnCatchTable.iLargCommonCatchA = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchB = CATCH_BASS;
		returnCatchTable.iLargCommonCatchC = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargUnCommonCatchA = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iLargUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgRareCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_STURGEON;
	}
	else if(iWaterType == BIOME_LAKES && iBiomeType == TEMPERATURE_TEMPERATE)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_JEWELSHRIMP;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_PERCH;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_GREENTETRA;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_PERCH;

		returnCatchTable.iSmallRareCatchA = CATCH_GREENTETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_GLOWEYE;
		returnCatchTable.iSmallRareCatchC = CATCH_SALMON;
		returnCatchTable.iSmallRareCatchD = CATCH_BASS;
		returnCatchTable.iSmallRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediCommonCatchA = CATCH_TROUT;
		returnCatchTable.iMediCommonCatchB = CATCH_MULLET;
		returnCatchTable.iMediCommonCatchC = CATCH_PERCH;
		returnCatchTable.iMediCommonCatchD = CATCH_FISH;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_GLOWEYE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_SALMON;
		returnCatchTable.iMediUnCommonCatchC = CATCH_BASS;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_MULLET;

		returnCatchTable.iMediRareCatchA = CATCH_STURGEON;
		returnCatchTable.iMediRareCatchB = CATCH_BASS;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_EEL;
		returnCatchTable.iMediRareCatchE = CATCH_BASS;

		returnCatchTable.iLargCommonCatchA = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchB = CATCH_BASS;
		returnCatchTable.iLargCommonCatchC = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargUnCommonCatchA = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchB = CATCH_MULLET;
		returnCatchTable.iLargUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgRareCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_STURGEON;
	}
	else if(iWaterType == BIOME_SWAMP && iBiomeType == TEMPERATURE_TEMPERATE)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_SNAIL;
		returnCatchTable.iSmallCommonCatchC = CATCH_GREENTETRA;
		returnCatchTable.iSmallCommonCatchD = CATCH_SNAIL;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_GREENTETRA;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SNAIL;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_GREENTETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchD = CATCH_GLOWEYE;
		returnCatchTable.iSmallRareCatchE = CATCH_FISH;

		returnCatchTable.iMediCommonCatchA = CATCH_GLOWEYE;
		returnCatchTable.iMediCommonCatchB = CATCH_GIANTLAMPREY;
		returnCatchTable.iMediCommonCatchC = CATCH_MULLET;
		returnCatchTable.iMediCommonCatchD = CATCH_BASS;
		returnCatchTable.iMediCommonCatchE = CATCH_EEL;

		returnCatchTable.iMediUnCommonCatchA = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchB = CATCH_BASS;
		returnCatchTable.iMediUnCommonCatchC = CATCH_MULLET;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediRareCatchA = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchB = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchE = CATCH_GLOWEYE;

		returnCatchTable.iLargCommonCatchA = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchB = CATCH_BASS;
		returnCatchTable.iLargCommonCatchC = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchD = CATCH_GIANTLAMPREY;
		returnCatchTable.iLargCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargUnCommonCatchA = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchB = CATCH_MULLET;
		returnCatchTable.iLargUnCommonCatchC = CATCH_GIANTLAMPREY;
		returnCatchTable.iLargUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_STURGEON;

		returnCatchTable.iXLrgRareCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_STURGEON;
	}
	else if(iWaterType == BIOME_OCEAN && iBiomeType == TEMPERATURE_WARM)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchC = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_FLOUNDER;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_OCTOPUS;
		returnCatchTable.iSmallRareCatchB = CATCH_SALMON;
		returnCatchTable.iSmallRareCatchC = CATCH_STINGRAY;
		returnCatchTable.iSmallRareCatchD = CATCH_FISH;
		returnCatchTable.iSmallRareCatchE = CATCH_FISH;

		returnCatchTable.iMediCommonCatchA = CATCH_STINGRAY;
		returnCatchTable.iMediCommonCatchB = CATCH_OCTOPUS;
		returnCatchTable.iMediCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediCommonCatchD = CATCH_EEL;
		returnCatchTable.iMediCommonCatchE = CATCH_MULLET;

		returnCatchTable.iMediUnCommonCatchA = CATCH_OCTOPUS;
		returnCatchTable.iMediUnCommonCatchB = CATCH_STINGRAY;
		returnCatchTable.iMediUnCommonCatchC = CATCH_MACKEREL;
		returnCatchTable.iMediUnCommonCatchD = CATCH_MULLET;
		returnCatchTable.iMediUnCommonCatchE = CATCH_SALMON;

		returnCatchTable.iMediRareCatchA = CATCH_SQUID;
		returnCatchTable.iMediRareCatchB = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchC = CATCH_TUNA;
		returnCatchTable.iMediRareCatchD = CATCH_SQUID;
		returnCatchTable.iMediRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargCommonCatchA = CATCH_OCTOPUS;
		returnCatchTable.iLargCommonCatchB = CATCH_STINGRAY;
		returnCatchTable.iLargCommonCatchC = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchD = CATCH_MACKEREL;
		returnCatchTable.iLargCommonCatchE = CATCH_MULLET;

		returnCatchTable.iLargUnCommonCatchA = CATCH_TUNA;
		returnCatchTable.iLargUnCommonCatchB = CATCH_SQUID;
		returnCatchTable.iLargUnCommonCatchC = CATCH_SUNFISH;
		returnCatchTable.iLargUnCommonCatchD = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_TUNA;
		returnCatchTable.iLargRareCatchB = CATCH_SUNFISH;
		returnCatchTable.iLargRareCatchC = CATCH_SUNFISH;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_SUNFISH;
		returnCatchTable.iXLrgCommonCatchC = CATCH_TUNA;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_MEGALODON;
		returnCatchTable.iXLrgRareCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_BEACH && iBiomeType == TEMPERATURE_WARM)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_BREAM;
		returnCatchTable.iSmallCommonCatchB = CATCH_BREAM;
		returnCatchTable.iSmallCommonCatchC = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchD = CATCH_SARDINE;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_BREAM;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_SARDINE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_FLOUNDER;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_SQUID;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_EEL;

		returnCatchTable.iSmallRareCatchA = CATCH_PINKTETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_PINKTETRA;
		returnCatchTable.iSmallRareCatchC = CATCH_FLOUNDER;
		returnCatchTable.iSmallRareCatchD = CATCH_OCTOPUS;
		returnCatchTable.iSmallRareCatchE = JUNK_KELP;

		returnCatchTable.iMediCommonCatchA = CATCH_BREAM;
		returnCatchTable.iMediCommonCatchB = CATCH_FLOUNDER;
		returnCatchTable.iMediCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchD = CATCH_OCTOPUS;
		returnCatchTable.iMediCommonCatchE = CATCH_EEL;

		returnCatchTable.iMediUnCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediUnCommonCatchB = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchC = CATCH_MULLET;
		returnCatchTable.iMediUnCommonCatchD = CATCH_SQUID;
		returnCatchTable.iMediUnCommonCatchE = CATCH_BASS;

		returnCatchTable.iMediRareCatchA = CATCH_STURGEON;
		returnCatchTable.iMediRareCatchB = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchC = CATCH_SALMON;
		returnCatchTable.iMediRareCatchD = CATCH_SARDINE;
		returnCatchTable.iMediRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargCommonCatchA = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchC = CATCH_MULLET;
		returnCatchTable.iLargCommonCatchD = CATCH_OCTOPUS;
		returnCatchTable.iLargCommonCatchE = CATCH_BASS;

		returnCatchTable.iLargUnCommonCatchA = CATCH_STURGEON;
		returnCatchTable.iLargUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_OCTOPUS;
		returnCatchTable.iLargUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargRareCatchA = CATCH_TUNA;
		returnCatchTable.iLargRareCatchB = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_BASS;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iXLrgRareCatchA = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchC = CATCH_STURGEON;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_RIVER && iBiomeType == TEMPERATURE_WARM)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallRareCatchA = CATCH_NONE;
		returnCatchTable.iSmallRareCatchB = CATCH_NONE;
		returnCatchTable.iSmallRareCatchC = CATCH_NONE;
		returnCatchTable.iSmallRareCatchD = CATCH_NONE;
		returnCatchTable.iSmallRareCatchE = CATCH_NONE;

		returnCatchTable.iMediCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediRareCatchA = CATCH_NONE;
		returnCatchTable.iMediRareCatchB = CATCH_NONE;
		returnCatchTable.iMediRareCatchC = CATCH_NONE;
		returnCatchTable.iMediRareCatchD = CATCH_NONE;
		returnCatchTable.iMediRareCatchE = CATCH_NONE;

		returnCatchTable.iLargCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargRareCatchA = CATCH_NONE;
		returnCatchTable.iLargRareCatchB = CATCH_NONE;
		returnCatchTable.iLargRareCatchC = CATCH_NONE;
		returnCatchTable.iLargRareCatchD = CATCH_NONE;
		returnCatchTable.iLargRareCatchE = CATCH_NONE;

		returnCatchTable.iXLrgCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgRareCatchA = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchB = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchC = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchD = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchE = CATCH_NONE;
	}
	else if(iWaterType == BIOME_LAKES && iBiomeType == TEMPERATURE_WARM)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallRareCatchA = CATCH_NONE;
		returnCatchTable.iSmallRareCatchB = CATCH_NONE;
		returnCatchTable.iSmallRareCatchC = CATCH_NONE;
		returnCatchTable.iSmallRareCatchD = CATCH_NONE;
		returnCatchTable.iSmallRareCatchE = CATCH_NONE;

		returnCatchTable.iMediCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediRareCatchA = CATCH_NONE;
		returnCatchTable.iMediRareCatchB = CATCH_NONE;
		returnCatchTable.iMediRareCatchC = CATCH_NONE;
		returnCatchTable.iMediRareCatchD = CATCH_NONE;
		returnCatchTable.iMediRareCatchE = CATCH_NONE;

		returnCatchTable.iLargCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargRareCatchA = CATCH_NONE;
		returnCatchTable.iLargRareCatchB = CATCH_NONE;
		returnCatchTable.iLargRareCatchC = CATCH_NONE;
		returnCatchTable.iLargRareCatchD = CATCH_NONE;
		returnCatchTable.iLargRareCatchE = CATCH_NONE;

		returnCatchTable.iXLrgCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgRareCatchA = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchB = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchC = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchD = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchE = CATCH_NONE;
	}
	else if(iWaterType == BIOME_SWAMP && iBiomeType == TEMPERATURE_WARM)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallRareCatchA = CATCH_NONE;
		returnCatchTable.iSmallRareCatchB = CATCH_NONE;
		returnCatchTable.iSmallRareCatchC = CATCH_NONE;
		returnCatchTable.iSmallRareCatchD = CATCH_NONE;
		returnCatchTable.iSmallRareCatchE = CATCH_NONE;

		returnCatchTable.iMediCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediRareCatchA = CATCH_NONE;
		returnCatchTable.iMediRareCatchB = CATCH_NONE;
		returnCatchTable.iMediRareCatchC = CATCH_NONE;
		returnCatchTable.iMediRareCatchD = CATCH_NONE;
		returnCatchTable.iMediRareCatchE = CATCH_NONE;

		returnCatchTable.iLargCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargRareCatchA = CATCH_NONE;
		returnCatchTable.iLargRareCatchB = CATCH_NONE;
		returnCatchTable.iLargRareCatchC = CATCH_NONE;
		returnCatchTable.iLargRareCatchD = CATCH_NONE;
		returnCatchTable.iLargRareCatchE = CATCH_NONE;

		returnCatchTable.iXLrgCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgRareCatchA = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchB = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchC = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchD = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchE = CATCH_NONE;
	}
	else if(iWaterType == BIOME_OCEAN && iBiomeType == TEMPERATURE_COLD)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchB = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchC = JUNK_KELP;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_COD;

		returnCatchTable.iSmallRareCatchA = CATCH_FISH;
		returnCatchTable.iSmallRareCatchB = CATCH_FISH;
		returnCatchTable.iSmallRareCatchC = CATCH_COD;
		returnCatchTable.iSmallRareCatchD = CATCH_LUMPFISH;
		returnCatchTable.iSmallRareCatchE = CATCH_KINGCRAB;

		returnCatchTable.iMediCommonCatchA = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchB = CATCH_FISH;
		returnCatchTable.iMediCommonCatchC = CATCH_MULLET;
		returnCatchTable.iMediCommonCatchD = CATCH_COD;
		returnCatchTable.iMediCommonCatchE = CATCH_COD;

		returnCatchTable.iMediUnCommonCatchA = CATCH_COD;
		returnCatchTable.iMediUnCommonCatchB = CATCH_LUMPFISH;
		returnCatchTable.iMediUnCommonCatchC = CATCH_KINGCRAB;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_MULLET;

		returnCatchTable.iMediRareCatchA = CATCH_KINGCRAB;
		returnCatchTable.iMediRareCatchB = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchB = CATCH_KINGCRAB;
		returnCatchTable.iLargCommonCatchC = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchD = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchE = CATCH_SALMON;

		returnCatchTable.iLargUnCommonCatchA = CATCH_KINGCRAB;
		returnCatchTable.iLargUnCommonCatchB = CATCH_MULLET;
		returnCatchTable.iLargUnCommonCatchC = CATCH_LUMPFISH;
		returnCatchTable.iLargUnCommonCatchD = CATCH_LUMPFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_TUNA;
		returnCatchTable.iLargRareCatchB = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_KINGCRAB;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_TUNA;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUMPFISH;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_TUNA;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_MEGALODON;
		returnCatchTable.iXLrgRareCatchB = CATCH_TUNA;
		returnCatchTable.iXLrgRareCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_BEACH && iBiomeType == TEMPERATURE_COLD)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallRareCatchA = CATCH_NONE;
		returnCatchTable.iSmallRareCatchB = CATCH_NONE;
		returnCatchTable.iSmallRareCatchC = CATCH_NONE;
		returnCatchTable.iSmallRareCatchD = CATCH_NONE;
		returnCatchTable.iSmallRareCatchE = CATCH_NONE;

		returnCatchTable.iMediCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediRareCatchA = CATCH_NONE;
		returnCatchTable.iMediRareCatchB = CATCH_NONE;
		returnCatchTable.iMediRareCatchC = CATCH_NONE;
		returnCatchTable.iMediRareCatchD = CATCH_NONE;
		returnCatchTable.iMediRareCatchE = CATCH_NONE;

		returnCatchTable.iLargCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargRareCatchA = CATCH_NONE;
		returnCatchTable.iLargRareCatchB = CATCH_NONE;
		returnCatchTable.iLargRareCatchC = CATCH_NONE;
		returnCatchTable.iLargRareCatchD = CATCH_NONE;
		returnCatchTable.iLargRareCatchE = CATCH_NONE;

		returnCatchTable.iXLrgCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgRareCatchA = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchB = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchC = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchD = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchE = CATCH_NONE;
	}
	else if(iWaterType == BIOME_RIVER && iBiomeType == TEMPERATURE_COLD)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_BLUETETRA;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_BLUETETRA;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_BLUETETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchC = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchE = CATCH_TROUT;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediCommonCatchD = CATCH_TROUT;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_TROUT;
		returnCatchTable.iMediUnCommonCatchB = CATCH_TROUT;
		returnCatchTable.iMediUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iMediRareCatchA = CATCH_GILTSCALE;
		returnCatchTable.iMediRareCatchB = CATCH_GILTSCALE;
		returnCatchTable.iMediRareCatchC = CATCH_EEL;
		returnCatchTable.iMediRareCatchD = CATCH_EEL;
		returnCatchTable.iMediRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargCommonCatchA = CATCH_TROUT;
		returnCatchTable.iLargCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchD = CATCH_TROUT;
		returnCatchTable.iLargCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargUnCommonCatchA = CATCH_GILTSCALE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_SALMON;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_STURGEON;
		returnCatchTable.iXLrgRareCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_LAKES && iBiomeType == TEMPERATURE_COLD)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchB = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallCommonCatchD = CATCH_FISH;
		returnCatchTable.iSmallCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_BLUETETRA;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_BLUETETRA;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_MINNOW;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iSmallRareCatchA = CATCH_BLUETETRA;
		returnCatchTable.iSmallRareCatchB = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchC = CATCH_JEWELSHRIMP;
		returnCatchTable.iSmallRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iSmallRareCatchE = CATCH_TROUT;

		returnCatchTable.iMediCommonCatchA = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchB = CATCH_SALMON;
		returnCatchTable.iMediCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iMediUnCommonCatchA = CATCH_TROUT;
		returnCatchTable.iMediUnCommonCatchB = CATCH_TROUT;
		returnCatchTable.iMediUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iMediUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iMediUnCommonCatchE = CATCH_FISH;

		returnCatchTable.iMediRareCatchA = CATCH_GILTSCALE;
		returnCatchTable.iMediRareCatchB = CATCH_GILTSCALE;
		returnCatchTable.iMediRareCatchC = CATCH_LUNKER;
		returnCatchTable.iMediRareCatchD = CATCH_EEL;
		returnCatchTable.iMediRareCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargCommonCatchA = CATCH_TROUT;
		returnCatchTable.iLargCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iLargCommonCatchC = CATCH_FLATFISH;
		returnCatchTable.iLargCommonCatchD = CATCH_SALMON;
		returnCatchTable.iLargCommonCatchE = CATCH_FLATFISH;

		returnCatchTable.iLargUnCommonCatchA = CATCH_GILTSCALE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_GILTSCALE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_EEL;
		returnCatchTable.iLargUnCommonCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iLargRareCatchA = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchB = CATCH_STURGEON;
		returnCatchTable.iLargRareCatchC = CATCH_LUNKER;
		returnCatchTable.iLargRareCatchD = CATCH_FLATFISH;
		returnCatchTable.iLargRareCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgCommonCatchA = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_STURGEON;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_LUNKER;

		returnCatchTable.iXLrgRareCatchA = CATCH_STURGEON;
		returnCatchTable.iXLrgRareCatchB = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchC = CATCH_FLATFISH;
		returnCatchTable.iXLrgRareCatchD = CATCH_LUNKER;
		returnCatchTable.iXLrgRareCatchE = CATCH_LUNKER;
	}
	else if(iWaterType == BIOME_SWAMP && iBiomeType == TEMPERATURE_COLD)
	{
		returnCatchTable.iSmallCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iSmallUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iSmallRareCatchA = CATCH_NONE;
		returnCatchTable.iSmallRareCatchB = CATCH_NONE;
		returnCatchTable.iSmallRareCatchC = CATCH_NONE;
		returnCatchTable.iSmallRareCatchD = CATCH_NONE;
		returnCatchTable.iSmallRareCatchE = CATCH_NONE;

		returnCatchTable.iMediCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iMediUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iMediRareCatchA = CATCH_NONE;
		returnCatchTable.iMediRareCatchB = CATCH_NONE;
		returnCatchTable.iMediRareCatchC = CATCH_NONE;
		returnCatchTable.iMediRareCatchD = CATCH_NONE;
		returnCatchTable.iMediRareCatchE = CATCH_NONE;

		returnCatchTable.iLargCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iLargUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iLargRareCatchA = CATCH_NONE;
		returnCatchTable.iLargRareCatchB = CATCH_NONE;
		returnCatchTable.iLargRareCatchC = CATCH_NONE;
		returnCatchTable.iLargRareCatchD = CATCH_NONE;
		returnCatchTable.iLargRareCatchE = CATCH_NONE;

		returnCatchTable.iXLrgCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgUnCommonCatchA = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchB = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchC = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchD = CATCH_NONE;
		returnCatchTable.iXLrgUnCommonCatchE = CATCH_NONE;

		returnCatchTable.iXLrgRareCatchA = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchB = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchC = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchD = CATCH_NONE;
		returnCatchTable.iXLrgRareCatchE = CATCH_NONE;
	}

	return returnCatchTable;
}

struct CatchType GetCatchFromID(int catchID)
{
	struct CatchType returnCatch;
	switch(catchID)
	{
		case CATCH_JELLYFISH:
			returnCatch.message = Colorize("...You catch an andunorian jellyfish.",COLOR_GREEN);
			returnCatch.resref = "sfmed_000";
			returnCatch.exp = 10;
			break;
		case CATCH_ANGLERFISH:
			returnCatch.message = Colorize("...You catch an angler fish.",COLOR_GREEN);
			returnCatch.resref = "sfmed_001";
			returnCatch.exp = 10;
			break;
		case CATCH_SNAIL:
			returnCatch.message = Colorize("...You catch an aquatic snail.",COLOR_GREEN);
			returnCatch.resref = "sfsml_009";
			returnCatch.exp = 5;
			break;
		case CATCH_BASS:
			returnCatch.message = Colorize("...You catch a bass.",COLOR_GREEN);
			returnCatch.resref = "sfmed_002";
			returnCatch.exp = 10;
			break;
		case CATCH_TUNA:
			returnCatch.message = Colorize("...You catch a blade tuna.",COLOR_GREEN);
			returnCatch.resref = "sflrg_000";
			returnCatch.exp = 15;
			break;
		case CATCH_BLUETETRA:
			returnCatch.message = Colorize("...You catch a blue tetra.",COLOR_GREEN);
			returnCatch.resref = "sfsml_000";
			returnCatch.exp = 5;
			break;
		case CATCH_BREAM:
			returnCatch.message = Colorize("...You catch a bream.",COLOR_GREEN);
			returnCatch.resref = "sfsml_007";
			returnCatch.exp = 5;
			break;
		case CATCH_AMMONITE:
			returnCatch.message = Colorize("...You catch a calciferous ammonite.",COLOR_GREEN);
			returnCatch.resref = "sfmed_003";
			returnCatch.exp = 10;
			break;
		case CATCH_COELACANTH:
			returnCatch.message = Colorize("...You catch a coelacanth.",COLOR_GREEN);
			returnCatch.resref = "sflrg_001";
			returnCatch.exp = 15;
			break;
		case CATCH_EEL:
			returnCatch.message = Colorize("...You catch an eel.",COLOR_GREEN);
			returnCatch.resref = "sfmed_020";
			returnCatch.exp = 10;
			break;
		case CATCH_EMBERTAIL:
			returnCatch.message = Colorize("...You catch an embertail.",COLOR_GREEN);
			returnCatch.resref = "sflrg_007";
			returnCatch.exp = 15;
			break;
		case CATCH_PERCH:
			returnCatch.message = Colorize("...You catch a flying perch.",COLOR_GREEN);
			returnCatch.resref = "sfsml_005";
			returnCatch.exp = 5;
			break;
		case CATCH_ISOPOD:
			returnCatch.message = Colorize("...You catch a gargantuan isopod. Woah!",COLOR_GREEN);
			returnCatch.resref = "sflrg_008";
			returnCatch.exp = 25;
			break;
		case CATCH_GHOSTCRAB:
			returnCatch.message = Colorize("...You catch a ghost crab.",COLOR_GREEN);
			returnCatch.resref = "sfmed_016";
			returnCatch.exp = 10;
			break;
		case CATCH_GIANTLAMPREY:
			returnCatch.message = Colorize("...You catch a giant lamprey.",COLOR_GREEN);
			returnCatch.resref = "sfmed_011";
			returnCatch.exp = 10;
			break;
		case CATCH_GILTSCALE:
			returnCatch.message = Colorize("...You catch a giltscale.",COLOR_GREEN);
			returnCatch.resref = "sfmed_005";
			returnCatch.exp = 10;
			break;
		case CATCH_GLOOMSHARK:
			returnCatch.message = Colorize("...You catch a gloom shark.",COLOR_GREEN);
			returnCatch.resref = "sflrg_002";
			returnCatch.exp = 15;
			break;
		case CATCH_GLOWEYE:
			returnCatch.message = Colorize("...You catch a gloweye.",COLOR_GREEN);
			returnCatch.resref = "sfmed_006";
			returnCatch.exp = 10;
			break;
		case CATCH_MEGALODON:
			returnCatch.message = Colorize("...You catch a megalodon. Woah!",COLOR_GREEN);
			returnCatch.resref = "sflrg_003";
			returnCatch.exp = 25;
			break;
		case CATCH_GREENTETRA:
			returnCatch.message = Colorize("...You catch a green tetra.",COLOR_GREEN);
			returnCatch.resref = "sfsml_001";
			returnCatch.exp = 5;
			break;
		case CATCH_GULPER:
			returnCatch.message = Colorize("...You catch a gulper.",COLOR_GREEN);
			returnCatch.resref = "sfmed_007";
			returnCatch.exp = 10;
			break;
		case CATCH_JEWELSHRIMP:
			returnCatch.message = Colorize("...You catch a jewel shrimp.",COLOR_GREEN);
			returnCatch.resref = "sfsml_003";
			returnCatch.exp = 5;
			break;
		case CATCH_KINGCRAB:
			returnCatch.message = Colorize("...You catch a king crab.",COLOR_GREEN);
			returnCatch.resref = "sfmed_008";
			returnCatch.exp = 10;
			break;
		case CATCH_LUMPFISH:
			returnCatch.message = Colorize("...You catch a lumpfish.",COLOR_GREEN);
			returnCatch.resref = "sfmed_009";
			returnCatch.exp = 10;
			break;
		case CATCH_MACKEREL:
			returnCatch.message = Colorize("...You catch a mackerel.",COLOR_GREEN);
			returnCatch.resref = "sfmed_019";
			returnCatch.exp = 10;
			break;
		case CATCH_MINNOW:
			returnCatch.message = Colorize("...You catch a minnow.",COLOR_GREEN);
			returnCatch.resref = "sfsml_008";
			returnCatch.exp = 5;
			break;
		case CATCH_MOONFISH:
			returnCatch.message = Colorize("...You catch a moonfish.",COLOR_GREEN);
			returnCatch.resref = "sflrg_004";
			returnCatch.exp = 15;
			break;
		case CATCH_MULLET:
			returnCatch.message = Colorize("...You catch a mullet.",COLOR_GREEN);
			returnCatch.resref = "sfmed_012";
			returnCatch.exp = 10;
			break;
		case CATCH_OCTOPUS:
			returnCatch.message = Colorize("...You catch an octopus.",COLOR_GREEN);
			returnCatch.resref = "sfmed_013";
			returnCatch.exp = 10;
			break;
		case CATCH_PINKTETRA:
			returnCatch.message = Colorize("...You catch a pink tetra.",COLOR_GREEN);
			returnCatch.resref = "sfsml_002";
			returnCatch.exp = 5;
			break;
		case CATCH_SALMON:
			returnCatch.message = Colorize("...You catch a redfin salmon.",COLOR_GREEN);
			returnCatch.resref = "sfmed_014";
			returnCatch.exp = 10;
			break;
		case CATCH_FLOUNDER:
			returnCatch.message = Colorize("...You catch a sand flounder.",COLOR_GREEN);
			returnCatch.resref = "sfmed_015";
			returnCatch.exp = 10;
			break;
		case CATCH_SARDINE:
			returnCatch.message = Colorize("...You catch a sardine.",COLOR_GREEN);
			returnCatch.resref = "sfsml_006";
			returnCatch.exp = 5;
			break;
		case CATCH_SQUID:
			returnCatch.message = Colorize("...You catch a squid.",COLOR_GREEN);
			returnCatch.resref = "sfmed_017";
			returnCatch.exp = 10;
			break;
		case CATCH_STINGRAY:
			returnCatch.message = Colorize("...You catch a stingray.",COLOR_GREEN);
			returnCatch.resref = "sfmed_018";
			returnCatch.exp = 10;
			break;
		case CATCH_STONEFISH:
			returnCatch.message = Colorize("...You catch a stonefish.",COLOR_GREEN);
			returnCatch.resref = "sfsml_004";
			returnCatch.exp = 5;
			break;
		case CATCH_STURGEON:
			returnCatch.message = Colorize("...You catch a sturgeon.",COLOR_GREEN);
			returnCatch.resref = "sflrg_006";
			returnCatch.exp = 15;
			break;
		case CATCH_SUNFISH:
			returnCatch.message = Colorize("...You catch a sunfish.",COLOR_GREEN);
			returnCatch.resref = "sflrg_005";
			returnCatch.exp = 15;
			break;
		case CATCH_TROUT:
			returnCatch.message = Colorize("...You catch a trout.",COLOR_GREEN);
			returnCatch.resref = "sfmed_010";
			returnCatch.exp = 10;
			break;
		case CATCH_COD:
			returnCatch.message = Colorize("...You catch a violet-eye cod.",COLOR_GREEN);
			returnCatch.resref = "sfmed_004";
			returnCatch.exp = 10;
			break;
		case JUNK_CRAB_LEG:
			returnCatch.message = Colorize("...You catch a single crab leg.",COLOR_GREEN);
			returnCatch.resref = "sf_hv014";
			returnCatch.exp = 0;
			break;
		case JUNK_FISH_BONES:
			returnCatch.message = Colorize("...You catch some fish bones.",COLOR_GREEN);
			returnCatch.resref = "sf_hv016";
			returnCatch.exp = 0;
			break;
		case JUNK_BONE:
			returnCatch.message = Colorize("...You catch a bone.",COLOR_GREEN);
			returnCatch.resref = "GS_ITEM039";
			returnCatch.exp = 0;
			break;
		case JUNK_SKULL:
			returnCatch.message = Colorize("..You catch a skull.",COLOR_GREEN);
			returnCatch.resref = "gs_item024";
			returnCatch.exp = 0;
			break;
		case JUNK_SOFT_WOOD:
			returnCatch.message = Colorize("...You catch a piece of driftwood.",COLOR_GREEN);
			returnCatch.resref = "GS_ITEM901";
			returnCatch.exp = 0;
			break;
		case JUNK_KELP:
			returnCatch.message = Colorize("...You catch some kelp.",COLOR_GREEN);
			returnCatch.resref = "sf_hv003";
			returnCatch.exp = 0;
			break;
		case JUNK_RING:
			returnCatch.message = Colorize("...You catch a copper ring.",COLOR_GREEN);
			returnCatch.resref = "it_mring021";
			returnCatch.exp = 0;
			break;
		case JUNK_NECKLACE:
			returnCatch.message = Colorize("...You catch a copper necklace.",COLOR_GREEN);
			returnCatch.resref = "it_mneck021";
			returnCatch.exp = 0;
			break;
		case JUNK_BOOTS:
			returnCatch.message = Colorize("...You catch some old boots.",COLOR_GREEN);
			returnCatch.resref = "ar_it_stinkboots";
			returnCatch.exp = 0;
			break;
		case JUNK_DOLL:
			returnCatch.message = Colorize("...You catch a waterlogged doll.",COLOR_GREEN);
			returnCatch.resref = "it_thrift_007";
			returnCatch.exp = 0;
			break;
		case LOOT_FISHRING:
			returnCatch.message = Colorize("...You catch a strange ring.",COLOR_GREEN);
			returnCatch.resref = "ar_it_fishring";
			returnCatch.exp = 15;
			break;
		case CATCH_FISH:
			returnCatch.message = Colorize("...You catch a fish.",COLOR_GREEN);
			returnCatch.resref = "nw_it_msmlmisc20";
			returnCatch.exp = 5;
			break;
		case CATCH_FLATFISH:
			returnCatch.message = Colorize("...You catch a scarfinned flatfish.",COLOR_GREEN);
			returnCatch.resref = "ar_it_lunker001";
			returnCatch.exp = 10;
			break;
		case CATCH_LUNKER:
			returnCatch.message = Colorize("...You catch a lunker.",COLOR_GREEN);
			returnCatch.resref = "ar_it_lunker";
			returnCatch.exp = 15;
			break;
		case CATCH_NONE:
			returnCatch.message = Colorize("...Something has gone wrong with the FISH ID[NULL]. Please send in a bug report to the Bug Forum, tell us where you were when you encountered this message.",COLOR_RED);
			returnCatch.resref = "";
			returnCatch.exp = 0;
			break;
		default:
			SendMessageToPC(OBJECT_SELF, Colorize("...Something has gone wrong with the FISH ID[UNEXPECTED]. Please send in a bug report to the Bug Forum, tell us where you were when you encountered this message.",COLOR_RED));
			returnCatch.resref = "";
			returnCatch.exp = 0;
			break;
	}
	return returnCatch;
}
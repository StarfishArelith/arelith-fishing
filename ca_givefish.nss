//rewritten by Starfish
#include "inc_fishing"

/*fish reference table (refer to "i_sf_fish" for drops and in-module for proper item names)
	Fish					Size	Ocean	Beach	Lake	River	Swamp	Warm	Temperate	Cold 	Surface 	Upperdark(While in UD, fish ignore temperature (mostly))
	Bass					M				x		x		x		x				x					x	
	Sand Flounder			M		x	 	x				 				x	 	x					x	
	Trout					M			 			x		x						x			x		x	
	King Crab				M		x		x										x			x		x	
	Blade Tuna				L		x										x		x			x		x	
	Redfin Salmon			M		x		x		x		x				x		x			x		x			x
	Violet-Eye Cod			M		x												x			x		x			x
	CATCH_SQUID					M		x		x								x		x			x		x 			x
	Octopus					M		x		x								x		x			x		x			x
	Sardine					S		x		x								x		x					x			x
	Flying Perch			S						x		x				x		x					x	
	Sturgeon				L				x		x		x		x		x		x			x		x			x
	Mackerel				M		x										x		x					x	
	Mullet					M		x		x		x		x		x		x		x			x		x	
	Bream					S				x								x		x					x	
	Giltscale				M						x											x		x	
	Minnow					S						x		x		x				x					x			x
	Eel						M		x		x				x		x		x		x			x		x 			x
	Jewel Shrimp			S						x		x		x				x					x			x
	Aquatic Snail			S										x				x					x			x
	Gloweye					M						x		x		x				x					x	
	Stingray				M		x		x								x							x	
	Sunfish					L		x										x							x	
	Great Shark				XL		x										x		x			x		x	
	Green Tetra				S						x		x		x				x					x	
	Blue Tetra				S						x		x									x		x	
	Pink Tetra				S				x								x							x	
	Gargantuan Isopod		XL		x																				x
	Anglerfish				M		x				x											x
	Coelacanth				L		x				x											x
	Gulper					M		x															
	Giant Lamprey			M		x		x				x		x		x		x			x		x 			x
	Ghost Crab				M				x																		x
	Lumpfish				M		x		x													x					
	Embertail				L				x																		x
	Stonefish				S		x		x																		x
	Moonfish				L		x																				x
	Andunorian Jellyfish	M								x														x
	Gloom Shark				L		x		x																		x
	Calciferous Ammonite	M		x															
*/

void main()
{
	object oPC = OBJECT_SELF;
	object oArea = GetArea(oPC);
	string sArea = GetResRef(oArea);

	GetAreaLIDFromResrefAndIntitiateFishing(sArea);
	DeleteLocalString(oPC, "TIMER_EVENT");
}
#include "inc_fishing"
#include "inc_emotes"

void main()
{
	object oItem = GetItemActivated();
	object oActivator = GetItemActivator();
	object oTarget = GetItemActivatedTarget();
	int iFish = GetLocalInt(oTarget, "FISH");

	//do we reduce the item in inventory?
	int bItemRedux = TRUE;

	switch(iFish)
	{
		case CATCH_JELLYFISH://jellyfish
		{
			CreateItemOnObject(HARVEST_JELLY, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_JELLYFISH_STINGER, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_ANGLERFISH://anglerfish
		{
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_BIOLUMINESCENT_GEL, oActivator, Random(4) + 1);
			break;
		}
		case CATCH_SNAIL://snail
		{
			CreateItemOnObject(HARVEST_SMALL_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_TOUGH_SHELL, oActivator, 1);
			break;
		}
		case CATCH_BASS://bass
		{
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_TUNA://tuna
		{
			CreateItemOnObject(HARVEST_OIL, oActivator, Random(3) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			break;
		}
		case CATCH_BLUETETRA:
		case CATCH_GREENTETRA:
		case CATCH_PINKTETRA://blue, green and pink tetra
		{
			SendMessageToPC(oActivator, Colorize("You ruin the tetra.",COLOR_RED));
			break;
		}
		case CATCH_BREAM://bream
		{
			CreateItemOnObject(HARVEST_SMALL_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2));
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2));
			break;
		}
		case CATCH_AMMONITE://ammonite
		{
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_AMMONITE_SHELL, oActivator, 1);
			CreateItemOnObject(HARVEST_TENTACLE, oActivator, Random(8) + 1);
			break;
		}
		case CATCH_COELACANTH://coelacanth
		{
			CreateItemOnObject(HARVEST_OIL, oActivator, Random(3) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			break;
		}
		case CATCH_EEL://eel
		{
			CreateItemOnObject(HARVEST_GUTTED_EEL, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2));
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2));
			break;
		}
		case CATCH_EMBERTAIL://embertail
		{
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_SHARP_PINCER, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_PERCH://perch
		{
			CreateItemOnObject(HARVEST_SAIL_FIN, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_SMALL_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, 1);
			break;
		}
		case CATCH_ISOPOD://isopod
		{
			CreateItemOnObject(HARVEST_GLIMSHELL, oActivator, Random(3) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_TOUGH_SHELL, oActivator, Random(5) + 1);
			CreateItemOnObject(HARVEST_PEARL, oActivator, Random(4));
			
			SendMessageToPC(oActivator, Colorize("In the guts of the beast you find a...",COLOR_GREEN));
			switch(Random(9))
			{
				case 0:
					CreateItemOnObject("ar_it_fishring", oActivator, 1);//fish king ring
					SendMessageToPC(oActivator, Colorize("...Strange ring.",COLOR_GREEN));
					break;
				case 1:
					CreateItemOnObject(LOOT_STAR_SAPPHIRE, oActivator, 1);//star sapphire
					SendMessageToPC(oActivator, Colorize("...Star trapped in sapphire.",COLOR_GREEN));
					break;
				case 2:
					CreateItemOnObject(LOOT_BELJURIL, oActivator, 1);//beljuril
					SendMessageToPC(oActivator, Colorize("...Glittering sea-green stone.",COLOR_GREEN));
					break;
				case 3:
					CreateItemOnObject(LOOT_ROGUE_STONE, oActivator, 1);//rogue stone
					SendMessageToPC(oActivator, Colorize("...Roguish stone.",COLOR_GREEN));
					break;
				case 4:
					CreateItemOnObject(LOOT_MITHRIL_DUST, oActivator, 1);//mithril dust
					SendMessageToPC(oActivator, Colorize("...Pouch of glittering dust.",COLOR_GREEN));
					break;
				case 5:
					CreateItemOnObject(LOOT_FISH_BOOT, oActivator, 1);//fishing boots
					SendMessageToPC(oActivator, Colorize("...Pair of oiled boots.",COLOR_GREEN));
					break;
				case 6:
					CreateItemOnObject(LOOT_MAP_PIECE, oActivator, 1);//map piece
					SendMessageToPC(oActivator, Colorize("...Torn piece of parchment.",COLOR_GREEN));
					break;
				case 7:
					CreateItemOnObject(LOOT_DRAGON_HIDE, oActivator, 1);//dragon hide
					SendMessageToPC(oActivator, Colorize("...Length of sturdy hide.",COLOR_GREEN));
					break;
				case 8:
					GiveGoldToCreature(oActivator, Random(10000) + 2000);//gold
					SendMessageToPC(oActivator, Colorize("...Small hoard of gold.",COLOR_GREEN));
					break;
			}

			break;
		}
		case CATCH_GHOSTCRAB:
		case CATCH_KINGCRAB://ghost or king crab
		{
			CreateItemOnObject(HARVEST_CRAB_LEG, oActivator, Random(8) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_TOUGH_SHELL, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_GIANTLAMPREY://lamprey
		{
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_GILTSCALE://giltscale
		{
			CreateItemOnObject(HARVEST_GOLD_SCALE, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_GLOOMSHARK://gloomshark
		{
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_LARGE_HIDE, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(5) + 1);
			CreateItemOnObject(HARVEST_SHARK_TOOTH, oActivator, Random(8) + 1);
			CreateItemOnObject(HARVEST_SHARK_FIN, oActivator, 1);

			
			if(Random(10) > 6)
			{
				SendMessageToPC(oActivator, Colorize("In the guts of the shark you find an...",COLOR_GREEN));
				switch(Random(9))
				{
					case 0:
						CreateItemOnObject("sfmed_014", oActivator, 1);//salmon
						SendMessageToPC(oActivator, Colorize("...Intact salmon.",COLOR_GREEN));
						break;
					case 1:
						CreateItemOnObject("sfmed_004", oActivator, 1);//cod
						SendMessageToPC(oActivator, Colorize("...Intact cod.",COLOR_GREEN));
						break;
					case 2:
						CreateItemOnObject("sfmed_017", oActivator, 1);//squid
						SendMessageToPC(oActivator, Colorize("...Intact squid.",COLOR_GREEN));
						break;
					case 3:
						CreateItemOnObject("sfmed_013", oActivator, 1);//octopus
						SendMessageToPC(oActivator, Colorize("...Intact octopus.",COLOR_GREEN));
						break;
					case 4:
						CreateItemOnObject("sfmed_020", oActivator, 1);//eel
						SendMessageToPC(oActivator, Colorize("...Intact eel.",COLOR_GREEN));
						break;
					case 5:
						CreateItemOnObject("sfmed_001", oActivator, 1);//anglerfish
						SendMessageToPC(oActivator, Colorize("...Intact anglerfish.",COLOR_GREEN));
						break;
					case 6:
						CreateItemOnObject("sfmed_007", oActivator, 1);//gulper
						SendMessageToPC(oActivator, Colorize("...Intact gulper.",COLOR_GREEN));
						break;
					case 7:
						CreateItemOnObject("sfmed_011", oActivator, 1);//lamprey
						SendMessageToPC(oActivator, Colorize("...Intact lamprey.",COLOR_GREEN));
						break;
					case 8:
						CreateItemOnObject("sfmed_003", oActivator, 1);//ammonite
						SendMessageToPC(oActivator, Colorize("...Intact ammonite.",COLOR_GREEN));
						break;
				}
			}
			break;
		}
		case CATCH_GLOWEYE://gloweye
		{
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_MEGALODON://megalodon
		{
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_LARGE_HIDE, oActivator, 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_MEDIUM_HIDE, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(5) + 1);
			CreateItemOnObject(HARVEST_SHARK_TOOTH, oActivator, Random(12) + 1);
			CreateItemOnObject(HARVEST_SHARK_FIN, oActivator, 2);

			SendMessageToPC(oActivator, Colorize("In the guts of the beast you find a...",COLOR_GREEN));
			switch(Random(9))
			{
				case 0:
					CreateItemOnObject("ar_it_fishring", oActivator, 1);//fish king ring
					SendMessageToPC(oActivator, Colorize("...Strange ring.",COLOR_GREEN));
					break;
				case 1:
					CreateItemOnObject(LOOT_STAR_SAPPHIRE, oActivator, 1);//star sapphire
					SendMessageToPC(oActivator, Colorize("...Star trapped in sapphire.",COLOR_GREEN));
					break;
				case 2:
					CreateItemOnObject(LOOT_BELJURIL, oActivator, 1);//beljuril
					SendMessageToPC(oActivator, Colorize("...Glittering sea-green stone.",COLOR_GREEN));
					break;
				case 3:
					CreateItemOnObject(LOOT_ROGUE_STONE, oActivator, 1);//rogue stone
					SendMessageToPC(oActivator, Colorize("...Roguish stone.",COLOR_GREEN));
					break;
				case 4:
					CreateItemOnObject(LOOT_MITHRIL_DUST, oActivator, 1);//mithril dust
					SendMessageToPC(oActivator, Colorize("...Pouch of glittering dust.",COLOR_GREEN));
					break;
				case 5:
					CreateItemOnObject(LOOT_FISH_BOOT, oActivator, 1);//fishing boots
					SendMessageToPC(oActivator, Colorize("...Pair of oiled boots.",COLOR_GREEN));
					break;
				case 6:
					CreateItemOnObject(LOOT_MAP_PIECE, oActivator, 1);//map piece
					SendMessageToPC(oActivator, Colorize("...Torn piece of parchment.",COLOR_GREEN));
					break;
				case 7:
					CreateItemOnObject(LOOT_DRAGON_HIDE, oActivator, 1);//dragon hide
					SendMessageToPC(oActivator, Colorize("...Length of sturdy hide.",COLOR_GREEN));
					break;
				case 8:
					GiveGoldToCreature(oActivator, Random(10000) + 2000);//gold
					SendMessageToPC(oActivator, Colorize("...Small hoard of gold.",COLOR_GREEN));
					break;
			}

			break;
		}
		case CATCH_GULPER://gulper
		{
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2));
			//treasure
			SendMessageToPC(oActivator, Colorize("In the guts of the fish you find a...",COLOR_GREEN));
			switch(Random(10))
			{
				case 0:
					CreateItemOnObject("ar_it_fishring", oActivator, 1);//fish king ring
					SendMessageToPC(oActivator, Colorize("...Strange ring.",COLOR_GREEN));
					break;
				case 1:
					CreateItemOnObject(LOOT_RUNIC_HOOK, oActivator, 1);//runic fish hook
					SendMessageToPC(oActivator, Colorize("...Strange hook.",COLOR_GREEN));
					break;
				case 2:
					CreateItemOnObject(LOOT_LUCKY_HOOK, oActivator, 1);//lucky fish hook
					SendMessageToPC(oActivator, Colorize("...Lucky hook.",COLOR_GREEN));
					break;
				case 3:
					CreateItemOnObject(HARVEST_JELLY, oActivator, Random(3) + 1);//jelly
					SendMessageToPC(oActivator, Colorize("...Clump of jelly.",COLOR_GREEN));
					break;
				case 4:
					CreateItemOnObject("sf_hv003", oActivator, Random(3) + 1);//kelp
					SendMessageToPC(oActivator, Colorize("...Knot of kelp.",COLOR_GREEN));
					break;
				case 5:
					CreateItemOnObject(HARVEST_GOLD_SCALE, oActivator, Random(3) + 1);//gold scale
					SendMessageToPC(oActivator, Colorize("...Few golden scales.",COLOR_GREEN));
					break;
				case 6:
					CreateItemOnObject(HARVEST_STONEFISH_SPINE, oActivator, 1);//stonefish spine
					SendMessageToPC(oActivator, Colorize("...Stonefish spine.",COLOR_GREEN));
					break;
				case 7:
					CreateItemOnObject(HARVEST_GLIMSHELL, oActivator, 1);//glimshell shard
					SendMessageToPC(oActivator, Colorize("...Shard of glimmering shell.",COLOR_GREEN));
					break;
				case 8:
					GiveGoldToCreature(oActivator, Random(100) + 20);//gold
					SendMessageToPC(oActivator, Colorize("...Small bit of gold.",COLOR_GREEN));
					break;
				case 9:
					CreateItemOnObject(LOOT_ILLITHID_TENTACLE, oActivator, 1);//illithid tentacle
					SendMessageToPC(oActivator, Colorize("...Weird tentacle.",COLOR_GREEN));
					break;
			}
		}
		case CATCH_JEWELSHRIMP://shrimp
		{
			CreateItemOnObject(HARVEST_TOUGH_SHELL, oActivator, Random(2));
			CreateItemOnObject(HARVEST_SMALL_MEAT, oActivator, 1);
			break;
		}
		case CATCH_LUMPFISH://lumpfish
		{
			CreateItemOnObject(HARVEST_LUMPFISH_FLUID, oActivator, Random(3) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_MACKEREL://mackerel
		{
			CreateItemOnObject(HARVEST_MACKEREL_CHUNK, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_MINNOW://minnow
		{
			CreateItemOnObject(HARVEST_SMALL_MEAT, oActivator, 1);
			break;
		}
		case CATCH_MOONFISH:
		case CATCH_SUNFISH://moon/sun fish
		{
			CreateItemOnObject(HARVEST_LUMINOUS_SCALE, oActivator, Random(7) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			break;
		}
		case CATCH_MULLET://mullet
		{
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_OCTOPUS://octopus
		{
			CreateItemOnObject(HARVEST_TENTACLE, oActivator, Random(8) + 1);
			CreateItemOnObject(HARVEST_INK, oActivator, Random(3) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_SALMON://salmon
		{
			CreateItemOnObject(HARVEST_SALMON_FILLET, oActivator, Random(3) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			if(Random(12) + 1 > 7)//slightly skewed gender checker for fish. if female, give some roe
			{
				CreateItemOnObject(HARVEST_ORANGE_ROE, oActivator, Random(5) + 1);
			}
			break;
		}
		case CATCH_FLOUNDER://flounder
		{
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(3) + 1);
			break;
		}
		case CATCH_SARDINE://sardine
		{
			CreateItemOnObject(HARVEST_GUTTED_SARDINE, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2));
			break;
		}
		case CATCH_SQUID://CATCH_SQUID
		{
			CreateItemOnObject(HARVEST_TENTACLE, oActivator, Random(8) + 1);
			CreateItemOnObject(HARVEST_INK, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_STINGRAY://stingray
		{
			CreateItemOnObject(HARVEST_STINGRAY_BARB, oActivator, Random(2));
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			break;
		}
		case CATCH_STONEFISH://stonefish
		{
			if(ReflexSave(oActivator,19,SAVING_THROW_TYPE_NONE,oTarget) == 0)
			{
				SendMessageToPC(oActivator, Colorize("You accidentally jab yourself with a spine...",COLOR_RED));
				if(FortitudeSave(oActivator,28,SAVING_THROW_TYPE_POISON,oTarget) == 0)
				{
					PerformEmote(EMOTE_FALL, oActivator);
					effect ePara = EffectCutsceneParalyze();
					effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
					ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oActivator, 12.0f);
					ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePara, oActivator, 12.0f);

					SendMessageToPC(oActivator, Colorize("...You feel a sharp pain and then nothing.",COLOR_RED));
					break;
				}
				else
				{
					SendMessageToPC(oActivator, Colorize("...You resist the poison but the spine is useless now.",COLOR_GREEN));
					break;
				}
			}
			else
			{
				CreateItemOnObject(HARVEST_STONEFISH_SPINE, oActivator, 1);
				break;
			}
		}
		case CATCH_STURGEON://sturgeon
		{
			if(Random(12) + 1 > 7)//slightly skewed gender checker for fish. if female, give some roe
			{
				CreateItemOnObject(HARVEST_DARK_ROE, oActivator, Random(8) + 1);
			}
			CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(4) + 1);
			break;
		}
		case CATCH_TROUT://trout
		{
			CreateItemOnObject(HARVEST_RAINBOW_SCALE, oActivator, Random(4) + 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			break;
		}
		case CATCH_COD://cod
		{
			CreateItemOnObject(HARVEST_COD_LIVER, oActivator, 1);
			CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
			CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			break;
		}
		default:
		{
			if(GetResRef(oTarget) == "nw_it_msmlmisc20")//default fish
			{
				CreateItemOnObject(HARVEST_SMALL_MEAT, oActivator, 1);
				CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(2) + 1);
			}
			else if(GetResRef(oTarget) == "ar_it_lunker001")//scarfinned
			{
				CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(3) + 1);
				CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(2) + 1);
				CreateItemOnObject(HARVEST_MEDIUM_MEAT, oActivator, 1);
			}
			else if(GetResRef(oTarget) == "ar_it_lunker")//lunker
			{
				CreateItemOnObject(HARVEST_LARGE_MEAT, oActivator, 1);
				CreateItemOnObject(HARVEST_FISH_GUTS, oActivator, Random(4) + 2);
				CreateItemOnObject(HARVEST_FISH_BONES, oActivator, Random(4) + 1);
			}
			else//not a fish
			{
				bItemRedux = FALSE;
				SendMessageToPC(oActivator, Colorize("You can't gut that, silly.",COLOR_RED));
			}
			break;
		}
	}

	if(bItemRedux) gsCMReduceItem(oTarget);
}


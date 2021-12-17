#include "inc_fishing"
#include "zdlg_include_i"

void main()
{
	object oItem = GetItemActivated();
	object oActivator = GetItemActivator();
	object oTarget = GetItemActivatedTarget();

	//how much space in the jar
	int iSpaceInJar = 40 - GetTotalBugsInJar(oItem);

	//how much space do we need to store the target stack of bugs
	int iNeededSpace = GetNumStackedItems(oTarget);

	if(oTarget == oActivator)//self target, open dialog
	{
		SetLocalObject(oActivator, "sf_bugjar", oItem);
		SetLocalString(OBJECT_SELF, "BUGVAR_SCRIPT", "zdlg_bugjar");
		AssignCommand(oActivator, StartDlg(oActivator, OBJECT_SELF, "zdlg_bugjar", TRUE, FALSE));
	}
	else if(oTarget == oItem)//not self, attempt to forage for bugs
	{
		if(GetIsAreaNatural(GetArea(oActivator)))//natural area, look for bugs
		{
			// Feedback and Start Timer for Player
			AssignCommand(oActivator, ClearAllActions());
			AssignCommand(oActivator, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0f, 5.0f));
			
			// Prepare Timer, we have to store oItem as its being used in i_sf_gather_bug
			SetLocalString(oActivator, "TIMER_EVENT", "timer_bug_jar");
			SetLocalObject(oActivator, "STORED_ITEM", oItem);
			NWNX_Player_StopGuiTimingBar(oActivator);
      		NWNX_Player_StartGuiTimingBar(oActivator, 5.0f, "i_sf_gather_bug");
		}
		else
		{
			SendMessageToPC(oActivator, Colorize("There aren't many bugs around. Try somewhere more natural.", COLOR_RED));
		}
	}
	else if(IsBug(oTarget))//not self target, attempt to store bug
	{
		if(iSpaceInJar == 0)
		{
			SendMessageToPC(oActivator, Colorize("The jar is already full!", COLOR_RED));
		}
		else
		{
			if(iSpaceInJar > iNeededSpace)
			{
				gsCMReduceItem(oTarget, iNeededSpace);
				AddBugToJar(oItem, oTarget, iNeededSpace);
			}
			else
			{
				gsCMReduceItem(oTarget, iSpaceInJar);
				AddBugToJar(oItem, oTarget, iSpaceInJar);
				SendMessageToPC(oActivator, Colorize("The jar is now full.", COLOR_ORANGE));
			}
		}
	}
	else if(IsRod(oTarget))//used on fishing rod, put bug from jar onto rod
	{
		string sBugResRef = "";
		string sBugjarVar = "";
		int sBugjarBaitCount = 0;

		if(iSpaceInJar == BUG_JAR_CAPACITY)
		{
			SendMessageToPC(oActivator, Colorize("The jar is empty!", COLOR_RED));
		}
		else
		{
			//pick a bug from the jar
			//sequentially move through bug jar types until first non 0 amount is found
			if(GetLocalInt(oItem, VAR_TAG_BEETLE))
			{
				sBugjarBaitCount = GetLocalInt(oItem, VAR_TAG_BEETLE);
				sBugjarVar = VAR_TAG_BEETLE;
				sBugResRef = RESREF_BAIT_BEETLE;
			}
			else if(GetLocalInt(oItem, VAR_TAG_CATERPILLAR))
			{
				sBugjarBaitCount = GetLocalInt(oItem, VAR_TAG_CATERPILLAR);
				sBugjarVar = VAR_TAG_CATERPILLAR;
				sBugResRef = RESREF_BAIT_CATERPILLAR;
			}
			else if(GetLocalInt(oItem, VAR_TAG_GRUB))
			{
				sBugjarBaitCount = GetLocalInt(oItem, VAR_TAG_GRUB);
				sBugjarVar = VAR_TAG_GRUB;
				sBugResRef = RESREF_BAIT_GRUB;
			}
			else if(GetLocalInt(oItem, VAR_TAG_WORM))
			{
				sBugjarBaitCount = GetLocalInt(oItem, VAR_TAG_WORM);
				sBugjarVar = VAR_TAG_WORM;
				sBugResRef = RESREF_BAIT_WORM;
			}
			else if(GetLocalInt(oItem, VAR_TAG_DRAGONFLY))
			{
				sBugjarBaitCount = GetLocalInt(oItem, VAR_TAG_DRAGONFLY);
				sBugjarVar = VAR_TAG_DRAGONFLY;
				sBugResRef = RESREF_BAIT_DRAGONFLY;
			}
			else if(GetLocalInt(oItem, VAR_TAG_SPIDER))
			{
				sBugjarBaitCount = GetLocalInt(oItem, VAR_TAG_SPIDER);
				sBugjarVar = VAR_TAG_SPIDER;
				sBugResRef = RESREF_BAIT_SPIDER;
			}
			else
			{
				SendMessageToPC(oActivator, Colorize("The jar is empty.", COLOR_RED));
				return;
			}
			
			//similar to a function in inc_fishing but needs alternate syntax for this specific case
			//do bait stuff
			if(CheckIfHasHook(oTarget) == HOOK_NONE)
			{
				SendMessageToPC(oActivator, Colorize("You can't attach bait without a hook!", COLOR_RED));
			}
			else
			{
				if(CheckIfHasBait(oTarget) == BAIT_NONE)
				{
					UpdateRodBaitStatus(oTarget, CreateItemOnObject(sBugResRef, oActivator, 1), oActivator);
					SetLocalInt(oTarget,"BCONFRM", FALSE);
					SetLocalInt(oItem, sBugjarVar, sBugjarBaitCount - 1);
				}
				else
				{
					if(!GetLocalInt(oTarget,"BCONFRM"))
					{
						SendMessageToPC(oActivator, Colorize("You've already got a " + GetBaitStatus(oTarget) + " on your hook. Use again to confirm.", COLOR_ORANGE));
						SetLocalInt(oTarget,"BCONFRM", TRUE);
					}
					else
					{
						UpdateRodBaitStatus(oTarget, CreateItemOnObject(sBugResRef, oActivator, 1), oActivator);
						SetLocalInt(oTarget,"BCONFRM", FALSE);
						SetLocalInt(oItem, sBugjarVar, sBugjarBaitCount - 1);
					}
				}
			}
		}
	}
	else
	{
		SendMessageToPC(oActivator, Colorize("Nothing happens.", COLOR_RED));
	}
}
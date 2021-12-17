#include "inc_fishing"

void DoGenBug(object oPC, object oItem, int iLootX, int iJarSpace, vector vPos, int iLuck = FALSE);

void main()
{
	object oActivator = OBJECT_SELF;
	object oItem = GetLocalObject(oActivator, "STORED_ITEM");
	int iSpaceInJar = 40 - GetTotalBugsInJar(oItem);
	int GatherMultiplier = 1;
  	vector vPlayerPosition = GetPosition(oActivator);

  	DeleteLocalObject(oActivator, "STORED_ITEM");

	// get bonuses
	int iClassBonusCheck = GetLevelByClass(CLASS_TYPE_DRUID, oActivator) + GetLevelByClass(CLASS_TYPE_RANGER, oActivator);

	if(iClassBonusCheck > 0)
	{
		GatherMultiplier = GatherMultiplier + 1;
	}

	if(GetHasFeat(FEAT_SECRET_KNOWLEDGE_OF_GATHERING, oActivator))
	{
		GatherMultiplier = GatherMultiplier + 1;
	}

	// generate base number of bugs to find
	int bugFindCount = Random(5) + 1;

	// roll for luck
	int bugFindLuck = d20();

	if(bugFindLuck == 1)
	{
		bugFindLuck = d20();
		if(bugFindLuck == 1)
		{
			SendMessageToPC(oActivator, Colorize("Your attempts at bug hunting have been noticed by something nearby...", COLOR_RED));
			DelayCommand(10.0f,SpawnEnemyForActivity());
		}
		else
		{
			SendMessageToPC(oActivator, Colorize("You don't find any bugs...", COLOR_RED));
		}
	}
	else if(bugFindLuck == 20)
	{
		GatherMultiplier = GatherMultiplier + 1;
		DoGenBug(oActivator, oItem, GatherMultiplier, iSpaceInJar, vPlayerPosition, TRUE);
	}
	else
	{
		DoGenBug(oActivator, oItem, GatherMultiplier, iSpaceInJar, vPlayerPosition);
	}

	DeleteLocalString(oActivator, "TIMER_EVENT");
}

void DoGenBug(object oPC, object oItem, int iLootX, int iJarSpace, vector vPos, int iLuck)
{
	if(vPos == GetPosition(oPC))
	{
		if(iLuck == TRUE)
		{
			string sLucky = Colorize("L", COLOR_RED) + Colorize("u", COLOR_ORANGE) + Colorize("c", COLOR_YELLOW) + Colorize("k", COLOR_LIME_GREEN) + Colorize("y", COLOR_SLATE_BLUE);
			SendMessageToPC(oPC, sLucky);
		}
		GenerateBugs(oItem, iLootX, iJarSpace);
		SendMessageToPC(oPC,Colorize("You now have " + IntToString(GetTotalBugsInJar(oItem)) + " bugs in the jar.", COLOR_GREEN));

		//chance to find some eggs while foraging
		if(d10() > 6)
		{
			SendMessageToPC(oPC, Colorize("While foraging you found a nest of eggs.", COLOR_GREEN));
			CreateItemOnObject(HARVEST_EGG, oPC, d3());
		}
	}
	else
	{
		SendMessageToPC(oPC, Colorize("Collection interrupted!", COLOR_RED));
	}
}
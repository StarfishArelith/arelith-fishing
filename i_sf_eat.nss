#include "inc_fishing"

object oItem = GetItemActivated();
object oActivator = GetItemActivator();

void main()
{
	string sUsedPotion = GetResRef(oItem);
	
	if(sUsedPotion == POT_BIRD)//featherfall potion
	{
		SetLocalInt(oActivator, FEATHER_FALL, TRUE);
		SendMessageToPC(oActivator, Colorize("You feel lighter, the air feels thicker...", COLOR_SLATE_BLUE));
	}
	else if(sUsedPotion == FOOD_SHARK_FIN_SOUP)//sharkfin soup
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_WATER, 10.0f));
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 15.0f));
	}
	else if(sUsedPotion == FOOD_SARDINE_SKEWER)//sardine skewer
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 10.0f));
	}
	else if(sUsedPotion == FOOD_JELLY_EEL)//jellied eel
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 20.0f));
	}
	else if(sUsedPotion == FOOD_SALMON_STEAK)//hearty salmon steak
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 20.0f));
	}
	else if(sUsedPotion == FOOD_FERMENTED_MACKEREL)//fermented mackerel
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 5.0f));
	}
	else if(sUsedPotion == FOOD_SIMPLE_PLATTER)//simple seafood platter
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_WATER, 20.0f));
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 25.0f));
	}
	else if(sUsedPotion == FOOD_FINE_PLATTER)//fine seafood platter
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_WATER, 40.0f));
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 50.0f));
	}
	else if(sUsedPotion == FOOD_LAVISH_PLATTER)//lavish seafood platter
	{
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_WATER, 60.0f));
		AssignCommand(oActivator, gsSTAdjustState(GS_ST_FOOD, 75.0f));
	}

	gsCMReduceItem(oItem);
}
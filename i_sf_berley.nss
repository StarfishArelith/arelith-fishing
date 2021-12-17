#include "inc_fishing"

//##################
//# BERLEY == CHUM #
//##################

void main()
{
	object oItem = GetItemActivated();
	object oActivator = GetItemActivator();
	object oTarget = GetItemActivatedTarget();
	object oArea = GetArea(oActivator);

	if(GetResRef(oTarget) == "ar_pl_fishspot") //is the target a fishing spot?
	{
		UseBerley(oActivator, oItem);
	}
	else if(GetIsObjectValid(oArea) && GetIsShip(oArea)) // Check if Berley is used on a ship's deck
	{
		UseBerley(oActivator, oItem);
	}
	else //PC used berley on something other than a fishing spot
	{
		SendMessageToPC(oActivator, Colorize("You don't think that's a good idea.", COLOR_RED));
	}
}
#include "inc_fishing"

void main()
{
	object oItem = GetItemActivated();
	object oActivator = GetItemActivator();
	object oTarget = GetItemActivatedTarget();

	if(IsRod(oTarget))
   	{
   		if(GetLocalInt(oItem, "BAIT") > HOOK_NONE)
   		{
   			HandleBait(oTarget, oItem, oActivator);
   		}
   		else
   		{
   			HandleHook(oTarget, oItem, oActivator);
   		}
   	}
   	else
   	{
   		SendMessageToPC(oActivator, Colorize("These two things don't go together.", COLOR_RED));
   	}
}
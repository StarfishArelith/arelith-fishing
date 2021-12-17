//Put this script OnUsed
//rewritten by Starfish
#include "inc_fishing"
#include "inc_random"

void main()
{
   object oPC = GetLastUsedBy();

   if (!GetIsPC(oPC)) return;

   StartFishing(oPC);
}


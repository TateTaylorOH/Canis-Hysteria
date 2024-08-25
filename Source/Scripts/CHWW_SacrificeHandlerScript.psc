Scriptname CHWW_SacrificeHandlerScript extends ReferenceAlias  

MiscObject Property WolfHeart Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if ((getOwningQuest() as QF_DES_CureQuest_0603D42C).HeartReturn) && (akBaseItem == WolfHeart)
		Utility.wait(0.1)
		if(getReference().getItemCount(WolfHeart) > 0)
			getOwningQuest().setStage(55)
			(getOwningQuest() as QF_DES_CureQuest_0603D42C).HeartReturn = false
		endIf
	endIf
endEvent

Event OnDying(Actor akKiller)
	;if (getOwningQuest() as QF_DES_CureQuest_0603D42C).SacAttack
		getOwningQuest().setStage(70)
	;	(getOwningQuest() as QF_DES_CureQuest_0603D42C).SacAttack = false
	;endIf
endEvent
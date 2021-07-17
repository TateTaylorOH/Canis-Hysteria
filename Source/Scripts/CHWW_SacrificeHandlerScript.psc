Scriptname CHWW_SacrificeHandlerScript extends ReferenceAlias  

MiscObject Property WolfHeart Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if(getOwningQuest().isStageDone(50) && akBaseItem == WolfHeart)
		Utility.wait(0.1)
		if(getReference().getItemCount(WolfHeart) > 0)
			getOwningQuest().setStage(55)
		endIf
	endIf
endEvent

Event OnDeath(Actor akKiller)
	if(getOwningQuest().isStageDone(60))
		getOwningQuest().setStage(70)
	endIf
endEvent
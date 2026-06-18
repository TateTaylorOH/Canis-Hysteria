Scriptname CHWW_CureQuestPlayerInventoryTracker extends ReferenceAlias  

Actor Property PlayerRef Auto
Ingredient Property Taproot Auto
Ingredient Property CanisRoot Auto
MiscObject Property SacrificeHeart Auto
MiscObject Property WolfHeart Auto
Quest Property CureQuest Auto

state gathering
	Event OnBeginState()
		checkTaproot()
		checkCanisRoot()
	endEvent
	
	Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		if(!CureQuest.isObjectiveCompleted(10) && akBaseItem == Taproot)
			checkTaproot()
		elseif(!CureQuest.isObjectiveCompleted(20) && akBaseItem == CanisRoot)
			checkCanisRoot()
		endIf
	endEvent
	
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		if(CureQuest.isObjectiveCompleted(10) && akBaseItem == Taproot && PlayerRef.getItemCount(Taproot) == 0)
			CureQuest.setObjectiveCompleted(10, false)
			CureQuest.setObjectiveDisplayed(10, true, true)
		elseif(CureQuest.isObjectiveCompleted(20) && akBaseItem == CanisRoot && PlayerRef.getItemCount(CanisRoot) == 0)
			CureQuest.setObjectiveCompleted(20, false)
			CureQuest.setObjectiveDisplayed(20, true, true)
		endIf
	endEvent
endState

state waitingForHeart
	Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		if(akBaseItem == SacrificeHeart)
			CureQuest.setStage(40)
		elseif(akBaseItem == WolfHeart)
			CureQuest.setStage(50)
			goToState("done")
		endIf
	endEvent
endState

function checkTaproot()
	if(PlayerRef.getItemCount(Taproot) > 0)
		CureQuest.SetObjectiveCompleted(10)
		if(CureQuest.isObjectiveCompleted(20))
			CureQuest.setStage(30)
			goToState("waitingForHeart")
		endIf
	endIf
endFunction

function checkCanisRoot()
	if(PlayerRef.getItemCount(CanisRoot) > 0)
		CureQuest.SetObjectiveCompleted(20)
		if(CureQuest.isObjectiveCompleted(10))
			CureQuest.setStage(30)
			goToState("waitingForHeart")
		endIf
	endIf
endFunction
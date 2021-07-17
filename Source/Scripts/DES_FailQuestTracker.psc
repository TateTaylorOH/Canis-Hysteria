Scriptname DES_FailQuestTracker extends ReferenceAlias

Quest Property CureQuest auto

EVENT OnActivate(ObjectReference akActionRef)
	CureQuest.SetStage(255)
ENDEVENT
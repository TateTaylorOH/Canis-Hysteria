Scriptname DES_CureQuestNoteSetStage extends ObjectReference  

Quest Property CureQuest auto
Quest Property PointerQuest auto

Event OnRead()
	PointerQuest.SetStage(15)
	CureQuest.SetStage(10)
EndEvent



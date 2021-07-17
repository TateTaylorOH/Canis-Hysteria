Scriptname DES_CureQuestNoteSetStage extends ObjectReference  

Quest Property CureQuest auto
Quest Property PointerQuest auto

Event OnRead()
	if(PointerQuest.isRunning())
		PointerQuest.SetStage(15)
		CureQuest.start()
	endIf
EndEvent



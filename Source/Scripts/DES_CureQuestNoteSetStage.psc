Scriptname DES_CureQuestNoteSetStage extends ObjectReference  

Spell Property WerewolfChange auto
Quest Property CureQuest auto
Quest Property PointerQuest auto
Actor Property PlayerRef auto

CompanionsHousekeepingScript Property C00 Auto

Event OnRead()
	IF PlayerRef.HasSpell(WerewolfChange) && !C00.PlayerHasBeastBlood
		PointerQuest.SetStage(15)
		CureQuest.start()
	ENDIF
EndEvent



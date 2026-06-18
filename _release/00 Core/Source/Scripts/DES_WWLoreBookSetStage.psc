Scriptname DES_WWLoreBookSetStage extends ObjectReference  

Quest Property PointerQuest auto
Actor Property PlayerRef auto
Spell Property Werewolf auto
CompanionsHousekeepingScript Property C00 Auto

Event OnRead()
	IF PlayerRef.HasSpell(Werewolf)
		IF !C00.PlayerHasBeastblood
			PointerQuest.SetStage(10)
		ENDIF
	ENDIF
EndEvent




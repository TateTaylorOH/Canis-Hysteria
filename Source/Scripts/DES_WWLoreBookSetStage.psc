Scriptname DES_WWLoreBookSetStage extends ObjectReference  

Quest Property PointerQuest auto
Actor Property PlayerRef auto
Spell Property Werewolf auto
Faction Property Companions auto

Event OnRead()
	IF PlayerRef.HasSpell(Werewolf)
		IF !PlayerRef.IsInFaction(Companions)
			PointerQuest.SetStage(10)
		ENDIF
	ENDIF
EndEvent




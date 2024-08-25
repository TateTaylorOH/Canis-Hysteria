Scriptname DES_FailQuestTracker extends activemagiceffect

Quest Property DES_CureQuest auto
Quest Property DES_CurePointerQuest Auto
Actor Property PlayerRef auto
Spell Property VampireVampirism auto
Spell Property WerewolfChange auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	IF DES_CurePointerQuest.IsRunning()
		DES_CurePointerQuest.setObjectiveFailed(10)
	ENDIF
	IF DES_CureQuest.IsRunning()
		IF PlayerRef.HasSpell(VampireVampirism)
			DES_CureQuest.SetStage(254)
		ENDIF
		IF PlayerRef.HasSpell(WerewolfChange)
			DES_CureQuest.SetStage(255)
		ENDIF
	ENDIF
ENDEVENT

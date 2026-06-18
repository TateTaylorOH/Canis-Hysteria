Scriptname DA05HircinesRingScript extends ObjectReference  

Spell Property HircinesRingPower auto
Spell Property WerewolfChange auto
Actor Property PlayerRef Auto

Event OnEquipped(Actor akActor)
	if PlayerRef.HasSpell(WerewolfChange)
		PlayerRef.AddSpell(HircinesRingPower, false)
	endif
EndEvent

Event OnUnEquipped(Actor akActor)
	if PlayerRef.HasSpell(WerewolfChange)
		PlayerRef.RemoveSpell(HircinesRingPower)
	endif
EndEvent



Scriptname DES_HarkonWerewolfCure extends activemagiceffect  

CompanionsHousekeepingScript Property C00 auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	;debug.messagebox("Player is a vampire werewolf!")
	C00.CurePlayer()
ENDEVENT
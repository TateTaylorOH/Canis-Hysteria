Scriptname CHWW_PlayerMonitorScript extends Quest  

bool property curedBefore auto
Quest Property DES_CureQuest Auto
Location Property AltarOfThrond Auto
CompanionsHousekeepingScript Property C00 Auto

Actor Property PlayerRef Auto

Race Property WereRace Auto
Race Property WerewolfBeastRace Auto
;werewolf properties
SPELL Property WerewolfChange Auto
SPELL Property WerewolfChangeFX Auto
SPELL Property WerewolfChangeRingOfHircine Auto
SPELL Property WerewolfImmunity Auto
;wrapper properties
Spell Property BeastForm
	Spell function get()
		if(WereRace == WerewolfBeastRace)
			return WerewolfChange
		endIf
		return None
	endFunction
endProperty
Spell Property Transform
	Spell function get()
		if(WereRace == WerewolfBeastRace)
			return WerewolfChangeFX
		endIf
		return None
	endFunction
endProperty

function handleLocationChange(Location oldLoc, Location newLoc)
	if(newLoc.isSameLocation(AltarOfThrond) && PlayerRef.hasSpell(BeastForm) &&\
		!C00.PlayerHasBeastBlood && !DES_CureQuest.isRunning() && curedBefore);if you're a werewolf at the altar of thrond, not through companions, and have done this before
		DES_CureQuest.start(); just start the cure quest without extra theatrics
	endIf
endFunction
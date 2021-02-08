Scriptname BeastbloodDiseaseEffectScript extends ActiveMagicEffect  

Float Property WerewolfChangeTimer Auto
Float Property Hour_Moonrise = 21.0 Auto
Float Property Hour_Moonset = 5.0 Auto
Actor Property PlayerRef Auto
GlobalVariable Property Gamehour Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property PlayerIsWerewolf Auto
Message Property WerewolfMoonriseMessage Auto
Message Property WerewolfMoonsetMessage Auto
CompanionsHousekeepingScript Property CompanionsTrackingQuest Auto
Spell Property WerewolfImmunity auto
Spell Property WerewolfCureDisease auto
Quest Property PlayerWerewolfCureQuest auto
Spell Property WerewolfChange auto

Race[] Property VampireRaces Auto
Race[] Property NonVampireRaces Auto
Quest Property PlayerVampireQuest auto
Keyword Property Vampire auto
Spell Property DiseaseSanguinareVampiris Auto

Event OnEffectStart(Actor Target, Actor Caster)
	;Player has three days before they become a Werewolf	
	If Target == PlayerRef
		RegisterForUpdateGameTime(1)
		WerewolfChangeTimer = GameDaysPassed.Value + 3
	EndIf
EndEvent

Event OnUpdateGameTime()
	If GameHour.GetValueInt() == 5
		WerewolfMoonsetMessage.Show()
	EndIf
	If GameHour.GetValueInt() == 19
		WerewolfMoonriseMessage.Show()
	EndIf
	If GameDaysPassed.Value >= WerewolfChangeTimer
		UnRegisterForUpdateGameTime()
		RegisterForSingleUpdate(10)
	EndIf
EndEvent

Event OnUpdate()
	;Make sure the player is out of combat, then trigger change
	If PlayerRef.GetCombatState() == 0 && Game.IsMovementControlsEnabled() && Game.IsFightingControlsEnabled()
		;trigger initial change
		transform()
	Else
		RegisterForSingleUpdate(10)
	EndIf
EndEvent

;mostly copied from CW03 Rampage
function transform()
	if (PlayerRef.HasKeyword(Vampire))
		(PlayerVampireQuest as PlayerVampireQuestScript).VampireCure(PlayerRef)
	endif
	PlayerRef.RemoveSpell(DiseaseSanguinareVampiris) ;USKP 2.0.5 - This needs to be removed as well.
    WerewolfCureDisease.Cast(PlayerRef)
    PlayerRef.AddSpell(WerewolfImmunity, false)
	PlayerWerewolfCureQuest.Start()
	Race origRace = PlayerRef.GetRace()
	int index = VampireRaces.find(origRace)
	if(index > 0)
		origRace = NonVampireRaces[index]
	endIf
	CompanionsTrackingQuest.PlayerOriginalRace = PlayerRef.GetRace()
	;major diff is here, since WerewolfChange no longer bails out early unless you are in C03
	PlayerIsWerewolf.setValue(1.0)
	PlayerRef.AddSpell(WerewolfChange)
    WerewolfChange.Cast(PlayerRef)
endFunction

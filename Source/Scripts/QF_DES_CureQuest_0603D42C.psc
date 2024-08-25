;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_DES_CureQuest_0603D42C Extends Quest Hidden

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cauldron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cauldron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sacrifice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sacrifice Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
setObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)
(Alias_PlayerAlias as CHWW_CureQuestPlayerInventoryTracker).goToState("gathering")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)
HeartReturn = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Actor PlayerRef = Alias_PlayerAlias.getReference() as Actor
PlayerRef.removeSpell(CHWW_Monitor.WerewolfImmunity)
CompleteAllObjectives()
IF !CHWW_Monitor.curedBefore
   CHWW_Monitor.curedBefore = true
ENDIF
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
setObjectiveCompleted(30)
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
setObjectiveDisplayed(30)
Alias_Sacrifice.getActorReference().reset()
Alias_Sacrifice.getActorReference().addItem(SacrificeHeart)
;IF Alias_Sacrifice.getActorReference().GetRace() == WerewolfRace
;   Alias_Sacrifice.getActorReference().Resurrect()
;   Alias_Sacrifice.getActorReference().SetRace()
;   Utility.Wait(1)
;   Alias_Sacrifice.getActorReference().Kill()
;ENDIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
setObjectiveCompleted(50)
;begin resurrection
Actor sacrifice = Alias_Sacrifice.getReference() as Actor
Actor PlayerRef = Alias_PlayerAlias.getReference() as Actor
sacrifice.RemoveAllItems()
;cure lycanthropy
PlayerRef.removeSpell(CHWW_Monitor.BeastForm)
PlayerRef.removeSpell(CHWW_Monitor.WerewolfChangeRingOfHircine)
PlayerRef.sendLycanthropyStateChanged(false)
if (PlayerWerewolfQuest.IsRunning() && PlayerWerewolfQuest.GetStage() < 100)
PlayerWerewolfQuest.SetStage(100)
endif
;copied from soul trap
SoulTrapPVFX01.Play(PlayerRef, 4.7, sacrifice)
SoulTrapPVFX02.Play(sacrifice, 5.9, PlayerRef)
SoulTrapTargetActFXS.Play(PlayerRef, 2)
SoulTrapCastActFXS.Play(sacrifice, 3)

reanimateSelf.cast(sacrifice)
utility.wait(6.0)
CHWW_Monitor.Transform.cast(sacrifice)
SacAttack = true
setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CHWW_PlayerMonitorScript Property CHWW_Monitor Auto
MiscObject Property SacrificeHeart Auto
Quest Property PlayerWerewolfQuest Auto
SPELL Property reanimateSelf Auto
EffectShader Property SoulTrapCastActFXS Auto
VisualEffect Property SoulTrapPVFX02 Auto
EffectShader Property SoulTrapTargetActFXS Auto
VisualEffect Property SoulTrapPVFX01 Auto
Race Property WerewolfRace  Auto  
bool property SacAttack auto conditional
bool property HeartReturn auto conditional

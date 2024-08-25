;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000AEBFA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if PlayerRef.HasSpell(Werewolf)
       DES_IKnowWhatWerewolvesAre.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DES_IKnowWhatWerewolvesAre Auto
Actor Property PlayerRef Auto
Spell Property Werewolf Auto  

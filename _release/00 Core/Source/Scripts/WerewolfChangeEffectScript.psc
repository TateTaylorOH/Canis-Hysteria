Scriptname WerewolfChangeEffectScript extends ActiveMagicEffect  
{Scripted effect for the werewolf change}



;======================================================================================;
;               PROPERTIES  /
;=============/

Quest Property PlayerWerewolfQuest auto
Quest Property C00 auto
Quest Property C03 auto

Spell Property VFXSpell auto


;======================================================================================;
;               EVENTS                     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
; 	Debug.Trace("WEREWOLF: Casting transformation spell on " + Target)

	; set up tracking
	if (Target == Game.GetPlayer())
; 		Debug.Trace("WEREWOLF: Target is player.")
		; if this is the first time, don't actually do anything (transform handled in rampage script)
		if ( C03.isRunning() && (C00 as CompanionsHousekeepingScript).PlayerIsWerewolfVirgin ); check for quest that uses this so that we can have other first transformations, idk why ya boi max didn't do this
; 			Debug.Trace("WEREWOLF: Player's first time; bailing out.")
			(C00 as CompanionsHousekeepingScript).PlayerIsWerewolfVirgin = false
			Game.SetBeastForm(False)
			return
		endif

; 		Debug.Trace("WEREWOLF: Starting player tracking.")

		PlayerWerewolfQuest.Start()
	endif

	VFXSpell.Cast(Target)
EndEvent


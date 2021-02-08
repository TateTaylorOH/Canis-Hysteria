Scriptname CHWW_PlayerGetsHit extends ReferenceAlias  

Race Property Werewolf Auto
Race Property Werebear Auto
Spell Property disCanisHysteria Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor a = akAggressor as Actor
	if(a)
		Race r = a.getRace()
		if(r == Werewolf || r == Werebear)
			a.doCombatSpellApply(disCanisHysteria, getReference())
		endIf
	endIf
endEvent
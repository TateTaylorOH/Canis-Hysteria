Scriptname DES_FailPointerQuest  extends ReferenceAlias

Race Property Werewolf  Auto
CompanionsHousekeepingScript Property C00 Auto
Quest Property PointerQuest Auto
Actor Property PlayerAlias Auto

EVENT OnRaceSwitchComplete()
    IF PlayerAlias.GetRace() == Werewolf
        IF !C00.PlayerHasBeastblood 
            PointerQuest.setObjectiveFailed(10)
        elseif PointerQuest.isObjectiveFailed(10)
            PointerQuest.setObjectiveFailed(10, false)
            PointerQuest.setObjectiveDisplayed(10, true, true)
        ENDIF
    ENDIF
ENDEVENT
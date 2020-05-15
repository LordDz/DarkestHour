//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================
class DHSpawnPoint_Objective extends DHSpawnPoint;

var DHObjective Objective;

function Timer()
{
    if (GRI != none && GRI.bIsInSetupPhase)
    {
        BlockReason = SPBR_Waiting;
        return;
    }

    BlockReason = SPBR_None;
}

defaultproperties
{
    SpawnPointStyle="DHObjectiveSpawnButtonStyle"
    Type=ESPT_Infantry
    bStatic=false
    bCollideWhenPlacing=false
    bHidden=true
    BaseSpawnTimePenalty=15
}

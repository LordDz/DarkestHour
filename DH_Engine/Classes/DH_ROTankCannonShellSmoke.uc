//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_ROTankCannonShellSmoke extends DH_ROTankCannonShellHE;

var  class<Emitter> SmokeEmitterClass;
var  sound          SmokeIgniteSound;
var  sound          SmokeLoopSound;
var  float          SmokeSoundDuration;

// Matt: removed as unnecessary:
// var()  float      DestroyTimer;
// var    bool       bCalledDestroy;
// var    Emitter    SmokeEmitter;

// Modified to add smoke effects
simulated function Explode(vector HitLocation, vector HitNormal)
{
    if (!bCollided)
    {
        super.Explode(HitLocation, HitNormal);

        if (Level.NetMode != NM_DedicatedServer)
        {
            Spawn(SmokeEmitterClass, self, , HitLocation, rotator(-HitNormal));
            PlaySound(SmokeIgniteSound, SLOT_NONE, 1.5, , 200.0);
            AmbientSound = SmokeLoopSound;
            AmbientVolumeScale = 1.0; // overriding defaults for shells, which are intended for their in-flight 'whistle' - this (& radius) match smoke grenade sounds
            SoundRadius = 200.0;
        }
    }
}

// Matt: modified so actor is torn off & then destroyed on server, but persists for its LifeSpan on clients to play the smoke sound
simulated function HandleDestruction()
{
    bCollided = true;

    bTearOff = true; // stops any further replication, but client copies of actor persist to play the smoke sound

    if (Level.NetMode == NM_DedicatedServer)
    {
        LifeSpan = 1.0; // on a server this actor will be destroyed in 1 second, allowing time for bTearOff to replicate to clients
    }
    else
    {
        LifeSpan = SmokeSoundDuration; // this actor will persist as long as the smoke sound
    }

    SetCollision(false, false);
    bCollideWorld = false;
}

/*
// Matt: removed these functions as this stuff isn't necessary & didn't work to prevent the SmokeEmitter from persisting on clients if the game was reset
// Destruction of SmokeEmitter now handled by emitter's Reset, called as standard in single player & by new DH_ClientResetGame actor on net clients
simulated function KillSmoke()
{
    if (SmokeEmitter != none)
    {
        SmokeEmitter.Kill();
    }
}

function Reset()
{
    if (SmokeEmitter != none)
    {
        SmokeEmitter.Destroyed();
    }

    super.Reset();
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);

    DestroyTimer -= DeltaTime;

    if (DestroyTimer <= 0.0 && !bCalledDestroy)
    {
        bCalledDestroy = true;
        KillSmoke();
    }
}
*/

defaultproperties
{
    RoundType=RT_Smoke
    bAlwaysRelevant=true // has to be always relevant so that the smoke effect always gets spawned
    SmokeEmitterClass=class'DH_Effects.DH_SmokeShellEffect'
    SmokeIgniteSound=sound'Inf_WeaponsTwo.smokegrenade.smoke_ignite'
    SmokeLoopSound=sound'Inf_WeaponsTwo.smokegrenade.smoke_loop'
    SmokeSoundDuration=33.0
    ImpactDamage=20
    BallisticCoefficient=0.6
    SpeedFudgeScale=0.75
    MaxSpeed=500.0
    Damage=75.0
    DamageRadius=50.0
    LifeSpan=12.0
    AmbientGlow=50
//  SoundVolume=175 // Matt: removed as affects shell's flight 'whistle' & smoke sounds (i.e. AmbientSound), not the explosion sound volume (same with radius below)
//  SoundRadius=500.0
//  TransientSoundVolume=0.75 // Matt: removed as sound effects are the same as for other shells, except the explosion volume that we now control with ExplosionSoundVolume
//  TransientSoundRadius=750.0
    ExplosionSoundVolume=0.75
}

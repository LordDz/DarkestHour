//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2014
//==============================================================================

class DH_GreyhoundCannonShellDamageHE extends ROTankShellExplosionDamage
      abstract;

defaultproperties
{
    TankDamageModifier=0.000000
    APCDamageModifier=0.500000
    VehicleDamageModifier=1.000000
    TreadDamageModifier=0.500000
    DeathString="%o was ripped by shrapnel from %k's Greyhound HE shell."
    bArmorStops=true
    KDamageImpulse=3000.000000
    VehicleMomentumScaling=1.100000
    HumanObliterationThreshhold=180
}

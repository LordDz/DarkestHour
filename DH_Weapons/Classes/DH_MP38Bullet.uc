//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2021
//==============================================================================

class DH_MP38Bullet extends DHBullet;

defaultproperties
{
    Speed=22934.0 // differs from RO but that had incorrect conversion to UU
    BallisticCoefficient=0.16
    WhizType=2
    Damage=56.0
    MyDamageType=class'DH_Weapons.DH_MP38DamType'
}

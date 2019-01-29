//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2018
//==============================================================================

class DH_ColtM1911Fire extends DHPistolFire;

defaultproperties
{
    ProjectileClass=class'DH_Weapons.DH_ColtM1911Bullet'
    AmmoClass=class'DH_Weapons.DH_ColtM1911Ammo'
    Spread=330.0
    FireSounds(0)=SoundGroup'DH_WeaponSounds.Colt45.Colt45_Fire01'

    ShellEjectClass=class'ROAmmo.ShellEject1st9x19mm'
    ShellHipOffset=(X=0.0,Y=0.0,Z=0.0)

    FireLastAnim="Shoot_Empty"
    FireIronLastAnim="iron_shoot_empty"
}

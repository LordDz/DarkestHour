//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2021
//==============================================================================

class DH_RPG43GrenadeWeapon extends DHExplosiveWeapon;

defaultproperties
{
    ItemName="RPG43 Anti-Tank Grenade"
    FireModeClass(0)=class'DH_Weapons.DH_RPG43GrenadeFire'
    FireModeClass(1)=class'DH_Weapons.DH_RPG43GrenadeFire' // no toss fire because it would be utterly useless
    AttachmentClass=class'DH_Weapons.DH_RPG43GrenadeAttachment'
    PickupClass=class'DH_Weapons.DH_RPG43GrenadePickup'
    Mesh=SkeletalMesh'DH_RPG43Grenade_1st.RPG43Grenade'
    Skins(2)=Texture'DH_RPG43Grenade_1st.RPG_text' // TODO: there is no specularity mask for this weapon

    GroupOffset=4
    DisplayFOV=80.0
}

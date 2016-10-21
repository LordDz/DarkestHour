//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2016
//==============================================================================

class DH_StenMkIIWeapon extends DHAutoWeapon;

#exec OBJ LOAD FILE=..\Animations\DH_Sten_1st.ukx

defaultproperties
{
    ItemName="Sten MkII"
    FireModeClass(0)=class'DH_Weapons.DH_StenMkIIFire'
    FireModeClass(1)=class'DH_Weapons.DH_StenMkIIMeleeFire'
    AttachmentClass=class'DH_Weapons.DH_StenMkIIAttachment'
    PickupClass=class'DH_Weapons.DH_StenMkIIPickup'

    Mesh=SkeletalMesh'DH_Sten_1st.StenMkII'
    bUseHighDetailOverlayIndex=true
    HighDetailOverlayIndex=2

    PlayerIronsightFOV=65.0
    IronSightDisplayFOV=30.0

    MaxNumPrimaryMags=7
    InitialNumPrimaryMags=7

    bHasSelectFire=true
    SelectFireAnim="switch_fire"
    SelectFireIronAnim="Iron_switch_fire"
    PutDownAnim="putaway"
}

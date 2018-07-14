//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2018
//==============================================================================

class DH_SVT40Weapon extends DHSemiAutoWeapon;

#exec OBJ LOAD FILE=..\Animations\Allies_Svt40_1st.ukx

defaultproperties
{
    ItemName="SVT-40"
    FireModeClass(0)=class'DH_Weapons.DH_SVT40Fire'
    FireModeClass(1)=class'DH_Weapons.DH_SVT40MeleeFire'
    AttachmentClass=class'DH_Weapons.DH_SVT40Attachment'
    PickupClass=class'DH_Weapons.DH_SVT40Pickup'

    Mesh=SkeletalMesh'Allies_Svt40_1st.svt40_mesh'
    HighDetailOverlay=shader'Weapons1st_tex.Rifles.SVT40_S'
    bUseHighDetailOverlayIndex=true
    HighDetailOverlayIndex=2

    IronSightDisplayFOV=25.0

    MaxNumPrimaryMags=9
    InitialNumPrimaryMags=6

    bHasBayonet=true
    BayonetBoneName="bayonet"
    BayoAttachAnim="Bayonet_on"
    BayoDetachAnim="Bayonet_off"
}

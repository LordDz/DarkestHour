//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2019
//==============================================================================

class DH_ShermanCannon_M4A3E8_Fury extends DH_ShermanCannonA_76mm;

// TODO: remove weird overrides for shit

defaultproperties
{
    Mesh=SkeletalMesh'DH_ShermanM4A3E8_anm.turret_ext'
    Skins(0)=Texture'DH_ShermanM4A3E8_tex.turret_ext'

    WeaponFireAttachmentBone="muzzle"

    // Coaxial MG
    AltFireAttachmentBone="coax"
    AltFireOffset=(X=-8,Y=0,Z=0)
    AltFireSpawnOffsetX=0.0
}


//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_Flak38Gun extends DHATGun;

#exec OBJ LOAD FILE=..\StaticMeshes\DH_Artillery_stc.usx
#exec OBJ LOAD FILE=..\Animations\DH_Flak38_anm.ukx
#exec OBJ LOAD FILE=..\Textures\DH_Artillery_tex.utx

defaultproperties
{
    VehicleHudTurret=TexRotator'DH_Artillery_tex.ATGun_Hud.flak38_turret_rot'
    VehicleHudTurretLook=TexRotator'DH_Artillery_tex.ATGun_Hud.flak38_turret_look'
    PassengerWeapons(0)=(WeaponPawnClass=class'DH_Guns.DH_Flak38CannonPawn',WeaponBone="turret_placement")
    DestroyedVehicleMesh=StaticMesh'DH_Artillery_stc.Flak38.Flak38_static_dest'
    DestructionEffectClass=class'AHZ_ROVehicles.ATCannonDestroyedEmitter'
    DisintegrationEffectClass=class'AHZ_ROVehicles.ATCannonDestroyedEmitter'
    DamagedEffectClass=none
    DamagedEffectHealthSmokeFactor=0.0
    DamagedEffectHealthMediumSmokeFactor=0.0
    DamagedEffectHealthHeavySmokeFactor=0.0
    VehicleHudImage=texture'DH_Artillery_tex.ATGun_Hud.flak38_body_static'
    VehicleHudOccupantsX(0)=0.0
    VehicleHudOccupantsX(1)=0.0
    ExitPositions(1)=(X=-30.0,Y=70.0,Z=50.0)
    VehicleNameString="2cm FlaK 38 gun"
    Mesh=SkeletalMesh'DH_Flak38_anm.Flak38_base_static'
    Skins(0)=texture'DH_Artillery_tex.Flak38.Flak38_gun'
}

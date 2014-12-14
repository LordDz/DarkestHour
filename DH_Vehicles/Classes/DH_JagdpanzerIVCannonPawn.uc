//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2014
//==============================================================================

class DH_JagdpanzerIVCannonPawn extends DH_AssaultGunCannonPawn
    abstract;

defaultproperties
{
    PeriscopeOverlay=Texture'DH_VehicleOptics_tex.German.PERISCOPE_overlay_German'
    OverlayCenterSize=0.555000
    PeriscopePositionIndex=1
    DestroyedScopeOverlay=Texture'DH_VehicleOpticsDestroyed_tex.German.stug3_SflZF1a_destroyed'
    bManualTraverseOnly=true
    PoweredRotateSound=Sound'Vehicle_Weapons.Turret.manual_gun_traverse'
    PoweredPitchSound=Sound'Vehicle_Weapons.Turret.manual_turret_elevate'
    PoweredRotateAndPitchSound=Sound'Vehicle_Weapons.Turret.manual_gun_traverse'
    CannonScopeOverlay=Texture'DH_VehicleOptics_tex.German.stug3_SflZF1a_sight'
    WeaponFov=14.400000
    bHasAltFire=false
    CameraBone="Turret"
    MinRotateThreshold=0.500000
    MaxRotateThreshold=3.000000
    bPCRelativeFPRotation=true
    bFPNoZFromCameraPitch=true
    DrivePos=(X=5.000000,Z=-30.000000)
    DriveAnim="VStug3_com_idle_close"
    EntryRadius=130.000000
    FPCamPos=(Z=5.000000)
    TPCamDistance=300.000000
    TPCamLookat=(X=-25.000000,Z=0.000000)
    TPCamWorldOffset=(Z=120.000000)
    PitchUpLimit=6000
    PitchDownLimit=64000
    SoundVolume=130
}

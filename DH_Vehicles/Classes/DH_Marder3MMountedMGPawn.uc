//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_Marder3MMountedMGPawn extends DHVehicleMGPawn;

defaultproperties
{
    UnbuttonedPositionIndex=0
    FirstPersonGunShakeScale=2.0
    WeaponFOV=60.0
    DriverPositions(0)=(ViewFOV=60.0,PositionMesh=SkeletalMesh'DH_Marder3M_anm.Marder_M34_int',TransitionUpAnim="loader_open",DriverTransitionAnim="Vhalftrack_com_close",ViewPitchUpLimit=6000,ViewPitchDownLimit=63500,ViewPositiveYawLimit=5500,ViewNegativeYawLimit=-5500,bDrawOverlays=true,bExposed=true)
    DriverPositions(1)=(ViewFOV=60.0,PositionMesh=SkeletalMesh'DH_Marder3M_anm.Marder_M34_int',TransitionDownAnim="loader_close",DriverTransitionAnim="Vhalftrack_com_open",ViewPitchUpLimit=6000,ViewPitchDownLimit=63500,ViewPositiveYawLimit=5500,ViewNegativeYawLimit=-5500,bDrawOverlays=true,bExposed=true)
    bMultiPosition=true
    GunClass=class'DH_Vehicles.DH_Marder3MMountedMG'
    bHasAltFire=false
    CameraBone="loader_cam"
    FirstPersonGunRefBone="firstperson_wep"
    FirstPersonOffsetZScale=1.0
    bHideMuzzleFlashAboveSights=true
    DrivePos=(X=7.0,Z=-22.0)
    DriveRot=(Yaw=16384)
    DriveAnim="VHalftrack_com_idle"
    EntryRadius=130.0
    HUDOverlayClass=class'DH_Vehicles.DH_VehHUDOverlay_MG34'
    HUDOverlayFOV=45.0
    PitchUpLimit=6000
    PitchDownLimit=63500
}

//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_StuH42MountedMGPawn extends DH_ROMountedTankMGPawn;

#exec OBJ LOAD FILE=..\Textures\DH_VehicleOptics_tex.utx

// Can't fire unless buttoned up & controlling the remote MG
function bool CanFire()
{
    return DriverPositionIndex < UnbuttonedPositionIndex && !IsInState('ViewTransition');
}

// Modified so if player buttons up & is now on the gun, rotation is set to match the direction MG is facing (after looking around while unbuttoned)
simulated state ViewTransition
{
    simulated function EndState()
    {
        super.EndState();

        if (DriverPositionIndex < UnbuttonedPositionIndex)
        {
            MatchRotationToGunAim();
        }
    }
}

// Modified so that unbuttoned player can look around, similar to a cannon pawn
simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out vector CameraLocation, out rotator CameraRotation)
{
    local vector  x, y, z;
    local vector  VehicleZ, CamViewOffsetWorld;
    local float   CamViewOffsetZAmount;
    local coords  CamBoneCoords;
    local rotator WeaponAimRot;
    local quat    AQuat, BQuat, CQuat;

    GetAxes(CameraRotation, x, y, z);
    ViewActor = self;

    WeaponAimRot = Gun.GetBoneRotation(CameraBone);

    if (ROPlayer(Controller) != none)
    {
        ROPlayer(Controller).WeaponBufferRotation.Yaw = WeaponAimRot.Yaw;
        ROPlayer(Controller).WeaponBufferRotation.Pitch = WeaponAimRot.Pitch;
    }

    // Use gun camera bone rotation if buttoned up & controlling the remote MG
    if (CanFire())
    {
        CameraRotation =  WeaponAimRot;
    }
    // Or if buttoned up we'll use this 'free look around' code instead (inside the loader's internal 'box')
    else if (bPCRelativeFPRotation)
    {
        // First, rotate the headbob by the PlayerController's rotation (looking around)
        AQuat = QuatFromRotator(PC.Rotation);
        BQuat = QuatFromRotator(HeadRotationOffset - ShiftHalf);
        CQuat = QuatProduct(AQuat, BQuat);

        // Then, rotate that by the vehicle's rotation to get the final rotation
        AQuat = QuatFromRotator(VehicleBase.Rotation);
        BQuat = QuatProduct(CQuat, AQuat);

        // Finally make it back into a rotator
        CameraRotation = QuatToRotator(BQuat);
    }
    else
    {
        CameraRotation = PC.Rotation;
    }

    CamViewOffsetWorld = FPCamViewOffset >> CameraRotation;

    if (CameraBone != '' && Gun != none)
    {
        CamBoneCoords = Gun.GetBoneCoords(CameraBone);

        // Use gun camera bone location if buttoned up & controlling the remote MG
        if (CanFire())
        {
            CameraLocation = CamBoneCoords.Origin + (FPCamPos >> WeaponAimRot) + CamViewOffsetWorld;
        }
        // Or if unbuttoned (or unbuttoning) we'll use loader's camera bone location
        else
        {
            CameraLocation = Gun.GetBoneCoords('loader_cam').Origin;
        }

        if (bFPNoZFromCameraPitch)
        {
            VehicleZ = vect(0.0, 0.0, 1.0) >> WeaponAimRot;
            CamViewOffsetZAmount = CamViewOffsetWorld dot VehicleZ;
            CameraLocation -= CamViewOffsetZAmount * VehicleZ;
        }
    }
    else
    {
        CameraLocation = GetCameraLocationStart() + (FPCamPos >> Rotation) + CamViewOffsetWorld;

        if (bFPNoZFromCameraPitch)
        {
            VehicleZ = vect(0.0, 0.0, 1.0) >> Rotation;
            CamViewOffsetZAmount = CamViewOffsetWorld dot VehicleZ;
            CameraLocation -= CamViewOffsetZAmount * VehicleZ;
        }
    }

    CameraRotation = Normalize(CameraRotation + PC.ShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * x + PC.ShakeOffset.Y * y + PC.ShakeOffset.Z * z;
}

defaultproperties
{
    OverlayCenterSize=0.7
    MGOverlay=texture'DH_VehicleOptics_tex.German.KZF2_MGSight'
    FirstPersonGunShakeScale=0.85
    WeaponFOV=41.0
    DriverPositions(0)=(ViewFOV=41.0,PositionMesh=SkeletalMesh'DH_Stug3G_anm.StuH_mg_remote',TransitionUpAnim="com_open",DriverTransitionAnim="VPanzer3_com_close",ViewPitchUpLimit=4500,ViewPitchDownLimit=64500,ViewPositiveYawLimit=19000,ViewNegativeYawLimit=-20000,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=90.0,PositionMesh=SkeletalMesh'DH_Stug3G_anm.StuH_mg_remote',TransitionDownAnim="com_close",DriverTransitionAnim="VPanzer3_com_open",ViewPitchUpLimit=4500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=5500,ViewNegativeYawLimit=-5500,bExposed=true)
    bMultiPosition=true
    GunClass=class'DH_Vehicles.DH_StuH42MountedMG'
    bCustomAiming=true
    bHasAltFire=false
    CameraBone="Gun"
    bPCRelativeFPRotation=true
    bDesiredBehindView=false
    DrivePos=(Z=-9.0)
    DriveAnim="VPanzer3_com_idle_close"
    EntryRadius=130.0
    FPCamPos=(X=4.0,Z=-1.5)
    TPCamDistance=300.0
    TPCamLookat=(X=-50.0,Y=25.0,Z=0.0)
    TPCamWorldOffset=(Z=120.0)
    PitchUpLimit=6000
    PitchDownLimit=63500
}

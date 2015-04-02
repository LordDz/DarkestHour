//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_JagdpantherCannon extends DHTankCannon;

defaultproperties
{
    SecondarySpread=0.00135
    ManualRotationsPerSecond=0.02
    bHasTurret=false
    GunMantletArmorFactor=10.0
    GunMantletSlope=35.0
    ReloadSoundOne=sound'DH_Vehicle_Reloads.Reloads.reload_02s_01'
    ReloadSoundTwo=sound'DH_Vehicle_Reloads.Reloads.reload_02s_02'
    ReloadSoundThree=sound'DH_Vehicle_Reloads.Reloads.reload_02s_03'
    ReloadSoundFour=sound'DH_Vehicle_Reloads.Reloads.reload_02s_04'
    CannonFireSound(0)=SoundGroup'DH_GerVehicleSounds.88mm.DH88mm_01'
    CannonFireSound(1)=SoundGroup'DH_GerVehicleSounds.88mm.DH88mm_02'
    CannonFireSound(2)=SoundGroup'DH_GerVehicleSounds.88mm.DH88mm_03'
    ProjectileDescriptions(0)="APCBC"
    RangeSettings(1)=100
    RangeSettings(2)=200
    RangeSettings(3)=300
    RangeSettings(4)=400
    RangeSettings(5)=500
    RangeSettings(6)=600
    RangeSettings(7)=700
    RangeSettings(8)=800
    RangeSettings(9)=900
    RangeSettings(10)=1000
    RangeSettings(11)=1100
    RangeSettings(12)=1200
    RangeSettings(13)=1300
    RangeSettings(14)=1400
    RangeSettings(15)=1500
    RangeSettings(16)=1600
    RangeSettings(17)=1700
    RangeSettings(18)=1800
    RangeSettings(19)=1900
    RangeSettings(20)=2000
    RangeSettings(21)=2200
    RangeSettings(22)=2400
    RangeSettings(23)=2600
    RangeSettings(24)=2800
    RangeSettings(25)=3000
    RangeSettings(26)=3200
    RangeSettings(27)=3400
    RangeSettings(28)=3600
    RangeSettings(29)=3800
    RangeSettings(30)=4000
    MinCommanderHitHeight=32.0
    VehHitpoints(0)=(PointRadius=9.0,PointScale=1.0,PointBone="com_player",PointOffset=(X=-4.0))
    VehHitpoints(1)=(PointRadius=16.0,PointScale=1.0,PointBone="com_player",PointOffset=(X=-4.0,Z=-23.0))
    YawBone="Gun"
    YawStartConstraint=-3000.0
    YawEndConstraint=3000.0
    PitchBone="gun_pitch"
    PitchUpLimit=15000
    PitchDownLimit=45000
    WeaponFireAttachmentBone="Barrel"
    GunnerAttachmentBone="com_attachment"
    WeaponFireOffset=30.0
    FireInterval=8.0
    FireSoundVolume=512.0
    FireForce="Explosion05"
    ProjectileClass=class'DH_Vehicles.DH_JagdpantherCannonShell'
    ShakeRotMag=(Z=50.0)
    ShakeRotRate=(Z=1000.0)
    ShakeRotTime=4.0
    ShakeOffsetMag=(Z=1.0)
    ShakeOffsetRate=(Z=100.0)
    ShakeOffsetTime=10.0
    AIInfo(0)=(bLeadTarget=true,WarnTargetPct=0.75,RefireRate=0.5)
    AIInfo(1)=(bLeadTarget=true,WarnTargetPct=0.75,RefireRate=0.015)
    CustomPitchUpLimit=2548
    CustomPitchDownLimit=64079
    MaxPositiveYaw=2367
    MaxNegativeYaw=-2367
    bLimitYaw=true
    BeginningIdleAnim="com_idle_close"
    InitialPrimaryAmmo=42
    InitialSecondaryAmmo=15
    PrimaryProjectileClass=class'DH_Vehicles.DH_JagdpantherCannonShell'
    SecondaryProjectileClass=class'DH_Vehicles.DH_JagdpantherCannonShellHE'
    Mesh=SkeletalMesh'DH_Jagdpanther_anm.Jagdpanther_turret_ext'
    Skins(0)=texture'DH_VehiclesGE_tex2.ext_vehicles.Jagdpanther_body_goodwood'
    Skins(1)=texture'DH_VehiclesGE_tex2.int_vehicles.Jagdpanther_walls_int'
    Skins(2)=texture'DH_VehiclesGE_tex2.int_vehicles.Jagdpanther_turret_int'
    SoundVolume=130
    SoundRadius=300.0
}

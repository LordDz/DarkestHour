//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_TigerCannon extends DHVehicleCannon;

defaultproperties
{
    SecondarySpread=0.00125
    ManualRotationsPerSecond=0.0077
    PoweredRotationsPerSecond=0.025
    FrontArmorFactor=17.1
    RightArmorFactor=8.7
    LeftArmorFactor=8.7
    RearArmorFactor=8.7
    FrontArmorSlope=8.0
    FrontLeftAngle=320.0
    FrontRightAngle=40.0
    RearRightAngle=140.0
    RearLeftAngle=220.0
    ReloadSoundOne=sound'DH_Vehicle_Reloads.Reloads.reload_02s_01'
    ReloadSoundTwo=sound'DH_Vehicle_Reloads.Reloads.reload_02s_02'
    ReloadSoundThree=sound'DH_Vehicle_Reloads.Reloads.reload_01s_03'
    ReloadSoundFour=sound'DH_Vehicle_Reloads.Reloads.reload_02s_04'
    CannonFireSound(0)=SoundGroup'Vehicle_Weapons.Tiger.88mm_fire01'
    CannonFireSound(1)=SoundGroup'Vehicle_Weapons.Tiger.88mm_fire02'
    CannonFireSound(2)=SoundGroup'Vehicle_Weapons.Tiger.88mm_fire03'
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
    ReloadSound=sound'Vehicle_reloads.Reloads.MG34_ReloadHidden'
    NumAltMags=8
    AltTracerProjectileClass=class'DH_MG34VehicleTracerBullet'
    AltFireTracerFrequency=7
    bUsesTracers=true
    bAltFireTracersOnly=true
    MinCommanderHitHeight=60.0
    VehHitpoints(0)=(PointRadius=9.0,PointScale=1.0,PointBone="com_player",PointOffset=(X=-3.0,Z=12.0))
    VehHitpoints(1)=(PointRadius=16.0,PointScale=1.0,PointBone="com_player",PointOffset=(X=-3.0,Z=-11.0))
    hudAltAmmoIcon=texture'InterfaceArt_tex.HUD.mg42_ammo'
    YawBone="Turret"
    PitchBone="Gun"
    PitchUpLimit=15000
    PitchDownLimit=45000
    WeaponFireAttachmentBone="Gun"
    GunnerAttachmentBone="com_attachment"
    WeaponFireOffset=265.0
    AltFireOffset=(X=10.0,Y=31.0,Z=2.0)
    bAmbientAltFireSound=true
    FireInterval=7.0
    AltFireInterval=0.07058
    FireSoundVolume=512.0
    AltFireSoundClass=SoundGroup'DH_WeaponSounds.mg34.mg34_fire_loop'
    AltFireSoundScaling=3.0
    AltFireEndSound=SoundGroup'DH_WeaponSounds.mg34.mg34_fire_end'
    FireForce="Explosion05"
    ProjectileClass=class'DH_Vehicles.DH_TigerCannonShell'
    AltFireProjectileClass=class'DH_Vehicles.DH_MG34VehicleBullet'
    ShakeRotMag=(Z=50.0)
    ShakeRotRate=(Z=1000.0)
    ShakeRotTime=4.0
    ShakeOffsetMag=(Z=1.0)
    ShakeOffsetRate=(Z=100.0)
    ShakeOffsetTime=10.0
    AltShakeRotMag=(X=1.0,Y=1.0,Z=1.0)
    AltShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    AltShakeRotTime=2.0
    AltShakeOffsetMag=(X=0.01,Y=0.01,Z=0.01)
    AltShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    AltShakeOffsetTime=2.0
    CustomPitchUpLimit=3095
    CustomPitchDownLimit=64353
    BeginningIdleAnim="com_idle_close"
    InitialPrimaryAmmo=48
    InitialSecondaryAmmo=44
    InitialAltAmmo=150
    PrimaryProjectileClass=class'DH_Vehicles.DH_TigerCannonShell'
    SecondaryProjectileClass=class'DH_Vehicles.DH_TigerCannonShellHE'
    Mesh=SkeletalMesh'DH_TigerTurret_anm.Tiger_turret_ext'
    Skins(0)=texture'axis_vehicles_tex.ext_vehicles.Tiger1_ext'
    SoundVolume=120
    SoundRadius=300.0
    HighDetailOverlay=Shader'axis_vehicles_tex.int_vehicles.tiger1_int_s'
    bUseHighDetailOverlayIndex=true
    HighDetailOverlayIndex=1
}

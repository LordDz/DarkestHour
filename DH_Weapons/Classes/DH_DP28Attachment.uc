//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DH_DP28Attachment extends DHHighROFWeaponAttachment;

defaultproperties
{
    Mesh=SkeletalMesh'Weapons3rd_anm.DP28'
    MenuImage=Texture'DH_InterfaceArt_tex.weapon_icons.dp28_icon'
    mMuzFlashClass=class'ROEffects.MuzzleFlash3rdDP'
    ROShellCaseClass=class'ROAmmo.RO3rdShellEject762x54mm'
    bSpawnShellsOutBottom=false
    bBarrelCanOverheat=true

    ClientProjectileClass=class'DH_Weapons.DH_DP28Bullet'
    bUsesTracers=true
    TracerFrequency=5
    ClientTracerClass=class'DH_Weapons.DH_DP28TracerBullet'

    WA_Idle="idle_DP28"
    WA_IdleEmpty="idle_DP28"
    WA_Fire="shoot_dp28"
    WA_Reload="reloadhalf_dp28"
    WA_ReloadEmpty="reloadempty_dp28"
    WA_ProneReload="prone_reloadhalf_dp28"
    WA_ProneReloadEmpty="prone_reloadempty_dp28"

    PA_MovementAnims(0)="stand_jogF_dp27"
    PA_MovementAnims(1)="stand_jogB_dp27"
    PA_MovementAnims(2)="stand_jogL_dp27"
    PA_MovementAnims(3)="stand_jogR_dp27"
    PA_MovementAnims(4)="stand_jogFL_dp27"
    PA_MovementAnims(5)="stand_jogFR_dp27"
    PA_MovementAnims(6)="stand_jogBL_dp27"
    PA_MovementAnims(7)="stand_jogBR_dp27"
    PA_CrouchAnims(0)="crouch_walkF_dp27"
    PA_CrouchAnims(1)="crouch_walkB_dp27"
    PA_CrouchAnims(2)="crouch_walkL_dp27"
    PA_CrouchAnims(3)="crouch_walkR_dp27"
    PA_CrouchAnims(4)="crouch_walkFL_dp27"
    PA_CrouchAnims(5)="crouch_walkFR_dp27"
    PA_CrouchAnims(6)="crouch_walkBL_dp27"
    PA_CrouchAnims(7)="crouch_walkBR_dp27"
    PA_ProneIronAnims(0)="prone_slowcrawlF_dp27"
    PA_ProneIronAnims(1)="prone_slowcrawlB_dp27"
    PA_ProneIronAnims(2)="prone_slowcrawlL_dp27"
    PA_ProneIronAnims(3)="prone_slowcrawlR_dp27"
    PA_ProneIronAnims(4)="prone_slowcrawlL_dp27"
    PA_ProneIronAnims(5)="prone_slowcrawlR_dp27"
    PA_ProneIronAnims(6)="prone_slowcrawlB_dp27"
    PA_ProneIronAnims(7)="prone_slowcrawlB_dp27"
    PA_WalkAnims(0)="stand_walkFrest_dp27"
    PA_WalkAnims(1)="stand_walkBrest_dp27"
    PA_WalkAnims(2)="stand_walkLrest_dp27"
    PA_WalkAnims(3)="stand_walkRrest_dp27"
    PA_WalkAnims(4)="stand_walkFLrest_dp27"
    PA_WalkAnims(5)="stand_walkFRrest_dp27"
    PA_WalkAnims(6)="stand_walkBLrest_dp27"
    PA_WalkAnims(7)="stand_walkBRrest_dp27"
    PA_WalkIronAnims(0)="stand_walkFhip_dp27"
    PA_WalkIronAnims(1)="stand_walkBhip_dp27"
    PA_WalkIronAnims(2)="stand_walkLhip_dp27"
    PA_WalkIronAnims(3)="stand_walkRhip_dp27"
    PA_WalkIronAnims(4)="stand_walkFLhip_dp27"
    PA_WalkIronAnims(5)="stand_walkFRhip_dp27"
    PA_WalkIronAnims(6)="stand_walkBLhip_dp27"
    PA_WalkIronAnims(7)="stand_walkBRhip_dp27"
    PA_SprintAnims(0)="stand_sprintF_dp27"
    PA_SprintAnims(1)="stand_sprintB_dp27"
    PA_SprintAnims(2)="stand_sprintL_dp27"
    PA_SprintAnims(3)="stand_sprintR_dp27"
    PA_SprintAnims(4)="stand_sprintFL_dp27"
    PA_SprintAnims(5)="stand_sprintFR_dp27"
    PA_SprintAnims(6)="stand_sprintBL_dp27"
    PA_SprintAnims(7)="stand_sprintBR_dp27"
    PA_SprintCrouchAnims(0)="crouch_sprintF_dp27"
    PA_SprintCrouchAnims(1)="crouch_sprintB_dp27"
    PA_SprintCrouchAnims(2)="crouch_sprintL_dp27"
    PA_SprintCrouchAnims(3)="crouch_sprintR_dp27"
    PA_SprintCrouchAnims(4)="crouch_sprintFL_dp27"
    PA_SprintCrouchAnims(5)="crouch_sprintFR_dp27"
    PA_SprintCrouchAnims(6)="crouch_sprintBL_dp27"
    PA_SprintCrouchAnims(7)="crouch_sprintBR_dp27"
    PA_TurnRightAnim="stand_turnRrest_dp27"
    PA_TurnLeftAnim="stand_turnLrest_dp27"
    PA_TurnIronRightAnim="stand_turnRhip_dp27"
    PA_TurnIronLeftAnim="stand_turnLhip_dp27"
    PA_CrouchTurnIronRightAnim="crouch_turnR_dp27"
    PA_CrouchTurnIronLeftAnim="crouch_turnL_dp27"
    PA_ProneTurnRightAnim="prone_turnR_dp27"
    PA_ProneTurnLeftAnim="prone_turnL_dp27"
    PA_StandToProneAnim="StandtoProne_dp27"
    PA_CrouchToProneAnim="CrouchtoProne_dp27"
    PA_ProneToStandAnim="PronetoStand_dp27"
    PA_ProneToCrouchAnim="PronetoCrouch_dp27"
    PA_DiveToProneStartAnim="prone_diveF_kar"
    PA_DiveToProneEndAnim="prone_diveend_kar"
    PA_CrouchTurnRightAnim="crouch_turnR_dp27"
    PA_CrouchTurnLeftAnim="crouch_turnL_dp27"
    PA_CrouchIdleRestAnim="crouch_idle_dp27"
    PA_IdleCrouchAnim="crouch_idle_dp27"
    PA_IdleRestAnim="stand_idlerest_dp27"
    PA_IdleWeaponAnim="stand_idlerest_dp27"
    PA_IdleIronRestAnim="stand_idlehip_dp27"
    PA_IdleIronWeaponAnim="stand_idlehip_dp27"
    PA_IdleCrouchIronWeaponAnim="crouch_idle_dp27"
    PA_IdleProneAnim="prone_idle_dp27"
    PA_IdleDeployedAnim="stand_idleiron_dp27"
    PA_IdleDeployedProneAnim="prone_idle_dp27"
    PA_IdleDeployedCrouchAnim="crouch_idleiron_dp27"
    PA_ReloadAnim="stand_reloadhalf_dp27"
    PA_ProneReloadAnim="prone_reloadhalf_dp27"
    PA_ReloadEmptyAnim="stand_reloadempty_dp27"
    PA_ProneReloadEmptyAnim="prone_reloadempty_dp27"
    PA_ProneIdleRestAnim="prone_idle_dp27"
    PA_StandWeaponDeployAnim="stand_idleiron_dp27"
    PA_ProneWeaponDeployAnim="prone_idle_dp27"
    PA_StandWeaponUnDeployAnim="stand_idleiron_dp27"
    PA_ProneWeaponUnDeployAnim="prone_idle_dp27"
    PA_Fire="stand_shoothip_dp27"
    PA_IronFire="stand_shoothip_dp27"
    PA_CrouchFire="crouch_shoot_dp27"
    PA_CrouchIronFire="crouch_shoot_dp27"
    PA_ProneFire="prone_shoot_dp27"
    PA_DeployedFire="stand_shootiron_dp27"
    PA_CrouchDeployedFire="crouch_shootiron_dp27"
    PA_ProneDeployedFire="prone_shoot_dp27"
    PA_MoveStandFire(0)="stand_shootFwalk_dp27"
    PA_MoveStandFire(1)="stand_shootFwalk_dp27"
    PA_MoveStandFire(2)="stand_shootLRwalk_dp27"
    PA_MoveStandFire(3)="stand_shootLRwalk_dp27"
    PA_MoveStandFire(4)="stand_shootFLwalk_dp27"
    PA_MoveStandFire(5)="stand_shootFRwalk_dp27"
    PA_MoveStandFire(6)="stand_shootFRwalk_dp27"
    PA_MoveStandFire(7)="stand_shootFLwalk_dp27"
    PA_MoveCrouchFire(0)="crouch_shootF_dp27"
    PA_MoveCrouchFire(1)="crouch_shootF_dp27"
    PA_MoveCrouchFire(2)="crouch_shootLR_dp27"
    PA_MoveCrouchFire(3)="crouch_shootLR_dp27"
    PA_MoveCrouchFire(4)="crouch_shootF_dp27"
    PA_MoveCrouchFire(5)="crouch_shootF_dp27"
    PA_MoveCrouchFire(6)="crouch_shootF_dp27"
    PA_MoveCrouchFire(7)="crouch_shootF_dp27"
    PA_MoveWalkFire(0)="stand_shootFwalk_dp27"
    PA_MoveWalkFire(1)="stand_shootFwalk_dp27"
    PA_MoveWalkFire(2)="stand_shootLRwalk_dp27"
    PA_MoveWalkFire(3)="stand_shootLRwalk_dp27"
    PA_MoveWalkFire(4)="stand_shootFLwalk_dp27"
    PA_MoveWalkFire(5)="stand_shootFRwalk_dp27"
    PA_MoveWalkFire(6)="stand_shootFRwalk_dp27"
    PA_MoveWalkFire(7)="stand_shootFLwalk_dp27"
    PA_MoveStandIronFire(0)="stand_shootFwalk_dp27"
    PA_MoveStandIronFire(1)="stand_shootFwalk_dp27"
    PA_MoveStandIronFire(2)="stand_shootLRwalk_dp27"
    PA_MoveStandIronFire(3)="stand_shootLRwalk_dp27"
    PA_MoveStandIronFire(4)="stand_shootFLwalk_dp27"
    PA_MoveStandIronFire(5)="stand_shootFRwalk_dp27"
    PA_MoveStandIronFire(6)="stand_shootFRwalk_dp27"
    PA_MoveStandIronFire(7)="stand_shootFLwalk_dp27"
    PA_AltFire="stand_shoothip_dp27"
    PA_CrouchAltFire="crouch_shoot_dp27"
    PA_ProneAltFire="prone_shoot_dp27"
    PA_FireLastShot="stand_shoothip_dp27"
    PA_IronFireLastShot="stand_shootiron_dp27"
    PA_CrouchFireLastShot="crouch_shoot_dp27"
    PA_ProneFireLastShot="prone_shoot_dp27"
}

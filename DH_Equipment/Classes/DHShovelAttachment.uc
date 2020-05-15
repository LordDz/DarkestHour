//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DHShovelAttachment extends DHWeaponAttachment
    abstract;

defaultproperties
{
    CullDistance=4096.0 // 68m - undo the increase added in DHWeaponAttachment, which was only to show muzzle flashes at greater distances
    MenuImage=Texture'DH_InterfaceArt_tex.weapon_icons.Drautschere_icon'
    bRapidFire=false
    LightType=LT_None
    LightEffect=LE_None

    PA_MovementAnims(0)="stand_jogF_nade"
    PA_MovementAnims(1)="stand_jogB_nade"
    PA_MovementAnims(2)="stand_jogL_nade"
    PA_MovementAnims(3)="stand_jogR_nade"
    PA_MovementAnims(4)="stand_jogFL_nade"
    PA_MovementAnims(5)="stand_jogFR_nade"
    PA_MovementAnims(6)="stand_jogBL_nade"
    PA_MovementAnims(7)="stand_jogBR_nade"
    PA_CrouchAnims(0)="crouch_walkF_nade"
    PA_CrouchAnims(1)="crouch_walkB_nade"
    PA_CrouchAnims(2)="crouch_walkL_nade"
    PA_CrouchAnims(3)="crouch_walkR_nade"
    PA_CrouchAnims(4)="crouch_walkFL_nade"
    PA_CrouchAnims(5)="crouch_walkFR_nade"
    PA_CrouchAnims(6)="crouch_walkBL_nade"
    PA_CrouchAnims(7)="crouch_walkBR_nade"
    PA_ProneAnims(0)="prone_crawlF_nade"
    PA_ProneAnims(1)="prone_crawlB_nade"
    PA_ProneAnims(2)="prone_crawlL_nade"
    PA_ProneAnims(3)="prone_crawlR_nade"
    PA_ProneAnims(4)="prone_crawlFL_nade"
    PA_ProneAnims(5)="prone_crawlFR_nade"
    PA_ProneAnims(6)="prone_crawlBL_nade"
    PA_ProneAnims(7)="prone_crawlBR_nade"
    PA_WalkAnims(0)="stand_walkFhip_nade"
    PA_WalkAnims(1)="stand_walkBhip_nade"
    PA_WalkAnims(2)="stand_walkLhip_nade"
    PA_WalkAnims(3)="stand_walkRhip_nade"
    PA_WalkAnims(4)="stand_walkFLhip_nade"
    PA_WalkAnims(5)="stand_walkFRhip_nade"
    PA_WalkAnims(6)="stand_walkBLhip_nade"
    PA_WalkAnims(7)="stand_walkBRhip_nade"
    PA_SprintAnims(0)="stand_sprintF_nade"
    PA_SprintAnims(1)="stand_sprintB_nade"
    PA_SprintAnims(2)="stand_sprintL_nade"
    PA_SprintAnims(3)="stand_sprintR_nade"
    PA_SprintAnims(4)="stand_sprintFL_nade"
    PA_SprintAnims(5)="stand_sprintFR_nade"
    PA_SprintAnims(6)="stand_sprintBL_nade"
    PA_SprintAnims(7)="stand_sprintBR_nade"
    PA_SprintCrouchAnims(0)="crouch_sprintF_nade"
    PA_SprintCrouchAnims(1)="crouch_sprintB_nade"
    PA_SprintCrouchAnims(2)="crouch_sprintL_nade"
    PA_SprintCrouchAnims(3)="crouch_sprintR_nade"
    PA_SprintCrouchAnims(4)="crouch_sprintFL_nade"
    PA_SprintCrouchAnims(5)="crouch_sprintFR_nade"
    PA_SprintCrouchAnims(6)="crouch_sprintBL_nade"
    PA_SprintCrouchAnims(7)="crouch_sprintBR_nade"
    PA_TurnRightAnim="stand_turnR_nade"
    PA_TurnLeftAnim="stand_turnL_nade"
    PA_ProneTurnRightAnim="prone_turnR_nade"
    PA_ProneTurnLeftAnim="prone_turnL_nade"
    PA_StandToProneAnim="StandtoProne_nade"
    PA_CrouchToProneAnim="CrouchtoProne_nade"
    PA_ProneToStandAnim="PronetoStand_nade"
    PA_ProneToCrouchAnim="PronetoCrouch_nade"
    PA_DiveToProneStartAnim="prone_diveF_nade"
    PA_DiveToProneEndAnim="prone_diveend_nade"
    PA_CrouchTurnRightAnim="crouch_turnR_nade"
    PA_CrouchTurnLeftAnim="crouch_turnL_nade"
    PA_CrouchIdleRestAnim="crouch_idle_nade"
    PA_IdleCrouchAnim="crouch_idle_nade"
    PA_IdleRestAnim="stand_idlehip_nade"
    PA_IdleWeaponAnim="stand_idlehip_nade"
    PA_IdleProneAnim="prone_idle_nade"
    PA_ReloadAnim=""
    PA_ProneReloadAnim=""
    PA_ProneIdleRestAnim="prone_idle_nade"

    // TODO: these fire anims shouldn't be grenade throws, but at present we have nothing like a shovelling action
    // For some reason it seems they are being blended with the 'stand_idlehip_kar' anim playing on channel 0 (with fire anims playing on channel 0)
    // It appears this blend gives an odd kind of small sort-of shovelling movement, but probably by accident
    PA_Fire="stand_throw_nade"
    PA_CrouchFire="crouch_throw_nade"
    PA_ProneFire="prone_throw_nade"
    PA_MoveStandFire(0)="stand_throw_nade"
    PA_MoveStandFire(1)="stand_throw_nade"
    PA_MoveStandFire(2)="stand_throw_nade"
    PA_MoveStandFire(3)="stand_throw_nade"
    PA_MoveStandFire(4)="stand_throw_nade"
    PA_MoveStandFire(5)="stand_throw_nade"
    PA_MoveStandFire(6)="stand_throw_nade"
    PA_MoveStandFire(7)="stand_throw_nade"
    PA_MoveCrouchFire(0)="crouch_throw_nade"
    PA_MoveCrouchFire(1)="crouch_throw_nade"
    PA_MoveCrouchFire(2)="crouch_throw_nade"
    PA_MoveCrouchFire(3)="crouch_throw_nade"
    PA_MoveCrouchFire(4)="crouch_throw_nade"
    PA_MoveCrouchFire(5)="crouch_throw_nade"
    PA_MoveCrouchFire(6)="crouch_throw_nade"
    PA_MoveCrouchFire(7)="crouch_throw_nade"
    PA_MoveWalkFire(0)="stand_throw_nade"
    PA_MoveWalkFire(1)="stand_throw_nade"
    PA_MoveWalkFire(2)="stand_throw_nade"
    PA_MoveWalkFire(3)="stand_throw_nade"
    PA_MoveWalkFire(4)="stand_throw_nade"
    PA_MoveWalkFire(5)="stand_throw_nade"
    PA_MoveWalkFire(6)="stand_throw_nade"
    PA_MoveWalkFire(7)="stand_throw_nade"
    PA_FireLastShot="stand_throw_nade"
    PA_CrouchFireLastShot="crouch_throw_nade"
    PA_ProneFireLastShot="prone_throw_nade"

    PA_AirStillAnim="jump_mid_nade"
    PA_AirAnims(0)="jumpF_mid_nade"
    PA_AirAnims(1)="jumpB_mid_nade"
    PA_AirAnims(2)="jumpL_mid_nade"
    PA_AirAnims(3)="jumpR_mid_nade"
    PA_TakeoffStillAnim="jump_takeoff_nade"
    PA_TakeoffAnims(0)="jumpF_takeoff_nade"
    PA_TakeoffAnims(1)="jumpB_takeoff_nade"
    PA_TakeoffAnims(2)="jumpL_takeoff_nade"
    PA_TakeoffAnims(3)="jumpR_takeoff_nade"
    PA_LandAnims(0)="jumpF_land_nade"
    PA_LandAnims(1)="jumpB_land_nade"
    PA_LandAnims(2)="jumpL_land_nade"
    PA_LandAnims(3)="jumpR_land_nade"
    PA_DodgeAnims(0)="jumpF_mid_nade"
    PA_DodgeAnims(1)="jumpB_mid_nade"
    PA_DodgeAnims(2)="jumpL_mid_nade"
    PA_DodgeAnims(3)="jumpR_mid_nade"
    PA_ProneAltFire="prone_throw_nade"
    PA_CrouchAltFire="crouch_throw_nade"
    PA_AltFire="stand_throw_nade"

    // Bash anims
    PA_IdleBashHold="stand_hold_nade"
    PA_IdleCrouchBashHold="crouch_hold_nade"
    PA_IdleProneBashHold="prone_hold_nade"
    PA_MoveHoldBash(0)="stand_jogFhold_nade"
    PA_MoveHoldBash(1)="stand_jogBhold_nade"
    PA_MoveHoldBash(2)="stand_jogLhold_nade"
    PA_MoveHoldBash(3)="stand_jogRhold_nade"
    PA_MoveHoldBash(4)="stand_jogFLhold_nade"
    PA_MoveHoldBash(5)="stand_jogFRhold_nade"
    PA_MoveHoldBash(6)="stand_jogBLhold_nade"
    PA_MoveHoldBash(7)="stand_jogBRhold_nade"
    PA_WalkHoldBash(0)="stand_walkFhold_nade"
    PA_WalkHoldBash(1)="stand_walkBhold_nade"
    PA_WalkHoldBash(2)="stand_walkLhold_nade"
    PA_WalkHoldBash(3)="stand_walkRhold_nade"
    PA_WalkHoldBash(4)="stand_walkFLhold_nade"
    PA_WalkHoldBash(5)="stand_walkFRhold_nade"
    PA_WalkHoldBash(6)="stand_walkBLhold_nade"
    PA_WalkHoldBash(7)="stand_walkBRhold_nade"
    PA_CrouchHoldBash(0)="crouch_walkFhold_nade"
    PA_CrouchHoldBash(1)="crouch_walkBhold_nade"
    PA_CrouchHoldBash(2)="crouch_walkLhold_nade"
    PA_CrouchHoldBash(3)="crouch_walkRhold_nade"
    PA_CrouchHoldBash(4)="crouch_walkFLhold_nade"
    PA_CrouchHoldBash(5)="crouch_walkFRhold_nade"
    PA_CrouchHoldBash(6)="crouch_walkBLhold_nade"
    PA_CrouchHoldBash(7)="crouch_walkBRhold_nade"
    PA_SprintHoldBash(0)="stand_sprintFhold_nade"
    PA_SprintHoldBash(1)="stand_sprintBhold_nade"
    PA_SprintHoldBash(2)="stand_sprintLhold_nade"
    PA_SprintHoldBash(3)="stand_sprintRhold_nade"
    PA_SprintHoldBash(4)="stand_sprintFLhold_nade"
    PA_SprintHoldBash(5)="stand_sprintFRhold_nade"
    PA_SprintHoldBash(6)="stand_sprintBLhold_nade"
    PA_SprintHoldBash(7)="stand_sprintBRhold_nade"
    PA_SprintCrouchHoldBash(0)="crouch_sprintFhold_nade"
    PA_SprintCrouchHoldBash(1)="crouch_sprintBhold_nade"
    PA_SprintCrouchHoldBash(2)="crouch_sprintLhold_nade"
    PA_SprintCrouchHoldBash(3)="crouch_sprintRhold_nade"
    PA_SprintCrouchHoldBash(4)="crouch_sprintFLhold_nade"
    PA_SprintCrouchHoldBash(5)="crouch_sprintFRhold_nade"
    PA_SprintCrouchHoldBash(6)="crouch_sprintBLhold_nade"
    PA_SprintCrouchHoldBash(7)="crouch_sprintBRhold_nade"
}

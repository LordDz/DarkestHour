//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DH_WSSGreatcoatGunner extends DHGEMachineGunnerRoles;

defaultproperties
{
    RolePawns(0)=(PawnClass=class'DH_GerPlayers.DH_GermanGreatCoatPawn',Weight=1.0)
    SleeveTexture=Texture'Weapons1st_tex.Arms.GermanCoatSleeves'
    DetachedArmClass=class'ROEffects.SeveredArmGerGreat'
    DetachedLegClass=class'ROEffects.SeveredLegGerGreat'
    Headgear(0)=class'DH_GerPlayers.DH_HeerHelmetThree'
    Headgear(1)=class'DH_GerPlayers.DH_HeerHelmetTwo'
}

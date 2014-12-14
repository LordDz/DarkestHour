//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2014
//==============================================================================

class DH_BritishTanker7th extends DH_British_7thArmouredDivision;

defaultproperties
{
    MyName="Tank Crewman"
    AltName="Tank Crewman"
    Article="a "
    PluralName="Tank Crewmen"
    InfoText="The tank crewman is a composite role tasked with a variety of operations including  gunner, hull gunner and driver. Each position has a specific view sector out of the tank and is responsible for keeping watch and reporting enemy movements in that direction, as well as performing their primary function."
    MenuImage=Texture'DHBritishCharactersTex.Icons.Brit_TankCrew'
    Models(0)="Brit_Tanker1"
    Models(1)="Brit_Tanker2"
    Models(2)="Brit_Tanker3"
    SleeveTexture=Texture'DHBritishCharactersTex.Sleeves.brit_sleeves'
    SecondaryWeapons(0)=(Item=class'DH_Weapons.DH_EnfieldNo2Weapon',Amount=1)
    Headgear(0)=class'DH_BritishPlayers.DH_BritishTankerBeret'
    PrimaryWeaponType=WT_SMG
    bEnhancedAutomaticControl=true
    bCanBeTankCrew=true
    Limit=3
}

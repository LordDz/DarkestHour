//=============================================================================
//DH_USEngineer29th.
//=============================================================================
class DH_USEngineer7th extends DH_US_7th_NavalBeachBattalion;

function class<ROHeadgear> GetHeadgear()
{
    if (FRand() < 0.2)
        return Headgear[0];
    else
        return Headgear[1];
}

defaultproperties
{
     MyName="Combat Engineer"
     AltName="Combat Engineer"
     Article="a "
     PluralName="Combat Engineers"
     InfoText="The combat engineer is tasked with destroying front-line enemy obstacles and fortifications.  Geared for close quarters combat, the combat engineer is generally equipped with sub machine-guns and grenades.  For instances where enemy fortifications or obstacles are exposed to enemy fire, he is equipped with concealment smoke so he may get close enough to destroy the target."
     MenuImage=Texture'DHUSCharactersTex.Icons.IconEng'
     Models(0)="US_7thN1"
     Models(1)="US_7thN2"
     Models(2)="US_7thN3"
     SleeveTexture=Texture'DHUSCharactersTex.Sleeves.US_sleeves'
     PrimaryWeapons(0)=(Item=Class'DH_Weapons.DH_M1CarbineWeapon',Amount=6,AssociatedAttachment=Class'DH_Weapons.DH_M1CarbineAmmoPouch')
     PrimaryWeapons(1)=(Item=Class'DH_Weapons.DH_GreaseGunWeapon',Amount=6,AssociatedAttachment=Class'DH_Weapons.DH_ThompsonAmmoPouch')
     Grenades(0)=(Item=Class'DH_Weapons.DH_M1GrenadeWeapon',Amount=2)
     Grenades(1)=(Item=Class'DH_Equipment.DH_USSmokeGrenadeWeapon',Amount=1)
     GivenItems(0)="DH_Weapons.DH_SatchelCharge10lb10sWeapon"
     Headgear(0)=Class'DH_USPlayers.DH_AmericanHelmet7thEMa'
     Headgear(1)=Class'DH_USPlayers.DH_AmericanHelmet7thEMb'
     PrimaryWeaponType=WT_SemiAuto
     Limit=2
}

// *************************************************************************
//
//  ***   Heer Squad Leader ***
//
// *************************************************************************

class DH_WHSquadLeader_Snow extends DH_HeerSnow;

function class<ROHeadgear> GetHeadgear()
{
    if (FRand() < 0.2)
    {
        return Headgear[0];
    }
    else
    {
        return Headgear[1];
    }
}

defaultproperties
{
     bIsSquadLeader=true
     MyName="Squad Leader"
     AltName="Unteroffizier"
     Article="a "
     PluralName="Squad Leaders"
     InfoText="The squad leader is tasked with overseeing the completion of the squad's objectives by directing his men in combat and ensuring the overall firepower is put to good use.  With the effective use of smoke and close-quarters weaponry, the squad leader's presence is an excellent force multiplier to the units under his command."
     MenuImage=Texture'DHGermanCharactersTex.Icons.WH_SqL'
     Models(0)="WHS_1"
     Models(1)="WHS_2"
     Models(2)="WHS_3"
     Models(3)="WHS_4"
     Models(4)="WHS_5"
     Models(5)="WHS_6"
     bIsLeader=true
     SleeveTexture=Texture'Weapons1st_tex.Arms.RussianSnow_Sleeves'
     PrimaryWeapons(0)=(Item=Class'DH_Weapons.DH_MP40Weapon',Amount=6,AssociatedAttachment=Class'ROInventory.ROMP40AmmoPouch')
     SecondaryWeapons(0)=(Item=Class'DH_Weapons.DH_P38Weapon',Amount=1)
     SecondaryWeapons(1)=(Item=Class'DH_Weapons.DH_P08LugerWeapon',Amount=1)
     Grenades(0)=(Item=Class'DH_Weapons.DH_StielGranateWeapon',Amount=2)
     Grenades(1)=(Item=Class'DH_Equipment.DH_NebelGranate39Weapon',Amount=1)
     Grenades(2)=(Item=Class'DH_Equipment.DH_OrangeSmokeWeapon',Amount=1)
     Headgear(0)=Class'DH_GerPlayers.DH_HeerHelmetSnow'
     Headgear(1)=Class'DH_GerPlayers.DH_HeerHelmetCover'
     PrimaryWeaponType=WT_SMG
     bEnhancedAutomaticControl=true
     Limit=2
}

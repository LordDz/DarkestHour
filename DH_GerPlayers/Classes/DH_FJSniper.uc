// *************************************************************************
//
//  ***   FJ Sniper   ***
//
// *************************************************************************


class DH_FJSniper extends DH_FJ;

function class<ROHeadgear> GetHeadgear()
{
    local int RandNum;
    RandNum = Rand(3);

    switch (RandNum)
    {
        case 0:
             return Headgear[0];
        case 1:
             return Headgear[1];
        case 2:
             return Headgear[2];
        default:
             return Headgear[0];
    }
}

defaultproperties
{
     MyName="Sniper"
     AltName="Scharfschütze"
     Article="a "
     PluralName="Snipers"
     InfoText="The sniper is tasked with the specialized goal of eliminating key hostile units and shaking enemy morale through careful marksmanship and fieldcraft.  Through patient observation, the sniper is also capable of providing valuable reconnaissance which can have a significant impact on the outcome of the battle."
     MenuImage=Texture'DHGermanCharactersTex.Icons.FJ_Sniper'
     Models(0)="FJ1"
     Models(1)="FJ2"
     Models(2)="FJ3"
     Models(3)="FJ4"
     Models(4)="FJ5"
     SleeveTexture=Texture'DHGermanCharactersTex.GerSleeves.FJ_Sleeve'
     PrimaryWeapons(0)=(Item=Class'DH_Weapons.DH_Kar98ScopedWeapon',Amount=18)
     PrimaryWeapons(1)=(Item=Class'DH_Weapons.DH_G43ScopedWeapon',Amount=6)
     SecondaryWeapons(0)=(Item=Class'DH_Weapons.DH_P38Weapon',Amount=1)
     Headgear(0)=Class'DH_GerPlayers.DH_FJHelmetCamo1'
     Headgear(1)=Class'DH_GerPlayers.DH_FJHelmetCamo2'
     Headgear(2)=Class'DH_GerPlayers.DH_FJHelmetNet1'
     PrimaryWeaponType=WT_Sniper
     Limit=2
}

// *************************************************************************
//
//  ***   Heer Mortar Operator   ***
//
// *************************************************************************

class DH_WHMortarman_Autumn extends DH_HeerAutumn;

function class<ROHeadgear> GetHeadgear()
{
    if (FRand() < 0.2)
        return Headgear[0];
    else
        return Headgear[1];
}

defaultproperties
{
     bCanUseMortars=true
     bCarriesMortarAmmo=false
     MyName="Mortar Operator"
     AltName="Werferschütze"
     Article="a "
     PluralName="Mortar Operators"
     InfoText="The mortar operator is tasked with providing indirect fire on distant targets using his medium mortar.  The mortar operator should work closely with a mortar observer to accurately bombard targets out of visual range.||* Targets marked by a mortar observer will appear on your situation map.|* Rounds that land near the marked target will appear on your situation map."
     MenuImage=Texture'DHGermanCharactersTex.Icons.WH_MortarOperator'
     Models(0)="WHAu_1"
     Models(1)="WHAu_2"
     Models(2)="WHAu_3"
     Models(3)="WHAu_4"
     Models(4)="WHAu_5"
     Models(5)="WHAu_6"
     SleeveTexture=Texture'DHGermanCharactersTex.GerSleeves.SplinterASleeve'
     PrimaryWeapons(0)=(Item=Class'DH_Weapons.DH_Kar98Weapon',Amount=18,AssociatedAttachment=Class'ROInventory.ROKar98AmmoPouch')
     GivenItems(0)="DH_Mortars.DH_Kz8cmGrW42Weapon"
     GivenItems(1)="DH_Equipment.DH_GerBinocularsItem"
     Headgear(0)=Class'DH_GerPlayers.DH_HeerHelmetCover'
     Headgear(1)=Class'DH_GerPlayers.DH_HeerHelmetNoCover'
     Limit=1
}

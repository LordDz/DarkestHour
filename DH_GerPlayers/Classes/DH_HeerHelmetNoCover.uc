//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2014
//==============================================================================

class DH_HeerHelmetNoCover extends DH_Headgear;

static function StaticPrecache(LevelInfo L)
{
//  L.AddPrecacheMaterial(Material'GermanCharactersTex.Heer.HeerParkaCam1');
}

defaultproperties
{
    Mesh=SkeletalMesh'dhgear_anm.Ger_HelmetNC'
    Skins(0)=Texture'DHGermanCharactersTex.GerHeadgear.WH_HG_2'
}

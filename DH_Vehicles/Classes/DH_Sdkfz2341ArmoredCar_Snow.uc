//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2017
//==============================================================================

class DH_Sdkfz2341ArmoredCar_Snow extends DH_Sdkfz2341ArmoredCar;

#exec OBJ LOAD FILE=..\Textures\DH_VehiclesGE_tex5.utx

defaultproperties
{
    Skins(0)=texture'DH_VehiclesGE_tex5.ext_vehicles.sdkfz2341_body_snow'
    Skins(1)=texture'DH_VehiclesGE_tex5.ext_vehicles.sdkfz2341_wheels_snow'
    Skins(2)=texture'DH_VehiclesGE_tex5.ext_vehicles.sdkfz2341_extras_snow'
    CannonSkins(0)=texture'DH_VehiclesGE_tex5.ext_vehicles.sdkfz2341_body_snow'
    CannonSkins(1)=texture'DH_VehiclesGE_tex5.ext_vehicles.sdkfz2341_extras_snow'
    DestroyedVehicleMesh=StaticMesh'DH_German_vehicles_stc3.234.234_destsnow'
}

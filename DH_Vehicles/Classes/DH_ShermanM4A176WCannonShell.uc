//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DH_ShermanM4A176WCannonShell extends DHCannonShell;

defaultproperties
{
    Speed=47828.0 // 2600 fps or 792 m/s
    MaxSpeed=47828.0
    ShellDiameter=7.62
    BallisticCoefficient=3.21 // Correct - verified on range at 1000 yards

    //Damage
    bShatterProne=true
    ImpactDamage=580
    ShellImpactDamage=class'DH_Vehicles.DH_ShermanM4A176WCannonShellDamageAP'
    HullFireChance=0.4
    EngineFireChance=0.80

    //Penetration
    DHPenetrationTable(0)=12.5
    DHPenetrationTable(1)=12.1
    DHPenetrationTable(2)=11.6
    DHPenetrationTable(3)=11.1
    DHPenetrationTable(4)=10.6
    DHPenetrationTable(5)=10.1
    DHPenetrationTable(6)=9.7
    DHPenetrationTable(7)=9.3
    DHPenetrationTable(8)=8.9
    DHPenetrationTable(9)=8.7
    DHPenetrationTable(10)=7.4
}

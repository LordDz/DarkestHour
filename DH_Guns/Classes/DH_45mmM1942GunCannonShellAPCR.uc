//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2019
//==============================================================================

class DH_45mmM1942GunCannonShellAPCR extends DH_45mmM1937GunCannonShellAPCR;

defaultproperties
{
    Speed=52506.0 // 870 m/s
    MaxSpeed=52506.0
    ImpactDamage=280 // just a tungsten slug; no explosive filler

    DHPenetrationTable(0)=10.8  // 100m // TODO: confirm penetration
    DHPenetrationTable(1)=9.3  // 250m
    DHPenetrationTable(2)=7.4  // 500m
    DHPenetrationTable(3)=5.8
    DHPenetrationTable(4)=4.6  // 1000m - extrapolation beyond here
    DHPenetrationTable(5)=3.7
    DHPenetrationTable(6)=3.0  // 1500m
    DHPenetrationTable(7)=2.8
    DHPenetrationTable(8)=2.4  // 2000m
    DHPenetrationTable(9)=2.2
    DHPenetrationTable(10)=1.9 // 3000m

    MechanicalRanges(1)=(Range=500,RangeValue=-45.0) // this cannon doesn't actually have mechanical aiming, but this is a fudge to adjust for sight markings that are 'out'
    MechanicalRanges(2)=(Range=1000,RangeValue=-102.0)
    MechanicalRanges(3)=(Range=1500,RangeValue=-160.0) // can only set up to here
    MechanicalRanges(4)=(Range=2000,RangeValue=-218.0)
    MechanicalRanges(5)=(Range=2500,RangeValue=-276.0)
}

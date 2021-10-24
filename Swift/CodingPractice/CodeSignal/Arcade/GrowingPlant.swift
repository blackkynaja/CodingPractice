func growingPlant(upSpeed: Int, downSpeed: Int, desiredHeight: Int) -> Int {
    if desiredHeight <= upSpeed {
        return 1
    }
    if upSpeed+(upSpeed - downSpeed) > desiredHeight {
        return 2
    }
    return ((desiredHeight-upSpeed)/(upSpeed - downSpeed))+1
}
//g0 = 0
//g1 = upSpeed
//g2 = upSpeed+(upSpeed - downSpeed)
//g3 = upSpeed+(upSpeed - downSpeed)+(upSpeed - downSpeed)
//gn = upspeed+(n-1)(upSpeed - downSpeed) 

/*
 Company: Uber
 https://app.codesignal.com/company-challenges/uber/gsjPcfsuNavxhsQQ7
 */

import Foundation

func perfectCity(departure: [Double], destination: [Double]) -> Double {
    let depX = departure[0]
    let depY = departure[1]
    let desX = destination[0]
    let desY = destination[1]
    
    var cost = 0.0
    
    if floor(depX) != floor(desX) {
        cost += abs(depX-desX)
    } else {
        var x = 0.0
        let mid = floor(desX) + 0.5
        if abs(depX-mid) > abs(desX-mid) {
            x = round(depX)
        } else {
            x = round(desX)
        }
        cost += abs(x-depX)
        cost += abs(x-desX)
    }
    
    if floor(depY) != floor(desY) {
        cost += abs(depY-desY)
    } else {
        var y = 0.0
        let mid = floor(desY) + 0.5
        if abs(depY-mid) > abs(desY-mid) {
            y = round(depY)
        } else {
            y = round(desY)
        }
        cost += abs(y-depY)
        cost += abs(y-desY)
    }
    
    return cost
}

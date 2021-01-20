/*
Find maximum space after prison has been break in [h] and [v] location
 */

import Foundation

func prison(n: Int, m: Int, h: [Int], v: [Int]) -> Int {
    // Write your code here
    let sortH = h.sorted()
    let sortV = v.sorted()
    
    var tempH = 1
    var maxH = 1
    for i in 0..<sortH.count-1 {
        if sortH[i] == sortH[i+1]-1 {
            tempH+=1
            maxH = tempH
        } else {
            tempH = 1
        }
    }
    
    var tempV = 1
    var maxV = 1
    for i in 0..<sortV.count-1 {
        if sortV[i] == sortV[i+1]-1 {
            tempV+=1
            maxV = tempV
        } else {
            tempV = 1
        }
    }
    
    print(maxH,maxV)
    return (maxH+1)*(maxV+1)

}

/* Test Example
 var h = [1,2,8,9,10]
 var v = [1,2,8,9,10]
 print(prison(n: 100, m: 100, h: h, v: v))
 */

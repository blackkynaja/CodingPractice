//
//  SmallestValueoftheRearrangedNumber.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/smallest-value-of-the-rearranged-number/
 
 Topics: Sorting
 */

class SmallestValueoftheRearrangedNumber {
    func smallestNumber(_ num: Int) -> Int {
        if num == 0 {
            return 0
        }
        var absNum = Array(String(abs(num)))
        if num >= 0 {
            absNum.sort()
            var i = 0
            var foundZero = false
            while i < absNum.count {
                if String(absNum[i]) != "0" {
                    break
                }
                foundZero = true
                i += 1
            }
            
            if foundZero {
                // print(i, absNum)
                let temp = absNum[0]
                absNum[0] = absNum[i]
                absNum[i] = temp
            }
        } else {
            absNum.sort {$0 > $1}
        }
        
        if num >= 0 {
            return Int(String(absNum))!
        } else {
            return Int(String(absNum))! * -1
        }
    }
}

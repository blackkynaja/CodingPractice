//
//  CountIntegersWithEvenDigitSum.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/count-integers-with-even-digit-sum/
 
 Topics: Math, Simulation
 */

class CountIntegersWithEvenDigitSum {
    func sumDigit(_ num: Int) -> Int {
        let s = Array(String(num))
        var sum = 0
        for c in s {
            sum += c.wholeNumberValue!
        }
        return sum
    }
    func countEven(_ num: Int) -> Int {
        if num == 1 {
            return 0
        }
        var count = 0
        for i in 2...num {
            let sum = sumDigit(i)
            if sum%2 == 0 {
                count += 1
            }
        }
        return count
    }
}

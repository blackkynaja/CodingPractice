//
//  ArithmeticSlices.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/arithmetic-slices/
 
 Topics: Array, DP
 */

class ArithmeticSlices {
    
    /*
     - Find array with 3 elements that is Arithmetic first, if found, expand array until it not in the condition
     - Calculate number of subarray from length, which is sum of length-2
     */
    func validateArithmetic(_ nums: [Int]) -> Bool {
        return (nums[1] - nums[0]) == (nums[2] - nums[1])
    }
    
    func slicesNum(_ num: Int) -> Int {
        let n = num-2
        return n*(n+1)/2
    }
    
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        var result = 0
        var i = 2
        var left = 0
        while i < nums.count {
            if i - left >= 2 {
                let sub = Array(nums[i-2...i])
                let isArithmetic = validateArithmetic(sub)
                if !isArithmetic {
                    if i - left > 2 {
                        result += slicesNum(i-left)
                    }
                    left = i - 1
                }
            }
            i += 1
        }
        
        if i - left > 2 {
            result += slicesNum(i-left)
        }
        
        return result
    }
}

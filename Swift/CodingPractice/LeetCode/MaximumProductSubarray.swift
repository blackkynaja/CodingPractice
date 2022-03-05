//
//  MaximumProductSubarray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/maximum-product-subarray/
 
 Topics: Array, DP
 */

class MaximumProductSubarray {
    /*
     - The idea is that keep track to min value from negative and max value from positive that can be produced
     - Min and max will come from the maximum of [i] or [most value so far from both negative and positive]*[i]
     - Update max result at index i, max and min
     */
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var result = nums.first!
        var maxNeg = result
        var maxPos = result
        
        for i in 1..<nums.count {
            let tempMax = maxPos
            maxPos = max(nums[i], maxNeg*nums[i], maxPos*nums[i])
            maxNeg = min(nums[i], maxNeg*nums[i], tempMax*nums[i])
            result = max(result, maxPos)
        }
        
        return result
    }
}

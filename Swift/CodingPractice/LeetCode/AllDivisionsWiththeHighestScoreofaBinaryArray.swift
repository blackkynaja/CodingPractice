//
//  AllDivisionsWiththeHighestScoreofaBinaryArray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/all-divisions-with-the-highest-score-of-a-binary-array/
 
 Topics: Array
 */

class AllDivisionsWiththeHighestScoreofaBinaryArray {
    func maxScoreIndices(_ nums: [Int]) -> [Int] {
        var countZero = 0
        var countOne = 0
        var zero = [0]
        var one = Array(repeating: 0, count: nums.count+1)
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                countZero += 1
            }
            zero.append(countZero)
            
            let j = nums.count - i - 1
            if nums[j] == 1 {
                countOne += 1
            }
            one[j] = countOne
        }
        
        var sum = [Int]()
        for i in 0..<zero.count {
            sum.append(zero[i]+one[i])
        }
        
        let maxNum = sum.max()!
        
        var results = [Int]()
        for i in 0..<sum.count {
            if sum[i] == maxNum {
                results.append(i)
            }
        }
        
        return results
    }
}

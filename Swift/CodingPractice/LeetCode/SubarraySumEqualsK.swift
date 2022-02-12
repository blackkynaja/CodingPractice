//
//  SubarraySumEqualsK.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/subarray-sum-equals-k/
 
 Topics: Array, Hash Table
 */

class SubarraySumEqualsK {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sumArr = [0]
        
        for num in nums {
            sumArr.append(sumArr.last!+num)
        }
        
        var dict = [Int: Int]()
        var result = 0
        
        for num in sumArr {
            let diff = num - k
            if let value = dict[diff] {
                result += value
            }
            
            if let _ = dict[num] {
                dict[num]! += 1
            } else {
                dict[num] = 1
            }
        }
        
        return result
    }
}

//
//  4SumII.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/4sum-ii/
 
 Topics: Array, Hash Table
 */

class FourSumII {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var dict1 = [Int:Int]()
        var dict2 = [Int:Int]()

        for i in 0..<nums1.count {
            for j in 0..<nums2.count {
                let key = nums1[i] + nums2[j]
                if let _  = dict1[key] {
                    dict1[key]! += 1
                } else {
                    dict1[key] = 1
                }
            }
        }
        
        for i in 0..<nums3.count {
            for j in 0..<nums4.count {
                let key = nums3[i] + nums4[j]
                if let _  = dict2[key] {
                    dict2[key]! += 1
                } else {
                    dict2[key] = 1
                }
            }
        }
        
        var result = 0
        
        for (key, value1) in dict1 {
            let diff = key * -1
            if let value2 = dict2[diff] {
                result = result + value1*value2
            }
        }
        
        return result
    }
}

//
//  MajorityElement.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/majority-element/
 
 Topics: Array, Hash Table, Divide and Conquer, Sorting, Counting
 */

class MajorityElement {
    
    // MARK: - Sorting
    func majorityElement1(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        return sorted[nums.count/2]
    }
    
    // MARK: - Counting + Dict
    func majorityElement2(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        var result = 0
        nums.forEach {
            dict[$0] = dict[$0] == nil ? 1 : dict[$0]!+1
            if dict[$0]! > nums.count/2 {
                result = $0
            }
        }
        return result
    }
    
    // MARK: - Solution
    func majorityElement(_ nums: [Int]) -> Int {
        return majorityElement1(nums)
    }
}

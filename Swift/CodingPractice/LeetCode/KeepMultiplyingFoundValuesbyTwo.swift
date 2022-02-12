//
//  KeepMultiplyingFoundValuesbyTwo.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/keep-multiplying-found-values-by-two/
 
 Topics: Array, Hash Table, Sorting, Simulation
 */

class KeepMultiplyingFoundValuesbyTwo {
    func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
        let set = Set(nums)
        var current = original
        
        while set.contains(current) {
            current *= 2
        }
        return current
    }
}

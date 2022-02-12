//
//  ContiguousArray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/contiguous-array/
 
 Topics: Array, Hash Table
 */

class ContiguousArray {
    func findMaxLength(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        
        var dict = [Int: Int]()
        dict[0] = 0
        var current = 0
        var result = 0
        
        for (index, num) in nums.enumerated() {
            if num == 0 {
                current += 1
            } else {
                current -= 1
            }
            
            if let lastIndex = dict[current] {
                result = max(index+1-lastIndex, result)
            } else {
                dict[current] = index + 1
            }
        }
        
        return result
    }
}

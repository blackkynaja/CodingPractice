//
//  RotateArray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/rotate-array/
 
 Topics: Array, Math, Two Pointers
 */

class RotateArray {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let length = nums.count
        var i = 0
        var lastNum = nums[i]
        var set = Set<Int>()
        while set.count < nums.count {
            let next = i + k
            let index = next%length
            
            if !set.contains(index) {
                let temp = nums[index]
                nums[index] = lastNum
                lastNum = temp
                set.insert(index)
                i = index
            } else {
                i += 1
                lastNum = nums[i]
            }
        }
        
    }
}

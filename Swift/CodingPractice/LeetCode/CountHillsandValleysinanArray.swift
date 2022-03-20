//
//  CountHillsandValleysinanArray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/19/22.
//

/*
 https://leetcode.com/problems/count-hills-and-valleys-in-an-array/
 
 Topics:
 */

class CountHillsandValleysinanArray {
    func countHillValley(_ nums: [Int]) -> Int {
        var arr = [nums.first!]
        for i in 1..<nums.count {
            if nums[i] != arr.last! {
                arr.append(nums[i])
            }
        }
        
        if arr.count < 3 {
            return 0
        }
        
        var count = 0
        for i in 1..<arr.count-1 {
            if arr[i] > arr[i-1] && arr[i] > arr[i+1] {
                count += 1
            } else if arr[i] < arr[i-1] && arr[i] < arr[i+1] {
                count += 1
            }
        }
        return count
    }
}

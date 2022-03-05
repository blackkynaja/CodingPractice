//
//  SummaryRanges.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/summary-ranges/
 
 Topics: Array
 */

class SummaryRanges {
    func getRange(_ nums: [Int]) -> String {
        if nums.count == 1 {
            return String(nums.first!)
        }
        
        return "\(nums.first!)->\(nums.last!)"
    }
    
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {
            return [String]()
        }
        
        var left = 0
        var results = [String]()
        let n = nums.count
        
        for i in 1..<n {
            if nums[i]-nums[i-1] > 1 {
                let s = getRange(Array(nums[left..<i]))
                results.append(s)
                left = i
            }
        }
        
        let s = getRange(Array(nums[left..<n]))
        results.append(s)
        
        return results
    }
}

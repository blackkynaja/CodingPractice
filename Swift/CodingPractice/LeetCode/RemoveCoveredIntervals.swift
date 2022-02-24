//
//  RemoveCoveredIntervals.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/remove-covered-intervals/
 
 Topics: Array, Sorting
 */

class RemoveCoveredIntervals {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] > $1[1] }
        var results = [sorted.first!]
        
        for i in 1..<sorted.count {
            let temp = sorted[i]
            let last = results.last!
            
            if !(temp[0] >= last[0] && temp[1] <= last[1]) {
                results.append(temp)
            }
        }
        
        return results.count
    }
}

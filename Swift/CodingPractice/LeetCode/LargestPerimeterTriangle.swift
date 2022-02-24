//
//  LargestPerimeterTriangle.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/largest-perimeter-triangle/
 
 Topics: Array, Math, Greedy, Sorting
 */

class LargestPerimeterTriangle {
    func isTriangle(_ tri: (Int,Int,Int)) -> Bool {
        if tri.0 + tri.1 <= tri.2 {
            return false
        }
        if tri.1 + tri.2 <= tri.0 {
            return false
        }
        if tri.2 + tri.0 <= tri.1 {
            return false
        }
        return true
    }
    
    func largestPerimeter(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        var result = 0
        
        for i in 1..<sorted.count-1 {
            let tri = (sorted[i-1], sorted[i], sorted[i+1])
            if isTriangle(tri) {
                let perimeter = sorted[i-1] + sorted[i] + sorted[i+1]
                result = max(result, perimeter)
            }
        }
        
        return result
    }
}

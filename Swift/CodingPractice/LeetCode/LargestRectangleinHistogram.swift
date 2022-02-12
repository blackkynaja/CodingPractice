//
//  LargestRectangleinHistogram.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/largest-rectangle-in-histogram/
 
 Topics: Array, Stack, Monotonic Stack
 */

class LargestRectangleinHistogram {
    func largestRectangleArea1(_ heights: [Int]) -> Int {
        var result = 0
        
        for i in 0..<heights.count {
            var minHeight = Int.max
            for j in i..<heights.count {
                minHeight = min(minHeight, heights[j])
                let area = minHeight*(j-i+1)
                result = max(result, area)
            }
        }
        
        return result
    }
    
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        var stack = [-1]
        var currentMax = 0
        
        for i in 0..<heights.count {
            /* when found heights[i] < stack.last!, width of the height in stack[i] calculate from different between i and index in stack with height is no less than the heights[i]
            */
            while stack.last != -1 && heights[stack.last!] >= heights[i] {
                let height = heights[stack.last!]
                stack.removeLast()
                let width = i - stack.last! - 1
                let area = width * height
                currentMax = max(currentMax, area)
            }
            stack.append(i)
        }
        print(stack)
        while stack.last! != -1 {
            let height = heights[stack.last!]
            stack.removeLast()
            let width = heights.count - stack.last! - 1
            let area = width * height
            currentMax = max(currentMax, area)
            print(currentMax, width, height)
        }
        
        return currentMax
    }
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        return largestRectangleArea2(heights)
    }
}

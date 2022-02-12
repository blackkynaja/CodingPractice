//
//  KdiffPairsinanArray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/k-diff-pairs-in-an-array/
 
 Topics: Array, Hash Table, Two Pointer, Binary Search, Sorting
 */

class KdiffPairsinanArray {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var dict = [Int:Int]()
        
        nums.forEach {
            dict[$0] = dict[$0] == nil ? 1 : dict[$0]! + 1
        }
        
        dict.forEach {
            if let _ = dict[$0+k] {
                if k == 0 {
                    if $1 > 1 {
                        result += 1
                    }
                } else {
                    result += 1
                }
            }
        }
        
        return result
    }
}

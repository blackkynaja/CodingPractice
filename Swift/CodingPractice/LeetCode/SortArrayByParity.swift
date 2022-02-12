//
//  SortArrayByParity.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/sort-array-by-parity/
 
 Topics: Array, Two Pointers, Sorting
 */

class SortArrayByParity {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var results = [Int]()
        for num in nums {
            if num%2 == 0 {
                results.append(num)
            }
        }
        for num in nums {
            if num%2 == 01 {
                results.append(num)
            }
        }
        return results
    }
}

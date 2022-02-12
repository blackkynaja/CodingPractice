//
//  SortEvenandOddIndicesIndependently.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/sort-even-and-odd-indices-independently/
 
 Topics: Array, Sorting
 */

class SortEvenandOddIndicesIndependently {
    func sortEvenOdd(_ nums: [Int]) -> [Int] {
        var odds = [Int]()
        var evens = [Int]()
        var results = [Int]()
        
        for (index, value) in nums.enumerated() {
            if index%2 == 0 {
                evens.append(value)
            } else {
                odds.append(value)
            }
        }
        
        odds.sort {$0 > $1}
        evens.sort {$0 < $1}
        
        for i in 0..<nums.count {
            let index = i/2
            if i%2 == 0 {
                results.append(evens[index])
            } else {
                results.append(odds[index])
            }
        }
        return results
    }
}

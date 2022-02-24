//
//  RemovingMinimumNumberofMagicBeans.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/removing-minimum-number-of-magic-beans/
 
 Topics: Array, Sorting, Prefix Sum
 */

class RemovingMinimumNumberofMagicBeans {
    func minimumRemoval(_ beans: [Int]) -> Int {
        let arr = beans.sorted()
        var sum = beans.reduce(0, +)
        var minCount = Int.max
        var carry = 0
        
        for i in 0..<arr.count {
            let count = sum - (arr.count-i)*arr[i] + carry
            minCount = min(minCount, count)
            carry += beans[i]
            sum -= beans[i]
        }
        
        return minCount
    }
}

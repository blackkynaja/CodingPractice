//
//  SingleNumber.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/single-number/
 
 Topics: Array, Bit Manipulation
 */

class SingleNumber {
    
    // MARK: - Bit Manipulation
    /*
     - XOR all the number, the left over is a single number, hence the result
     - Use O(1) Space
     */
    func singleNumber1(_ nums: [Int]) -> Int {
        var result = 0
        
        nums.forEach {
            result = result^$0
        }
        
        return result
    }
    
    // MARK: - Dict
    func singleNumber2(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        
        nums.forEach {
            dict[$0] = dict[$0] == nil ? 1 : dict[$0]! + 1
        }
        
        for (key, value) in dict {
            if value == 1 {
                return key
            }
        }
        
        return 0
    }
    
    // MARK: - Solution
    func singleNumber(_ nums: [Int]) -> Int {
        return singleNumber2(nums)
    }
}

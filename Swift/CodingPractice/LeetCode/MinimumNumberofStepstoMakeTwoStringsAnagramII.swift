//
//  MinimumNumberofStepstoMakeTwoStringsAnagramII.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/26/22.
//

/*
 https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram-ii/
 
 Topics:
 */

class MinimumNumberofStepstoMakeTwoStringsAnagramII {
    func minSteps(_ s: String, _ t: String) -> Int {
        var dict1 = [String.Element:Int]()
        var dict2 = [String.Element:Int]()
        
        s.forEach {
            dict1[$0] = dict1[$0] == nil ? 1 : dict1[$0]!+1
        }
        t.forEach {
            dict2[$0] = dict2[$0] == nil ? 1 : dict2[$0]!+1
        }
        
        var step = 0
        
        for (key1, value1) in dict1 {
            if let value2 = dict2[key1] {
                step += abs(value1 - value2)
                dict2[key1] = nil
            } else {
                step += value1
            }
        }
        
        for (_, value2) in dict2 {
            step += value2
        }
        
        return step
    }
}

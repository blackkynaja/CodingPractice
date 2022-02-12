//
//  FindtheDifference.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/find-the-difference/
 
 Topics: Hash Table, String, Sorting, Bit Manipulation
 */

class FindtheDifference {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var dict = [String.Element: Int]()
        
        for c in t {
            if let _ = dict[c] {
                dict[c]! += 1
            } else {
                dict[c] = 1
            }
        }
        
        for c in s {
            if let _ = dict[c] {
                dict[c]! -= 1
                if dict[c]! == 0 {
                    dict[c] = nil
                }
            } else {
                return c
            }
            
        }
        
        return dict.keys.first!
    }
}

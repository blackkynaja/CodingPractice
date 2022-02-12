//
//  CountCommonWordsWithOneOccurrence.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/count-common-words-with-one-occurrence/
 
 Topics: Array, Hash Table, String, Counting
 */

class CountCommonWordsWithOneOccurrence {
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var dict1 = [String: Int]()
        var dict2 = [String: Int]()
        var result = 0
        
        words1.forEach {
            dict1[$0] = dict1[$0] == nil ? 1 : dict1[$0]! + 1
        }
        
        words2.forEach {
            dict2[$0] = dict2[$0] == nil ? 1 : dict2[$0]! + 1
        }
        
        dict1.forEach {
            if let value = dict2[$0], $1 == 1 && value == 1 {
                result += 1
            }
        }
        
        return result
    }
}

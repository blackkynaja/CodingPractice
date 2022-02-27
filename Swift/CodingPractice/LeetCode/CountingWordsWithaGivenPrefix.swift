//
//  CountingWordsWithaGivenPrefix.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/26/22.
//

/*
 https://leetcode.com/problems/counting-words-with-a-given-prefix/
 
 Topics:
 */

class CountingWordsWithaGivenPrefix {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        var count = 0
        words.forEach {
            if $0.hasPrefix(pref) {
                count += 1
            }
        }
        return count
    }
}

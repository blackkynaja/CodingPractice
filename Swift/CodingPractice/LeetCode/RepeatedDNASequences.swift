//
//  RepeatedDNASequences.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/repeated-dna-sequences/
 
 Topics: Hash Table, String, Bit Manipulation, Sliding Window, Rolling Hash, Hash Function
 */

class RepeatedDNASequences {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let arrS = Array(s)
        let n = arrS.count
        
        if n < 10 {
            return [String]()
        }
        
        var set = Set<String>()
        var results = Set<String>()
        
        for i in 10...n {
            let sub = String(arrS[i-10..<i])
            if set.contains(sub) {
                results.insert(sub)
            }
            set.insert(sub)
        }
        
        return Array(results)
    }
}

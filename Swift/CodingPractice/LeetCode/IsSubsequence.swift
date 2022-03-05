//
//  IsSubsequence.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/is-subsequence/
 
 Topics: Two Pointers, String, DP
 */

class IsSubsequence {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var i = 0
        let arr = Array(s)
        
        for c in t {
            if i >= arr.count { return true }
            if c == arr[i] {
                i += 1
            }
        }
        
        return i == arr.count
    }
}

//
//  CountingBits.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/counting-bits/
 
 Topics: DP, Bit Manipulation
 */

class CountingBits {
    func countBits(_ n: Int) -> [Int] {
        if n < 2 {
            return n == 0 ? [0] : [0,1]
        }
        
        var results = [0,1]
        
        for i in 2...n {
            let result = results[i/2] + i%2
            results.append(result)
        }
        return results
    }
}

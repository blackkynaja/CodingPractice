//
//  ClimbingStairs.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/climbing-stairs/
 
 Topics: Math, DP, Memoization
 */

class ClimbingStairs {
    // MARK: - Recursive + Memoization
    var memo = [Int:Int]()
    func climbStairs1(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        if let value = memo[n] {
            return value
        }
        memo[n] = climbStairs1(n-1) + climbStairs1(n-2)
        return memo[n]!
    }
    
    // MARK: - DP O(n) Space
    func climbStairs2(_ n: Int) -> Int {
        var dp = [1,2]
        if n <= 2 {
            return dp[n-1]
        }
        
        for i in 2..<n {
            dp.append(dp[i-1] + dp[i-2])
        }
        return dp[n-1]
    }
    
    // MARK: - DP O(1) Space
    func climbStairs3(_ n: Int) -> Int {
        var n1 = 1
        var n2 = 2
        if n <= 2 {
            return n == 1 ? 1 : 2
        }
        
        for i in 3...n {
            let temp = n1 + n2
            if i%2 != 0 {
                n1 = temp
            } else {
                n2 = temp
            }
        }
        return n%2 != 0 ? n1 : n2
    }
    
    // MARK: - Solution
    func climbStairs(_ n: Int) -> Int {
        return climbStairs1(n)
    }
}

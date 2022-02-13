//
//  PalindromeNumber.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/palindrome-number/
 
 Topics: Math
 */

class PalindromeNumber {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        let s = String(x)
        return s == String(s.reversed())
    }
}

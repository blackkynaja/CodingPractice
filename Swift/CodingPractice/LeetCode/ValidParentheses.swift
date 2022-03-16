//
//  ValidParentheses.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/15/22.
//

/*
 https://leetcode.com/problems/valid-parentheses/
 
 Topics: String, Stack
 */

class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        var stack = [String.Element]()
        
        for c in s {
            if c == "(" || c == "{" || c == "[" {
                stack.append(c)
            } else {
                if let value = stack.last {
                    let key = c == ")" ? "(" : c == "}" ? "{" : "["

                    if value != Character(key) {
                        return false
                    } else {
                        stack.removeLast()
                    }
                } else {
                    return false
                }
            }
        }
        
        return stack.count == 0
    }
}

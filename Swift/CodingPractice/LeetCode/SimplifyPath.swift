//
//  SimplifyPath.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/19/22.
//

/*
 https://leetcode.com/problems/simplify-path/
 
 Topics: String, Stack
 */

class SimplifyPath {
    func simplifyPath(_ path: String) -> String {
        let arr = path.components(separatedBy: "/")
        var stack = [String]()
        
        for s in arr {
            if s == "" || s == "." {
                continue
            }
            if s == ".." {
                if stack.count > 0 {
                    stack.removeLast()
                }
                continue
            }
            stack.append(s)
        }
        
        return "/" + stack.joined(separator: "/")
    }
}

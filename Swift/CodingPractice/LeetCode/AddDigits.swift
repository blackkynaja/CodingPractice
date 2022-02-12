//
//  AddDigits.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/add-digits/
 
 Topics: Simulation
 */

class AddDigits {
    func addDigits(_ num: Int) -> Int {
        var result = Array(String(num))
        
        while result.count > 1 {
            var temp = 0
            for c in result {
                temp = temp + Int(String(c))!
            }
            result = Array(String(temp))
        }
        return Int(String(result))!
    }
}

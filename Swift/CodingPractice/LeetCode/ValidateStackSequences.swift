//
//  ValidateStackSequences.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/15/22.
//

/*
 https://leetcode.com/problems/validate-stack-sequences/
 
 Topics: Array, Stack, Simulation
 */

class ValidateStackSequences {
    func validateStackSequences1(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var arr = pushed
        var i = 0
        var prevIndex: Int?
        
        while i < popped.count {
            let index = arr.firstIndex(of: popped[i])!
            
            if let p = prevIndex {
                if index < p - 1 {
                    return false
                }
            }
            
            prevIndex = index
            i += 1
            arr.remove(at: index)
        }
        return true
    }
    
    func validateStackSequences2(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var arr = [Int]()
        var i = 0
        
        for num in pushed {
            arr.append(num)
            
            while arr.count > 0, i < popped.count, arr.last! == popped[i] {
                i += 1
                arr.removeLast()
            }
        }
        return i == popped.count
    }
    
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        return validateStackSequences1(pushed, popped)
    }
}

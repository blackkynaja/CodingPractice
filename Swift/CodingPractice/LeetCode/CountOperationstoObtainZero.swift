//
//  CountOperationstoObtainZero.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/count-operations-to-obtain-zero/
 
 Topics: Math, Simulation
 */

class CountOperationstoObtainZero {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        if num1 == 0 && num2 == 0 {
            return 0
        }
        if num1 == 0 || num2 == 0 {
            return 0
        }
        var minNum = min(num1, num2)
        var maxNum = max(num1, num2)
        var count = 0
        
        while minNum != 0 {
            count += 1
            let temp = maxNum - minNum
            maxNum = max(temp, minNum)
            minNum = min(temp, minNum)
        }
        return count
    }
}

//
//  RichestCustomerWealth.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/richest-customer-wealth/
 
 Topics: Array, Matrix
 */

class RichestCustomerWealth {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var result = 0
        accounts.forEach {
            result = max(result, $0.reduce(0,+))
        }
        return result
    }
}

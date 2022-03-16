//
//  CountAllValidPickupandDeliveryOptions.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/15/22.
//

/*
 https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/
 
 Topics: Math, DP, Combinators
 */

class CountAllValidPickupandDeliveryOptions {
    // MARK: - Probability
    /*
     - Probability = (2N)!/2^N
     */
    func factorial(_ n: Int) -> Int {
        var result = 1
        for i in 2...n {
            result *= i
            if i%2 == 0 {
                result /= 2
            }
            result %= 1000000007
        }
        return result
    }
    
    func countOrders1(_ n: Int) -> Int {
        let fac = factorial(n*2)
        return fac
    }
    
    // MARK: - MATH
    /*
     - We have 2N slot of ways
     - Each round divide to two possible way,First will has N ways (only pickup) and Second will have 2N - 1 ways (both pick up and delivery but remove one pickup)
     */
    func countOrders2(_ n: Int) -> Int {
        var result = 1
        var i = n
        
        while i >= 1 {
            result *= i*(2*i - 1)
            result %= 1000000007
            i -= 1
        }
        return result
    }
    
    func countOrders(_ n: Int) -> Int {
        return countOrders2(n)
    }
}

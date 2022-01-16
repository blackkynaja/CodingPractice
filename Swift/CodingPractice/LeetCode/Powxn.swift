/*
 https://leetcode.com/problems/powx-n/
 
 Topics: Math, Recursion
 */

class Powxn {
    func myPowHelper(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        let product = myPowHelper(x,n/2)
        
        if n%2 == 0{
            return product*product
        } else {
            return product*product*x
        }
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        
        let i = abs(n)
        let result = n > 0 ? x : 1/x
        
        return myPowHelper(result, i)
    }
}

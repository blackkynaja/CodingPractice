/*
 https://leetcode.com/problems/fibonacci-number/
 */

class FibonacciNumber {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        
        var arr = [Int](repeating: -1, count: n+1)
        arr[0] = 0
        arr[1] = 1

        return generateFibonacciHelper(n, &arr)
    }

    func generateFibonacciHelper(_ n: Int, _ arr: inout [Int]) -> Int {
        if arr[n] != -1 {
            return arr[n]
        }

        arr[n] = generateFibonacciHelper(n-1, &arr)+generateFibonacciHelper(n-2, &arr)
        return arr[n]
    }
}

/*
 https://leetcode.com/problems/consecutive-numbers-sum/
 */

class ConsecutiveNumbersSum {
    func sumToNum(_ num: Int) -> Int {
        return num*(num+1)/2
    }
    
    func consecutiveNumbersSum(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        var count = 1
        let limit = Int(Double(2*n).squareRoot())
        for i in 2...limit {
            let sum = sumToNum(i-1)
            if (n-sum)%i == 0 {
                count+=1
            }
        }

        return count
    }
}

/*
 https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/
 */

class NumberofDiceRollsWithTargetSum {
    func numRollsToTarget(_ d: Int, _ f: Int, _ target: Int) -> Int {
        let size = d*f
        if target > size {
            return 0
        }
        var array = [Int](repeating: 0, count: size+1)
        
        for i in 1...d {
            let temp = array
            for j in i...i*f {
                if i == 1 {
                    array[j] = 1
                } else {
                    var sum = 0
                    for index in 1...f {
                        let diff = j-index
                        if diff > 0 && diff >= i-1 {
                            sum+=temp[diff]
                        }
                    }
                    array[j] = sum%1000000007
                }
            }
        }
        
        return array[target]
    }
}

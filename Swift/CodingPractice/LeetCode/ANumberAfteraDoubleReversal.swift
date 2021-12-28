/*
 https://leetcode.com/problems/a-number-after-a-double-reversal/
 */

class ANumberAfteraDoubleReversal {
    func isSameAfterReversals(_ num: Int) -> Bool {
        if num/10 == 0 {
            return true
        }
        
        return num%10 != 0
    }
}

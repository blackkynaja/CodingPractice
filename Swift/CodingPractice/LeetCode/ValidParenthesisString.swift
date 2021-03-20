/*
 https://leetcode.com/problems/valid-parenthesis-string/
 */

class ValidParenthesisString {
    func checkValidString(_ s: String) -> Bool {
        var left = false
        var right = false
        
        // Left side
        var countBK = 0
        var countASK = 0
        
        for c in s {
            if (c == "(") {
                countBK+=1
            } else if (c == ")") {
                if (countBK == 0 && countASK == 0) {
                    return false
                }
                if (countBK > 0) {
                    countBK-=1
                } else {
                    countASK-=1
                }
                
            } else {
                countASK+=1
            }
        }
        
        if (countBK == 0 || countASK >= countBK) {
            left = true
        }
        
        // Right side
        countBK = 0
        countASK = 0
        let reversedS = String(s.reversed())
        
        for c in reversedS {
            if (c == ")") {
                countBK+=1
            } else if (c == "(") {
                if (countBK == 0 && countASK == 0) {
                    return false
                }
                if (countBK > 0) {
                    countBK-=1
                } else {
                    countASK-=1
                }
                
            } else {
                countASK+=1
            }
        }
        
        if (countBK == 0 || countASK >= countBK) {
            right = true
        }
        
        return left && right
    }
}

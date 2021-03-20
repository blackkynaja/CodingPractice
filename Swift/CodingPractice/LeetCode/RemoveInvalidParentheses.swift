/*
 https://leetcode.com/problems/remove-invalid-parentheses/
 */
class RemoveInvalidParentheses {
    func isValidParentheses(_ s: String) -> Bool {
        var left = 0
        var right = 0
        for c in s {
            if c == "(" {
                left+=1
            } else if c == ")" {
                right+=1
            }
            if right > left {
                return false
            }
        }
        
        return left == right
    }
    
    func removeInvalidParentheses(_ s: String) -> [String] {
        if isValidParentheses(s) {
            return [s]
        }
        
        var queues = [s]
        var results = Set<String>()
        while results.count == 0 {
            var nextQueue = Set<String>()
            for item in queues {
                let arrResult = Array(item)
                for i in 0..<item.count {
                    var temp = String()
                    if i > 0 {
                        let leftString = arrResult[0...i-1]
                        temp.append(String(leftString))
                    }
                    if i < arrResult.count-1 {
                        let rightString = arrResult[i+1...arrResult.count-1]
                        temp.append(String(rightString))
                    }
                    
                    nextQueue.insert(temp)
                    if isValidParentheses(temp) {
                        results.insert(temp)
                    }
                }
            }
            
            queues = Array(nextQueue)
        }
        
        return Array(results)
    }
}



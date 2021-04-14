/*
 https://leetcode.com/problems/longest-valid-parentheses/
 */

class LongestValidParentheses {
    //MARK: - Brute Force
    func validateParenteses(_ start: Int, _ s: [String.Element]) -> Int {
        var result = 0
        var count = 0
        var stack = [String.Element]()
        for i in start..<s.count {
            if s[i] == "(" {
                stack.append(s[i])
                count+=1
            } else {
                if stack.count > 0 {
                    stack.removeLast()
                    count+=1
                    if stack.count == 0 {
                        result = count
                    }
                } else {
                    return result
                }
            }
        }
        
        return result
    }
    
    func longestValidParenthesesBF(_ s: String) -> Int {
        let arrS = Array(s)
        var max = 0
        for i in 0..<arrS.count {
            let result = validateParenteses(i, arrS)
            if result > max {
                max = result
            }
        }
        
        var s = [String.Element]()
        s.append(contentsOf: String(repeatElement(" ", count: 4)))
        s.append(contentsOf: String(repeatElement("X", count: 4)))
        
        return max
    }
    
    // MARK: - Interval
    func culmulativeParentheses(_ s: [String.Element]) -> [(Int, Int, Int)] {
        var results = [(Int, Int, Int)]()
        var queue = [Int]()
        
        for i in 0..<s.count {
            if i > 0 {
                let last = results[i-1]
                if s[i] == "(" {
                    queue.append(i)
                    results.append((last.0+1, -1,-1))
                } else {
                    if last.0 > 0 {
                        results.append((last.0-1, queue.last!, i))
                        queue.removeLast()
                    } else {
                        results.append((last.0, -1, -1))
                    }
                }
            } else {
                if s[i] == "(" {
                    queue.append(i)
                    results.append((1,-1,-1))
                } else {
                    results.append((0,-1,-1))
                }
            }
        }
        
        return results
    }
    
    func longestLength(results: [(Int, Int, Int)]) -> Int {
        var ranges = [(Int, Int)]()
        for result in results {
            if result.1 != -1 && result.2 != -1 {
                if ranges.count == 0 {
                    ranges.append((result.1,result.2))
                } else {
                    let last = ranges.last!
                    if last.1+1 >= result.1 {
                        let newRange = (min(last.0, result.1), max(last.1, result.2))
                        ranges.removeLast()
                        ranges.append(newRange)
                    } else {
                        ranges.append((result.1,result.2))
                    }
                }
            }
        }
        
        if ranges.count == 0 {
            return 0
        }
        
        ranges.sort(by: {$0.0 < $1.0})
        
        // Merge Interval
        var merged = [ranges[0]]
        for i in 1..<ranges.count {
            let last = merged.last!
            if last.1+1 >= ranges[i].0 {
                let newRange = (min(last.0, ranges[i].0), max(last.1, ranges[i].1))
                merged[merged.count-1] = newRange
            } else {
                merged.append(ranges[i])
            }
        }
        
        // Find Max Interval
        var maxLength = 0
        for merged in merged {
            let length = merged.1 - merged.0+1
            if length > maxLength {
                maxLength = length
            }
        }
        
        return maxLength
    }
    
    func longestValidParenthesesInterval(_ s: String) -> Int {
        let arrS = Array(s)
        let results = culmulativeParentheses(arrS)
        return longestLength(results: results)
    }
    
    // MARK: - Stack
    func longestValidParenthesesStack(_ s: String) -> Int {
        var stack = [-1]
        let arrS = Array(s)
        var maxLength = 0
        for (index, value) in arrS.enumerated() {
            if (value == "(") {
                stack.append(index)
            } else {
                stack.removeLast()
                if stack.count > 0 {
                    if let last = stack.last {
                        let diff = index - last
                        if maxLength < diff {
                            maxLength = diff
                        }
                    }
                } else {
                    stack.append(index)
                }
            }
            print(stack)
        }
        
        return maxLength
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        return longestValidParenthesesStack(s)
    }
}

/*
 https://leetcode.com/problems/palindrome-partitioning/
 
 Topics: String, DP, Backtracking
 */

class PalindromePartitioning {
    
    func isPalindrome(_ s: [String.Element]) -> Bool {
        return s == s.reversed()
    }
    
    // MARK: - Backtracking
    func partitionHelper(_ s: [String.Element], _ left: Int, _ tempResults: inout [String], _ results: inout [[String]]) {
        
        if left >= s.count {
            results.append(tempResults)
            return
        }
        
        for i in left..<s.count {
            let temp = Array(s[left...i])
            if isPalindrome(temp) {
                tempResults.append(String(temp))
                partitionHelper(s, i+1, &tempResults, &results)
                tempResults.removeLast()
            }
        }
    }
    
    // MARK: - DP
    var dp = [[Bool]]()
    
    func dpHelper(_ s: [String.Element], _ left: Int, _ tempResults: inout [String], _ results: inout [[String]]) {
        
        if left >= s.count {
            results.append(tempResults)
            return
        }
        
        for i in left..<s.count {
            if s[i] == s[left] && (i - left <= 2 || dp[left+1][i-1])  {
                dp[left][i] = true
                tempResults.append(String(s[left...i]))
                dpHelper(s, i+1, &tempResults, &results)
                tempResults.removeLast()
            }
            
        }
    }
    
    // MARK: - Solution
    func partition(_ s: String) -> [[String]] {
        var results = [[String]]()
        var tempResults = [String]()
        dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        partitionHelper(Array(s), 0, &tempResults, &results)
        return results
    }
}

/*
aabbaa
*/

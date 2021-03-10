/*
 https://leetcode.com/problems/longest-palindrome/
 */

class LongestPalindrome {
    func longestPalindrome(_ s: String) -> Int {
        var dict = [String.Element:Int]()
        
        for stringElement in s {
            if let _ = dict[stringElement] {
                dict[stringElement]!+=1
            } else {
                dict[stringElement] = 1
            }
        }
        
        var length = 0
        var isOdd = false
        for (_, value) in dict {
            if value%2 == 0 {
                length += value
            } else {
                length += value - 1
                isOdd = true
            }
        }
        
        if isOdd {
            length+=1
        }
        
        return length
    }
}

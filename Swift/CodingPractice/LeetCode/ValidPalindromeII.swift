/*
 https://leetcode.com/problems/valid-palindrome-ii/
 */

class ValidPalindromeII {
    func isPalindrome(_ s: [String.Element], _ start: Int, _ end: Int) -> Bool {
        var left = start
        var right = end
        
        while (left < right) {
            if (s[left] != s[right]) {
                return false
            }
            left+=1
            right-=1
        }
        
        return true
    }
    
    func validPalindrome(_ s: String) -> Bool {
        var left = 0
        var right = s.count-1
        let arrS = Array(s)
        while (left < right) {
            if (arrS[left] != arrS[right]) {
                return isPalindrome(arrS, left+1, right) || isPalindrome(arrS, left, right-1)
            }
            left+=1
            right-=1
        }
        
        return true
    }
}

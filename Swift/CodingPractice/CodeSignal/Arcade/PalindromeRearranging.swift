/*
 Given a string, find out if its characters can be rearranged to form a palindrome.

 Example

 For inputString = "aabb", the output should be
 palindromeRearranging(inputString) = true.

 We can rearrange "aabb" to make "abba", which is a palindrome.
 
 https://app.codesignal.com/arcade/intro/level-4/Xfeo7r9SBSpo3Wico
 */

func palindromeRearranging(inputString: String) -> Bool {
    var dict = [String.Element: Int]()
    for s in inputString {
        if let _ = dict[s] {
            dict[s]! += 1
        } else {
            dict[s] = 1
        }
    }
    
    var isFoundOdd = false
    for (_, value) in dict {
        if value%2 != 0 {
            if isFoundOdd {
                return false
            }
            
            isFoundOdd = true
        }
    }
    
    return true
}

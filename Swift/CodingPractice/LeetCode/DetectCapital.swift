/*
 https://leetcode.com/problems/detect-capital/
 
 Topics: String
 */

class DetectCapital {
    func detectCapitalUse(_ word: String) -> Bool {
        var count = 0
        
        word.forEach {
            if $0.isUppercase {
                count += 1
            }
        }
        
        if count == word.count || count == 0 {
            return true
        }
        
        return count == 1 && word.first!.isUppercase
    }
}

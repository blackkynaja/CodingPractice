/*
 https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/
 
 Topics: Hash Table, String
 */

class MinimumNumberofStepstoMakeTwoStringsAnagram {
    func minSteps(_ s: String, _ t: String) -> Int {
        var dictS = [String.Element: Int]()
        var dictT = [String.Element: Int]()
        
        for c in s {
            if let _ = dictS[c] {
                dictS[c]! += 1
            } else {
                dictS[c] = 1
            }
        }
        
        for c in t {
            if let _ = dictT[c] {
                dictT[c]! += 1
            } else {
                dictT[c] = 1
            }
        }
        
        var sameCharCount = 0
        for key in dictS.keys {
            let numS = dictS[key]!
            var numT = 0
            
            if let num = dictT[key] {
                numT = num
            }
            
            sameCharCount += min(numS, numT)
        }
        
        return s.count - sameCharCount
    }
}

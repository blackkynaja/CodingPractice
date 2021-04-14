/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 */

class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s)
        var i = 0
        var last = 0
        var tempDict = [String.Element:Int]()
        var len = 0
        
        while i < arr.count {
            if let c = tempDict[arr[i]] {
                if len < i - last {
                    len = i - last
                }
                last = c+1
                i = last
                tempDict = [String.Element:Int]()
            } else {
                tempDict[arr[i]] = i
                i+=1
            }
        }
        
        if len < i - last {
            len = i - last
        }
        
        return len
    }
}

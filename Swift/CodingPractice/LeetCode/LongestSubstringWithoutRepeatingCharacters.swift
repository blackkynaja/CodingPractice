/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 */

class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring1(_ s: String) -> Int {
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
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        let arr = Array(s)
        var i = 0
        var j = 0
        var tempDict = [String.Element:Int]()
        var len = 0
        
        while j < arr.count {
            if let c = tempDict[arr[j]] {
                i = max(c+1,i)
            }
            len = max(len, j-i+1)
            tempDict[arr[j]] = j
            j+=1
        }
        
        return len
    }
    
    // O(n^2)
    func lengthOfLongestSubstring3(_ s: String) -> Int {
        var result = 0
        let arr = Array(s)
        
        for i in 0..<s.count {
            var dict = Set<String.Element>()
            for j in i..<s.count {
                if dict.contains(arr[j]) { break }
                dict.insert(arr[j])
                result = max(result, dict.count)
            }
        }
        
        return result
    }
}

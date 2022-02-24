/*
 https://leetcode.com/problems/permutation-in-string/
 */

class PermutationinString {
    func isSamePermutation(_ s1: String,_ s2: String,_ index: inout Int) -> Bool {
        var dict = [String.Element: Int]()
        var lastFalseIndex = 0
        
        for s in s1 {
            if let _ = dict[s] {
                dict[s]!+=1
            } else {
                dict[s] = 1
            }
        }
        
        let arrS2 = Array(s2)
        var isPermutation = true
        for (i, s) in arrS2.enumerated() {
            if let value = dict[s] {
                if (value > 0) {
                    dict[s]!-=1
                } else {
                    isPermutation = false
                }
            } else {
                lastFalseIndex = i
                isPermutation = false
            }
        }
        
        var gap = 0
        for (_, value) in dict {
            gap+=value
        }
        
        index = max(lastFalseIndex, gap)
        
        return isPermutation
    }
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dict = [String.Element: Int]()
        
        for s in s1 {
            if let _ = dict[s] {
                dict[s]!+=1
            } else {
                dict[s] = 1
            }
        }
        
        let arrS2 = Array(s2)
        var index = 0
        while (index <= s2.count-s1.count) {
            let s = arrS2[index]
            if let _ = dict[s] {
                var gap = 0
                let isFound = isSamePermutation(s1, String(arrS2[index..<index+s1.count]), &gap)
                if (isFound) {
                    return true
                }
                index+=gap
            } else {
                index+=1
            }
        }
        
        return false
    }
}

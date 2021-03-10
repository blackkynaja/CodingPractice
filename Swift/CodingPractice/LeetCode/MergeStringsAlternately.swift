/*
 https://leetcode.com/problems/merge-strings-alternately/
 */
class MergeStringsAlternately {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var s = ""
        var i = 0
        
        let a1 = Array(word1)
        let a2 = Array(word2)
        
        for (index, _) in Array(a1).enumerated() {
            if index < a1.count && index < a2.count {
                s+=String(a1[index])
                s+=String(a2[index])
            } else {
                if index < a1.count {
                    s+=String(a1[index])
                }
                if index < a2.count {
                    s+=String(a2[index])
                }
            }
            i = index
        }
        
        if i < a2.count-1 {
            s+=String(a2[i...a2.count-1])
        }
        
        return s
    }
}

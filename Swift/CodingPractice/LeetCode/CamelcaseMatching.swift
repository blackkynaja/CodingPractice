/*
 https://leetcode.com/problems/camelcase-matching/
 */

class CamelcaseMatching {
    func isValidPattern(_ s: String,_ pattern: String) -> Bool {
        var indexP = 0
        let arrP = Array(pattern)
        
        for c in s {
            if (c.isUppercase) {
                if (indexP == pattern.count) {
                    return false
                }
                if (c != arrP[indexP]) {
                    return false
                }
                indexP+=1
            } else {
                if indexP < arrP.count {
                    if (c == arrP[indexP]) {
                        indexP+=1
                    }
                }
            }
        }
        return indexP == pattern.count
    }
    
    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
        var results = [Bool]()
        
        for s in queries {
            results.append(isValidPattern(s, pattern))
        }
        
        return results
    }
}

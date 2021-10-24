/*
 https://leetcode.com/problems/repeated-substring-pattern/
 */

class RepeatedSubstringPattern {
    func sameStringByLength(_ arr: [String.Element], _ length: Int) -> Bool {
        let first = Array(arr[0..<length])
        for i in stride(from: length, to: arr.count, by: length) {
            let temp = Array(arr[i..<i+length])
            if first != temp {
                return false
            }
        }
        
        return true
    }
    
    func repeatedSubstringPattern(_ s: String) -> Bool {
        if s.count == 1 {
            return false
        }
        
        let arrS = Array(s)
        for i in 1...arrS.count/2 {
            if arrS.count%i==0 {
                if sameStringByLength(arrS, i) {
                    return true
                }
            }
        }
        
        return false
    }
}

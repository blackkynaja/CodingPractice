/*
 https://leetcode.com/problems/decode-ways/
 */

class DecodeWays {
    
    func numDecodingsHelper(_ s: String, _ index: Int, _ array: inout [Int]) -> Int {
        
        if index == s.count {
            return 1
        }
        if Array(s)[index] == "0" {
            return 0
        }
        if array[index] != -1 {
            return array[index]
        }
        
        var result = numDecodingsHelper(s, index+1, &array)
        if index < s.count-1 {
            if let twoDigit = Int(String(Array(s)[index])+String(Array(s)[index+1])) {
                if twoDigit <= 26 {
                    result += numDecodingsHelper(s, index+2, &array)
                }
            }
            
        }
        array[index] = result
        return result
    }

    func numDecodings(_ s: String) -> Int {
        var array = [Int](repeating: -1, count: s.count)
        return numDecodingsHelper(s, 0, &array)
    }
    
}

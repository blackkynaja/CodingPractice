/*
 https://leetcode.com/problems/string-to-integer-atoi/
 
 Topics: String
 */

class StringtoIntegeratoi {
    func myAtoi(_ s: String) -> Int {
        let arr = Array(s)
        var i = 0
        var sign = 1
        var digit = 1
        var result = 0
        
        while i < arr.count, arr[i] == " " {
            i+=1
        }
        
        if i >= arr.count {
            return 0
        }
        
        if arr[i] == "-" || arr[i] == "+" {
            if arr[i] == "-" {
                sign = -1
            }
            i += 1
        }
        
        while i < arr.count, arr[i].isNumber {
            result *= digit
            result += Int(String(arr[i]))!
            digit = 10
            i+=1
            
            if result > Int32.max {
                return sign == -1 ? Int(Int32.min) : Int(Int32.max)
            }
        }
        
        return result * sign
    }
}

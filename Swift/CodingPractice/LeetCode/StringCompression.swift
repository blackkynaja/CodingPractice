/*
 https://leetcode.com/problems/string-compression/
 */

class StringCompression {
    func manipulated(_ chars: inout [Character], _ tempCharIndex: Int, _ length: Int) {
        let count = length-1
        let numString = String(length)
        (0..<count).forEach { _ in
            chars.remove(at: tempCharIndex+1)
        }
        for (index, s) in numString.enumerated() {
            chars.insert(s, at:tempCharIndex+1+index)
        }
    }
    
    func compress(_ chars: inout [Character]) -> Int {
        var length = 1
        var i = 1
        var tempChar = chars.first!
        var tempCharIndex = 0
        
        while (i < chars.count) {
            if chars[i] != tempChar {
                if length > 1 {
                    let numString = String(length)
                    manipulated(&chars, tempCharIndex, length)
                    tempCharIndex = tempCharIndex + numString.count + 1
                    i = tempCharIndex
                    length = 0
                } else {
                    tempCharIndex = i
                    length = 1
                    i+=1
                }
                
                if tempCharIndex < chars.count {
                    tempChar = chars[tempCharIndex]
                }
            } else {
                length+=1
                i+=1
            }
        }
        
        if length > 1 {
            manipulated(&chars, tempCharIndex, length)
        }
        
        return chars.count
    }
}

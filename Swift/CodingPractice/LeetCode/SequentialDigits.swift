/*
 https://leetcode.com/problems/sequential-digits/
 
 Topics: Enumeration
 */

import Foundation

class SequentialDigits {
    func getSequentialNumbers(_ l: Int, _ h: Int, _ results: inout [Int]) {
        let low = Array(String(l))
        let length = low.count
        let bound = 10 - length
        
        let startingValue = Int(("0" as UnicodeScalar).value)
        
        for i in 1...bound {
            var s = [String.Element]()
            var currentValue = i
            s.append(Character(UnicodeScalar(currentValue + startingValue)!))
            for _ in 1..<length {
                currentValue += 1
                s.append(Character(UnicodeScalar(currentValue + startingValue)!))
            }
             let value = Int(String(s))!
            if value >= l && value <= h {
                results.append(value)
            }
        }
    }
    
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var results = [Int]()
        let lowS = String(low)
        var digit = lowS.count-1
        var lowBound = max(Int(pow(Double(10),Double(digit))), low)
        var highBound = min(10*lowBound, high)
        let maxNum: Int = Int(pow(Double(10),Double(9)))
        while lowBound < high && lowBound <= maxNum {
            getSequentialNumbers(lowBound, highBound, &results)
            digit += 1
            lowBound = Int(pow(Double(10),Double(digit)))
            highBound = min(10*lowBound, high)
        }
        return results
    }
}

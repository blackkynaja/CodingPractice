//
//  ConstructStringWithRepeatLimit.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/construct-string-with-repeat-limit/
 
 Topics: String, Greedy, Heap, Counting
 */

class ConstructStringWithRepeatLimit {
    func generateCharArr(_ s: String) -> [Int] {
        var arr = [Int](repeating: 0, count: 26)
        for c in s {
            let index = Int(c.asciiValue!) - 97
            arr[index] += 1
        }
        return arr
    }
    
    func getLargestAvailableIndex(_ arr: [Int], _ startIndex: Int) -> Int {
        var start = startIndex
        while start >= 0 {
            if arr[start] != 0 {
                return start
            }
            start -= 1
        }
        // print(arr)
        return -1
    }
    
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var arr = generateCharArr(s)
        let length = s.count
        var repeatCount = 0
        var results = [String.Element]()
        var charIndex = getLargestAvailableIndex(arr, arr.count-1)
        
        while results.count < length, charIndex >= 0 {
            let char = Character(UnicodeScalar(charIndex+97)!)
            
            if results.count > 0 {
                if char != results.last! {
                    repeatCount = 0
                }
            }
            
            // print(results, repeatCount)
            
            if repeatCount >= repeatLimit {
                let nextCharIndex = getLargestAvailableIndex(arr, charIndex - 1)
                if nextCharIndex != -1 {
                    let nextChar = Character(UnicodeScalar(nextCharIndex+97)!)
                    results.append(nextChar)
                    arr[nextCharIndex] -= 1
                    repeatCount = 1
                } else {
                    break
                }
            } else {
                results.append(char)
                arr[charIndex] -= 1
                repeatCount += 1
            }

            charIndex = getLargestAvailableIndex(arr, charIndex)
        }
        
        return String(results)
        
    }
}

//
//  FindAllAnagramsinaString.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/find-all-anagrams-in-a-string/
 
 Topics: Hash Table, String, Sliding Window
 */

class FindAllAnagramsinaString {
    func getArrayChar(_ s: [String.Element]) -> [Int] {
        var arr = [Int](repeating: 0, count: 26)
        
        for c in s {
            let index = Int(c.asciiValue!) - 97
            arr[index] += 1
        }
        return arr
    }
    
    func isAnagram(_ arr1: [Int], _ arr2: [Int]) -> Bool {
        for i in 0..<arr1.count {
            if arr1[i] != arr2[i] {
                return false
            }
        }
        return true
    }
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if p.count > s.count {
            return [Int]()
        }
        
        let arrString = Array(s)
        var results = [Int]()
        let arrP = getArrayChar(Array(p))
        var left = 0
        var right = left + p.count - 1
        var arrS = getArrayChar(Array(arrString[0...right]))
        let length = arrString.count
        
        while right <= length {
            if isAnagram(arrP, arrS) {
                results.append(left)
            }
            
            left += 1
            right += 1
            if right >= length {
                break
            }
            
            let indexPrev = Int(arrString[left - 1].asciiValue!) - 97
            let indexNext = Int(arrString[right].asciiValue!) - 97
            arrS[indexPrev] -= 1
            arrS[indexNext] += 1
        }
        
        return results
    }
}

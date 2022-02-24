//
//  RemoveKDigits.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/remove-k-digits/
 
 Topics: String, Stack, Greedy, Motonoic Stack
 */

class RemoveKDigits {
    func findRemovedIndex(_ arr: [String.Element]) -> Int {
        var index = 0
        
        for i in 1..<arr.count {
            if arr[i].wholeNumberValue! < arr[i-1].wholeNumberValue! {
                break
            }
            index = i
        }
        
        return index
    }
    
    func removeZeroPrefix(_ arr: [String.Element]) -> [String.Element] {
        var i = 0
        while i < arr.count, arr[i].wholeNumberValue! == 0 {
            i += 1
        }
        return i < arr.count ? Array(arr[i..<arr.count]) : ["0"]
    }
    
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var arr = Array(num)
        if arr.count == k {
            return "0"
        }
        
        var i = 0
        while i < k {
            let index = findRemovedIndex(arr)
            arr.remove(at: index)
            i += 1
        }
        
        arr = removeZeroPrefix(arr)
        
        return String(arr)
    }
}

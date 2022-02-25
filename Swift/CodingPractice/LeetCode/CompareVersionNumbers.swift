//
//  CompareVersionNumbers.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/compare-version-numbers/
 
 Topics: Two Pointers, String
 */

class CompareVersionNumbers {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let arr1 = version1.components(separatedBy: ".")
        let arr2 = version2.components(separatedBy: ".")
        
        var i = 0
        
        while i < arr1.count || i < arr2.count {
            let temp1 = i < arr1.count ? Int(arr1[i])! : 0
            let temp2 = i < arr2.count ? Int(arr2[i])! : 0
            if temp1 > temp2 {
                return 1
            } else if temp1 < temp2 {
                return -1
            }
            i += 1
        }
        
        return 0
    }
}

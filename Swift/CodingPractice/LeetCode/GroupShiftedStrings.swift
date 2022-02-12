//
//  GroupShiftedStrings.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/group-shifted-strings/
 
 Topics: Array, Hash Table, String
 */

class GroupShiftedStrings {
    func groupKey(_ s: String) -> String {
        if s.count == 1 {
            return "-1"
        }
        
        let arr = Array(s)
        var key = ""
        for i in 1..<arr.count {
            var diff = Int(arr[i].asciiValue!) - Int(arr[i-1].asciiValue!)
            if diff < 0 {
                diff = 26+diff
            }
            key.append(String("\(diff):"))
        }
        return key
    }
    func groupStrings(_ strings: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for string in strings {
            let key = groupKey(string)
            if let _ = dict[key] {
                dict[key]!.append(string)
            } else {
                dict[key] = [string]
            }
        }
        return dict.values.map{$0}
    }
}

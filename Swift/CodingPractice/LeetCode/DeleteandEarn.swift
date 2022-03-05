//
//  DeleteandEarn.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/delete-and-earn/
 
 Topics: Array, Hash Table, DP
 */

class DeleteandEarn {
    
    /*
     - Use DP + Dict to solve
     - Build up dict which is key is a number and value in the number of appearance
     - Then we build up dp array size up to the maximum number in nums array. Start with [0] = 0 and [1] = dict[1], if not nil, otherwise 0
     - At index i, what to consider is that what is the maximum point we can get choosing between [i] + [i-2] or [i-1]
     - [i] = max([i-1], [i] + [i-2])
     */
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        
        nums.forEach {
            dict[$0] = dict[$0] == nil ? 1 : dict[$0]!+1
        }
        
        var results = [0]
        if let value = dict[1] {
            results.append(value)
        } else {
            results.append(0)
        }
        
        let n = dict.keys.max()!
        
        if n < 2 {
            return dict.values.max()!
        }
        
        for i in 2...n {
            let p1 = results[i-1]
            let p2 = results[i-2]
            
            if let value = dict[i] {
                var p = value*i
                p = max(p1, p+p2)
                results.append(p)
            } else {
                results.append(max(p1,p2))
            }

        }
        
        return max(results[n], results[n-1])
    }
}

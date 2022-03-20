//
//  CountCollisionsonaRoad.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/19/22.
//

/*
 https://leetcode.com/problems/count-collisions-on-a-road/
 
 Topics:
 */

class CountCollisionsonaRoad {
    func getCollisionNumber(_ c: String.Element) -> Int {
        if c == "L" {
            return -1
        }
        if c == "S" {
            return 0
        }
        return 1
    }
    
    func countCollisions(_ directions: String) -> Int {
        let arr = Array(directions)
        var dp = [Int]()
        dp.append(getCollisionNumber(arr.first!))
        
        if arr.count < 2 {
            return 0
        }
        
        var count = 0
        for i in 1..<arr.count {
            let c = arr[i]
            var num = getCollisionNumber(c)
            
            if c != "R" {
                if dp.last! != -1 {
                    let add = c == "L" ? 1 : 0
                    count += add + dp.last!
                    dp.append(0)
                    continue
                }
            }
            if dp.last! > 0 {
                num += dp.last!
            }
            dp.append(num)
        }
        
        return count
    }
}

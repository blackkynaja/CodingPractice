//
//  MinimumDominoRotationsForEqualRow.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/19/22.
//

/*
 https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
 
 Topics: Array, Greedy
 */

class MinimumDominoRotationsForEqualRow {
    func getSteps(_ tops: [Int], _ bottoms: [Int], _ item: Int) -> Int {
        var countT = 0
        var countB = 0
        
        for i in 0..<tops.count {
            if item == tops[i] && item == bottoms[i] {
                continue
            }
            if item == tops[i] || item == bottoms[i] {
                countT = item == tops[i] ? countT+1 : countT
                countB = item == bottoms[i] ? countB+1 : countB
            } else {
                return -1
            }
        }
        return min(countT, countB)
    }
    
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        let r1 = getSteps(tops, bottoms, tops.first!)
        let r2 = getSteps(bottoms, tops, bottoms.first!)
        
        if r1 == -1 && r2 == -1 {
            return -1
        }
        if r1 == -1 {
            return r2
        }
        if r2 == -1 {
            return r1
        }
        return min(r1, r2)
    }
}

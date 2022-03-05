//
//  NestedListWeightSum.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/1/22.
//

/*
 https://leetcode.com/problems/nested-list-weight-sum/
 
 Topics: DFS, BFS
 */

class NestedListWeightSum {
    func depthSumHelper(_ nestedList: [NestedInteger], _ d: Int) -> Int {
        var sum = 0
        
        for nest in nestedList {
            if nest.isInteger() {
                sum += nest.getInteger() * d
            } else {
                sum += depthSumHelper(nest.getList(), d+1)
            }
        }
        return sum
    }
    
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        return depthSumHelper(nestedList, 1)
    }
}

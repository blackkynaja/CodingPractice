//
//  NestedListWeightSumII.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/nested-list-weight-sum-ii/
 
 Topics: Stack, DFS, BFS
 */

/*
 Just a Mock up class to make it complieable
 */
class NestedInteger {
    public func isInteger() -> Bool { return true }
    public func getInteger() -> Int { return 0 }
    public func setInteger(value: Int) {}
    public func add(elem: NestedInteger) {}
    public func getList() -> [NestedInteger] { return [NestedInteger]() }
}

class NestedListWeightSumII {
    
    func findDepth(_ nestedList: [NestedInteger], _ currentDepth: Int) -> Int {
        var maxDepth = currentDepth
        for list in nestedList {
            if !list.isInteger() {
                maxDepth = max(maxDepth, findDepth(list.getList(), currentDepth+1))
            }
        }
        return maxDepth
    }
    
    func findSum(_ nestedList: [NestedInteger], _ currentDepth: Int, _ maxDepth: Int, _ currentSum: inout Int) {
        for list in nestedList {
            if !list.isInteger() {
                findSum(list.getList(), currentDepth+1, maxDepth, &currentSum)
            } else {
                currentSum = currentSum + list.getInteger()*(maxDepth - currentDepth + 1)
            }
        }
    }
    
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        let maxDepth = findDepth(nestedList, 1)
        var currentSum = 0
        findSum(nestedList, 1, maxDepth, &currentSum)
        
        return currentSum
    }
}

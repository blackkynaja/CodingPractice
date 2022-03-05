//
//  FlattenNestedListIterator.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/flatten-nested-list-iterator/
 
 Topics: Stack, Tree, DFS, Design, Queue, Iterator
 */

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

// MARK: - Stack

class NestedIterator1 {
    
    var results = [Int]()

    init(_ nestedList: [NestedInteger]) {
        self.results = flatten(nestedList)
    }
    
    func next() -> Int {
        return results.removeLast()
    }
    
    func hasNext() -> Bool {
        return results.count > 0
    }
    
    func flatten(_ nestedList: [NestedInteger]) -> [Int] {
        var stack = nestedList
        var results = [Int]()
        
        while stack.count > 0 {
            let temp = stack.removeLast()
            
            if temp.isInteger() {
                results.append(temp.getInteger())
            } else {
                stack.append(contentsOf: temp.getList())
            }
        }
        
        return results
    }
}

// MARK: - Recursive

class NestedIterator2 {
    
    var nestedList: [NestedInteger]
    var results = [Int]()

    init(_ nestedList: [NestedInteger]) {
        self.nestedList = nestedList
        self.results = flatten(nestedList)
        self.results.reverse()
    }
    
    func next() -> Int {
        return self.results.removeLast()
    }
    
    func hasNext() -> Bool {
        return self.results.count > 0
    }
    
    func flatten(_ nestedList: [NestedInteger]) -> [Int] {
        var temp = [Int]()
        for nest in nestedList {
            if nest.isInteger() == true {
                temp.append(nest.getInteger())
            } else {
                temp += flatten(nest.getList())
            }
        }
        return temp
    }
}

// MARK: - Solution

class NestedIterator: NestedIterator1 {
    
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */

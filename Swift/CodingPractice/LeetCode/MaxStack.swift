//
//  MaxStack.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/4/22.
//

/*
 https://leetcode.com/problems/max-stack/
 
 Topics: LinkedList, Stack, Design, Doubly-LinkedList
 */

class MaxStack {
    var stack = [Int]()
    var maxStack = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        if let tempMax = maxStack.last {
            if x > tempMax {
                maxStack.append(x)
            } else {
                maxStack.append(tempMax)
            }
        } else {
            maxStack.append(x)
        }
        stack.append(x)
    }
    
    @discardableResult
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return maxStack.last!
    }
    
    func popMax() -> Int {
        let tempMax = peekMax()
        var tempStack = [Int]()
        
        while top() != tempMax {
            tempStack.append(pop())
        }
        
        pop()
        
        while tempStack.count > 0 {
            push(tempStack.removeLast())
        }
        
        return tempMax
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */

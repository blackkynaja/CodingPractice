//
//  MaximumWidthofBinaryTree.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/26/22.
//

/*
 https://leetcode.com/problems/maximum-width-of-binary-tree/
 
 Topics: Tree, BFS, DFS, Binary Tree
 */

class MaximumWidthofBinaryTree {
    func getWidth(_ nodes: [(TreeNode, Int)]) -> Int {
        var left = Int.max
        var right = 0
        
        for (_, pos) in nodes {
            left = min(pos, left)
            right = max(pos, right)
        }
        
        let width = right - left + 1
        return width >= 1 ? width : 0
    }
    
    func enqueue(_ nodes: [(TreeNode,Int)]) -> [(TreeNode, Int)] {
        var queue = [(TreeNode, Int)]()
        var diff = 0
        
        for (node, pos) in nodes {
            if let left = node.left {
                if queue.count == 0 {
                    queue.append((left, 0))
                    diff = 2 * pos
                } else {
                    queue.append((left, 2*pos-diff))
                }
            }
            if let right = node.right {
                if queue.count == 0 {
                    queue.append((right, 0))
                    diff = 2 * pos + 1
                } else {
                    queue.append((right, 2*pos+1-diff))
                }
            }
        }
        return queue
    }
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var queue: [(TreeNode, Int)] = [(root!, 0)]
        var result = 0
        
        while queue.count > 0 {
            let width = getWidth(queue)
            result = max(result, width)
            queue = enqueue(queue)
        }
        return result
    }
}

//
//  MaximumDepthofBinaryTree.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/maximum-depth-of-binary-tree/
 
 Topics: Tree, BFS, DFS, Binary Tree
 */

class MaximumDepthofBinaryTree {
    
    // MARK: - DFS
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        
        let left = maxDepth2(node.left)
        let right = maxDepth2(node.right)
        return 1 + max(left, right)
    }
    
    // MARK: - BFS
    func enqueue(_ nodes: [TreeNode]) -> [TreeNode] {
        var newNodes = [TreeNode]()
        for node in nodes {
            if let left = node.left {
                newNodes.append(left)
            }
            if let right = node.right {
                newNodes.append(right)
            }
        }
        return newNodes
    }
    
    func maxDepth1(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        
        var d = 0
        var queue = [node]
        
        while queue.count > 0 {
            d += 1
            queue = enqueue(queue)
        }
        return d
    }
    
    // MARK: - Solution
    func maxDepth(_ root: TreeNode?) -> Int {
        return maxDepth1(root)
    }
}

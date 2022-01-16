/*
 https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/
 
 Topics: Tree, DFS, Binary Tree
 */

class SecondMinimumNodeInaBinaryTree {
    // MARK: - BFS
    func findSecondNum(_ nodes: [TreeNode], _ minNum: Int) -> Int {
        var result: Int?
        for node in nodes {
            if node.val == minNum {
                continue
            }
            guard let r = result else {
                result = node.val
                continue
            }
            
            if minNum < node.val && node.val < r {
                result = node.val
            }
        }
        
        return result ?? -1
    }
    
    func findSecondMinimumValue1(_ root: TreeNode?) -> Int {
        if root!.left == nil && root!.right == nil {
            return -1
        }
        
        var queue = [root!]
        let minNum = root!.val
        var result = -1
        while queue.count > 0 {
            result = findSecondNum(queue, minNum)
            var newQueue = [TreeNode]()
            for q in queue {
                if let left = q.left {
                    newQueue.append(left)
                }
                if let right = q.right {
                    newQueue.append(right)
                }
            }
            
            queue = newQueue
        }
        
        return result
    }
    
    // MARK: - DFS
    func findSecondMinimumValue2(_ root: TreeNode?) -> Int {
        if root!.left == nil && root!.right == nil {
            return -1
        }
        
        let left = root!.left!.val == root!.val ? findSecondMinimumValue(root!.left) : root!.left!.val
        let right = root!.right!.val == root!.val ? findSecondMinimumValue(root!.right) : root!.right!.val
        
        return left == -1 || right == -1 ? max(left, right) : min(left, right)
    }
    
    // MARK: - DFS
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        return findSecondMinimumValue1(root)
    }
}

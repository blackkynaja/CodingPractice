/*
 https://leetcode.com/problems/find-nearest-right-node-in-binary-tree/
 
 Topics: Tree, BFS, Binary Tree
 */

class FindNearestRightNodeinBinaryTree {
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let rootNode = root, let targetNode = u else {
            return nil
        }
        
        var q = [rootNode]
        
        while q.count > 0 {
            var nextQ = [TreeNode]()
            for (index, node) in q.enumerated() {
                // Found target
                if node.val == targetNode.val {
                    return index < q.count - 1 ? q[index+1] : nil
                }
                
                if let left = node.left {
                    nextQ.append(left)
                }
                if let right = node.right {
                    nextQ.append(right)
                }
            }
            q = nextQ
        }
        
        return nil
    }
}

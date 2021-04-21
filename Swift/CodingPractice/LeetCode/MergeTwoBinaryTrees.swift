/*
 https://leetcode.com/problems/merge-two-binary-trees/
 */

class MergeTwoBinaryTrees {
    
    func mergeTreesHelper(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let leftNode = root1 else {
            return root2 ?? nil
        }
        
        guard let rightNode = root2 else {
            return leftNode
        }
        
        let tree = TreeNode()
        tree.val = leftNode.val+rightNode.val
        if (leftNode.left != nil) || (rightNode.left != nil) {
            tree.left = mergeTrees(leftNode.left, rightNode.left)
        }
        if (leftNode.right != nil) || (rightNode.right != nil) {
            tree.right = mergeTrees(leftNode.right, rightNode.right)
        }
        return tree
    }

    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        let tree = mergeTreesHelper(root1, root2) ?? nil
        return tree
    }
}
 
 

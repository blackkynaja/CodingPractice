/*
 https://leetcode.com/problems/insert-into-a-binary-search-tree/
 
 Topics: Tree, BST, Binary Tree
 */

class InsertintoaBinarySearchTree {
    // MARK: - Recursion
    func recursion(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        
        let current = root!
        if val > current.val {
            current.right = insertIntoBST(current.right, val)
        } else {
            current.left = insertIntoBST(current.left, val)
        }
        
        return current
    }
    
    // MARK: - Iteration
    func iteration(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var current = root
        if current == nil {
            return TreeNode(val)
        }
        
        var prev: TreeNode = current!
        
        while current != nil {
            prev = current!
            if val > current!.val {
                current = current!.right
            } else {
                current = current!.left
            }
        }
        
        if val > prev.val {
            prev.right = TreeNode(val)
        } else {
            prev.left = TreeNode(val)
        }
        
        return root
    }
    
    // MARK: - Solution
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        return iteration(root, val)
    }
}

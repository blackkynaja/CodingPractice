/*
 https://leetcode.com/problems/merge-two-binary-trees/
 */

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

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
 
 

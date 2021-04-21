/*
 https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
 */

class TwoSumIV {
    
    // MARK: - Search All In BST
    // Time Complexity: O(nlogn), n = number of nodes, logn = height of TreeNode
    // Space Complexity: O(logn), function will be stored in memory and number of function that has been store is equal to a height of TreeNode
    
    func findNum(_ node: TreeNode, _ target: Int, _ current: Int) -> Bool {
        if node.val == target && node.val != current {
            return true
        }
        
        if let left = node.left, target < node.val {
            if findNum(left, target, current) {return true}
        }
        
        if let right = node.right, target > node.val {
            if findNum(right, target, current) {return true}
        }
        
        return false
    }
    
    func findTarget(_ root: TreeNode?, _ tree: TreeNode, _ k: Int) -> Bool {
        guard let node = root else { return false}
        
        return findNum(tree, k-node.val, node.val) || findTarget(node.left, tree, k) || findTarget(node.right, tree, k)
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let tree = root else { return false}
        
        return findTarget(root, tree, k)
    }
}

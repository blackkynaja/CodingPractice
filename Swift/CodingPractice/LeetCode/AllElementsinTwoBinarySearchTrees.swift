/*
 https://leetcode.com/problems/all-elements-in-two-binary-search-trees/
 
 Topics: Tree, BFS, BST, Sorting, Binary Tree
 */

class AllElementsinTwoBinarySearchTrees {
    func traverse(_ root: TreeNode?, _ arr: inout [Int]) {
        guard let node = root else {
            return
        }
        
        traverse(node.left, &arr)
        arr.append(node.val)
        traverse(node.right, &arr)
    }
    
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var arr = [Int]()
        traverse(root1, &arr)
        traverse(root2, &arr)
        arr.sort()
        return arr
    }
}

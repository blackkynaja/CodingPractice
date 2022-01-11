class LeafSimilarTrees {
    class Solution {
        func dfs(_ root: TreeNode?, _ leaves: inout [Int]) {
            if root == nil {
                return
            }
            
            if root!.left == nil && root!.right == nil {
                leaves.append(root!.val)
            }
            
            dfs(root!.left, &leaves)
            dfs(root!.right, &leaves)
        }
        
        func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            var leaves1 = [Int]()
            var leaves2 = [Int]()
            
            dfs(root1, &leaves1)
            dfs(root2, &leaves2)
            
            return leaves1 == leaves2
        }
    }
}

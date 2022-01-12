/*
 https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
 
 Topics: Tree, DFS, Binary Tree
 */

class SumofRootToLeafBinaryNumbers {
    func dfs(_ root: TreeNode?, _ currentPath: [String.Element], _ paths: inout [String]) {
        guard let node = root else {
            return
        }
        
        if node.left == nil && node.right == nil {
            paths.append(String(currentPath))
        } else if node.left != nil {
            dfs(node.left, currentPath + [Character(String(node.val))], &paths)
        } else if node.right != nil {
            dfs(node.right, currentPath + [Character(String(node.val))], &paths)
        }
    }
    
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var paths = [String]()
        dfs(root, [String.Element](), &paths)
        
        var result = 0
        
        for path in paths {
            if let num = Int(path, radix: 2) {
                result += num
            }
        }
        
        return result
    }
}

/*
 https://leetcode.com/problems/average-of-levels-in-binary-tree/
 */

class AverageofLevelsinBinaryTree {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var currentNodes = [TreeNode]()
        currentNodes.append(root!)
        
        var results = [Double]()
        
        while currentNodes.count > 0 {
            var sum = 0
            var nextLevel = [TreeNode]()
            for node in currentNodes {
                sum+=node.val
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            results.append(Double(sum)/Double(currentNodes.count))
            currentNodes = nextLevel
        }
        
        return results
    }
}

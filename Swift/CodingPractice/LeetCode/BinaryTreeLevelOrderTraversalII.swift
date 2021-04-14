/*
 
 */

class BinaryTreeLevelOrderTraversalII {
    
    class TreeNode {
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
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let firstNode = root else {
            return [[Int]]()
        }
        
        var currentNodes = [firstNode]
        var results = [[Int]]()
        
        while currentNodes.count > 0 {
            var nextLevel = [TreeNode]()
            var thisLevel = [Int]()
            for node in currentNodes {
                thisLevel.append(node.val)
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            results.append(thisLevel)
            currentNodes = nextLevel
        }
        
        return results.reversed()
    }
}

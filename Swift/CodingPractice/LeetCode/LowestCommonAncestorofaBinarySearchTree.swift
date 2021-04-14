/*
 https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */

class LowestCommonAncestorofaBinarySearchTree {
    
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
    
    func findPath(_ root: TreeNode?, _ n: TreeNode?,_ currentPath: [TreeNode],_ path: inout [TreeNode]) {
        guard let current = root, let target = n else {
            return
        }
        if (current.val == target.val) {
            path = currentPath
            return
        }
        
        if let left = current.left {
            findPath(left, target, currentPath+[left], &path)
        }
        if let right = current.right {
            findPath(right, target, currentPath+[right], &path)
        }
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var pathP = [TreeNode]()
        var pathQ = [TreeNode]()
        findPath(root, p, [root!], &pathP)
        findPath(root, q, [root!], &pathQ)
        var i = 0
        
        while (i < pathP.count && i < pathQ.count) {
            let currentP = pathP[i]
            let currentQ = pathQ[i]
            if (currentP.val != currentQ.val) {
                break
            }
            i+=1
        }
        
        return pathP[i-1]
    }
}

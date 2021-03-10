/*
 https://leetcode.com/problems/symmetric-tree/
 */

class SymmetricTree {
    
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
    
    // MARK: - Recursion
    func isMirror(_ left: TreeNode?,_ right: TreeNode?) -> Bool {
        if left == nil && right == nil{
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        
        return isMirror(left!.left, right!.right) && isMirror(left!.right, right!.left)
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        // traverse by level and compare start and end unti the half
        return isMirror(root?.left, root?.left)
    }
    
    // MARK: - Iterative
    func isSymmetricIterative(_ root: TreeNode?) -> Bool {
        // traverse by level and compare start and end unti the half
        var stack = [root, root]
        while stack.count > 0 {
            print(stack.map({$0?.val}))
            let left = stack.first!
            stack.removeFirst()
            let right = stack.first!
            stack.removeFirst()
            if left == nil && right == nil {
                continue
            }
            if left == nil || right == nil {
                return false
            }
            if left!.val != right!.val  {
                return false
            }
            
            stack.append(left!.left)
            stack.append(right!.right)
            stack.append(left!.right)
            stack.append(right!.left)
            
        }
        return true
    }
}

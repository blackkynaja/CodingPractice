// MARK: - TreeNode
// Definition for a binary tree node.
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

// MARK: - ListNode
// Definition for singly-linked list.
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public class func listNodes(_ vals: [Int]) -> ListNode? {
        if vals.count <= 0 {
            return nil
        }
        
        let node = ListNode(vals.first!)
        var current = node
        for i in 1..<vals.count {
            let next = ListNode(vals[i])
            current.next = next
            current = next
        }
        
        return node
    }
    
    public func listNodeToArray() -> [Int] {
        var results = [Int]()
        var current: ListNode?
        current = self
        
        while current != nil {
            results.append(current!.val)
            current = current!.next
        }
        
        return results
    }
}

extension ListNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

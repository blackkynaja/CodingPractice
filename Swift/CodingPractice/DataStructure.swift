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

// MARK: - TrieNode
// Definition for a binary tree node.
class TrieNode {
    public var childs = [Character: TrieNode]()
    
    func get(_ c: Character) -> TrieNode? {
        return childs[c]
    }
    
    private func dfs(_ node: TrieNode, _ current: [Character], _ results: inout [String]) {
        if node.childs.count == 0 {
            results.append(String(current))
        }
        
        for (key, value) in node.childs {
            var newCurr = current
            newCurr.append(key)
            dfs(value, newCurr, &results)
        }
    }
    
    func traverse() -> [String] {
        var results = [String]()
        dfs(self, [Character](), &results)
        return results
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

// MARK: - Node
class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

/*
 https://leetcode.com/problems/lru-cache/
 
 Topics: Hash Table, Linked List, Doubly-Linked List, Design
 */

class LRUCache {
    
    class DLNode {
        var key: Int?
        var value: Int?
        var next: DLNode?
        var prev: DLNode?
    }
    
    var dict = [Int:DLNode]()
    let capacity: Int
    var currentCap = 0
    var head: DLNode
    var tail: DLNode

    init(_ capacity: Int) {
        self.capacity = capacity
        self.head = DLNode()
        self.tail = DLNode()
        self.head.next = tail
        self.tail.prev = head
    }
    
    func removeNode(_ node: DLNode) {
        let prev = node.prev!
        let next = node.next!
        prev.next = next
        next.prev = prev
    }
    
    func moveNodeToHead(_ node: DLNode) {
        let firstNode = head.next!
        node.next = firstNode
        firstNode.prev = node
        node.prev = head
        head.next = node
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            removeNode(node)
            moveNodeToHead(node)
            return node.value!
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            removeNode(node)
            moveNodeToHead(node)
        } else {
            if currentCap == capacity {
                let newNode = DLNode()
                newNode.value = value
                newNode.key = key
                moveNodeToHead(newNode)
                dict[key] = newNode
                
                let lastNode = tail.prev!
                removeNode(lastNode)
                dict[lastNode.key!] = nil
            } else {
                let newNode = DLNode()
                newNode.value = value
                newNode.key = key
                moveNodeToHead(newNode)
                dict[key] = newNode
                currentCap+=1
            }
        }
    }
}


/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

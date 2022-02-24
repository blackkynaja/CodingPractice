//
//  CloneGraph.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/clone-graph/
 
 Topics: Hash Table, DFS, BFS, Graph
 */

class CloneGraph {
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil {
            return nil
        }
        
        var queue = [node]
        var dict = [Int:Node]()
        var visited = Set<Node>()
        var newHead: Node?
        
        while queue.count > 0 {
            var newQueue = [Node]()
            for q in queue {
                // mark as visited
                visited.insert(q!)
                
                // copy current Node
                let newNode: Node!
                if let n = dict[q!.val] {
                    newNode = n
                } else {
                    newNode = Node(q!.val)
                    dict[q!.val] = newNode
                    
                    // set new head
                    if newHead == nil {
                        newHead = newNode
                    }
                }
                
                for neighbor in q!.neighbors {
                    // copy neighbor node
                    let newNeighborNode: Node!
                    if let n = dict[neighbor!.val] {
                        newNeighborNode = n
                    } else {
                        newNeighborNode = Node(neighbor!.val)
                        dict[neighbor!.val] = newNeighborNode
                    }
                    newNode.neighbors.append(newNeighborNode)
                    // enqueue
                    if !visited.contains(neighbor!) {
                        newQueue.append(neighbor!)
                        visited.insert(neighbor!)
                    }
                }
            }
            
            queue = newQueue
        }
        
        return newHead
    }
}

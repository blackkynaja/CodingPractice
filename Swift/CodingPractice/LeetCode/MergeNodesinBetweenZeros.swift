//
//  MergeNodesinBetweenZeros.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/merge-nodes-in-between-zeros/
 
 Topics: LinkedList, Simulation
 */

class MergeNodesinBetweenZeros {
    func sumNodes(_ head: ListNode?) -> (ListNode, ListNode?) {
        var curr = head
        var val = 0
        while curr != nil, curr!.val != 0 {
            val += curr!.val
            curr = curr!.next
        }
        // print(val)
        return (ListNode(val), curr)
    }
    
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var resultHead: ListNode? = nil
        var newHead: ListNode? = nil
        var curr = head
        
        while curr != nil {
            if curr!.val == 0 {
                let result = sumNodes(curr!.next)
                if result.0.val != 0 {
                    if newHead == nil {
                        newHead = result.0
                        resultHead = newHead
                    } else {
                        newHead!.next = result.0
                        newHead = newHead!.next
                    }
                }
                curr = result.1
            }
        }
        
        return resultHead
    }
}

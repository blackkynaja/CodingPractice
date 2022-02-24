//
//  SwapNodesinPairs.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/swap-nodes-in-pairs/
 
 Topics: LinkedList, Recursion
 */

class SwapNodesinPairs {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        var curr = head!.next
        var newHead: ListNode? = nil
        var prev = head
        var prevNode: ListNode? = nil
        
        while curr != nil {
            let next = curr!.next
            curr!.next = prev
            prev!.next = next
            if prevNode != nil {
                prevNode!.next = curr
            }
            prevNode = prev
            prev = prev!.next
            
            if newHead == nil {
                newHead = curr
            }
            
            if next != nil {
                curr = next!.next
            } else {
                curr = nil
            }
        }
        
        return newHead == nil ? head : newHead
    }
}

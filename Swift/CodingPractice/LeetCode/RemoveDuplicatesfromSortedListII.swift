//
//  RemoveDuplicatesfromSortedListII.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/15/22.
//

/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 
 Topics: LinkedList, Two Pointers
 */

class RemoveDuplicatesfromSortedListII {
    func findNewNext(_ node: ListNode?) -> ListNode? {
        var curr = node
        
        while curr != nil {
            if let next = curr!.next {
                if curr!.val != next.val {
                    return next
                }
            } else {
                return nil
            }
            curr = curr!.next
        }
        return nil
    }

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var newHead = head
        
        while newHead != nil, newHead!.next != nil, newHead!.val == newHead!.next!.val {
            newHead = findNewNext(newHead!.next)
        }
        
        if newHead == nil {
            return nil
        }
        
        var curr = newHead
        var prev: ListNode? = nil
        
        while curr != nil, curr!.next != nil {
            if curr!.val == curr!.next!.val {
                let newNext = findNewNext(curr!.next)
                prev!.next = newNext
                curr = newNext
            } else {
                prev = curr
                curr = curr!.next
            }
        }
        return newHead
    }
}

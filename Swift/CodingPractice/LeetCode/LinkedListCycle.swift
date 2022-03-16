//
//  LinkedListCycle.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/15/22.
//

/*
 https://leetcode.com/problems/linked-list-cycle/
 
 Topics: Hash Table, LinkedList, Two Pointers
 */

class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        var slow = head
        var fast = head!.next
        
        while slow != nil && fast != nil {
            if slow == fast {
                return true
            }
            slow = slow!.next
            fast = fast!.next?.next
        }
        return false
    }
}

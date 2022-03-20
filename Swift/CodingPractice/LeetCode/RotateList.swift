//
//  RotateList.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 3/19/22.
//

/*
 https://leetcode.com/problems/rotate-list/
 
 Topics: LinkedList, Two Pointers
 */

class RotateList {
    func countList(_ head: ListNode?) -> Int {
        var count = 0
        var curr = head
        
        while curr != nil {
            count += 1
            curr = curr!.next
        }
        return count
    }
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let n = countList(head)
        if k%n == 0 {
            return head
        }
        
        let pos = n - k%n
        
        var count = 0
        var newHead = head
        var prev: ListNode? = nil
        
        while count < pos {
            prev = newHead
            newHead = newHead!.next
            count += 1
        }
        
        var curr = newHead
        while curr!.next != nil {
            curr = curr!.next
        }
        curr!.next = head
        prev!.next = nil
        
        return newHead
    }
}

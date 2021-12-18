/*
 https://leetcode.com/problems/reverse-linked-list/
 
 Topics: Linked List, Recursion
 */

class ReverseLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var next = head
        var prev: ListNode? = nil
        
        while next != nil {
            current = next
            next = current!.next
            current!.next = prev
            prev = current
        }
        
        return current
    }
}

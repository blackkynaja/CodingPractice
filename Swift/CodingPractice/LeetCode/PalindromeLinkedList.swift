/*
 https://leetcode.com/problems/palindrome-linked-list/
 
 Topics: Linked List, Two Pointers, Stack, Recursion
 */

class PalindromeLinkedList {
    func findListLenght(_ head: ListNode?) -> Int {
        var current = head
        var count = 0
        
        while current != nil {
            count+=1
            current = current!.next
        }
        return count
    }
    
    func reverseHalf(_ head: ListNode?, _ count: Int) -> ListNode? {
        var current = head
        var prev: ListNode? = nil
        var index = 0
        
        while current != nil {
            if index < count/2 {
                current = current!.next
            } else {
                let next = current!.next
                current!.next = prev
                prev = current
                current = next
            }
            index+=1
        }
        
        return prev
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        let length = findListLenght(head)
        let reversed = reverseHalf(head, length)
        var current = head
        var currentR = reversed
        
        while currentR != nil {
            if current!.val != currentR!.val {
                return false
            }
            current = current!.next
            currentR = currentR!.next
        }
        
        return true
    }
}

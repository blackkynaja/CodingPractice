//
//  SortList.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/sort-list/
 
 Topics: LinkedList, Two Pointers, Merge Sort, Sorting, Divide and Conquer
 */

class SortList {
    func getRightNode(_ node: ListNode?) -> ListNode? {
        var curr: ListNode? = node
        var right: ListNode? = node
        var prev: ListNode? = nil
        
        while curr != nil {
            curr = curr!.next?.next
            prev = right
            right = right!.next
        }
        prev?.next = nil
        return right
    }
    
    func mergeSortList(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        if left == nil && right == nil {
            return nil
        }
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        
        let leftN = mergeSortList(left, getRightNode(left))
        let rightN = mergeSortList(right, getRightNode(right))
        
        var curr: ListNode? = nil
        var currL: ListNode? = leftN
        var currR: ListNode? = rightN
        var newHead: ListNode? = nil
        while currL != nil && currR != nil {
            var temp: ListNode!
            if currL!.val < currR!.val {
                temp = currL
                currL = currL!.next
            } else {
                temp = currR
                currR = currR!.next
            }
            
            if curr == nil {
                curr = temp
                newHead = curr
            } else {
                curr!.next = temp
                curr = curr!.next
            }
        }
        
        while currL != nil {
            curr!.next = currL
            curr = curr!.next
            currL = currL!.next
        }
        while currR != nil {
            curr!.next = currR
            curr = curr!.next
            currR = currR!.next
        }
        
        return newHead
        
    }
    
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let left = head else {
            return nil
        }
        return mergeSortList(left, getRightNode(left))
    }
}

//
//  MergekSortedLists.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/merge-k-sorted-lists/
 
 Topics: LinkedList, Divide and Conquer, Heap, Merge Sort
 */

class MergekSortedLists {
    func mergeList(_ l1: ListNode?,_ l2: ListNode?) -> ListNode? {
        var current1 = l1
        var current2 = l2
        var result: ListNode? = nil
        var currentR = result
        
        while current1 != nil || current2 != nil {
            var temp: ListNode?
            if current1 != nil && current2 != nil {
                if current1!.val <= current2!.val {
                    temp = current1
                    current1 = current1!.next
                } else {
                    temp = current2
                    current2 = current2!.next
                }
            } else if current1 != nil {
                temp = current1
                current1 = current1!.next
            } else {
                temp = current2
                current2 = current2!.next
            }
            
            if result == nil {
                result = temp
                currentR = result
            } else {
                currentR!.next = temp
                currentR = currentR!.next
            }
        }
        
        return result
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        
        var currentList = lists
        while currentList.count > 1 {
            var i = 0
            var tempList = [ListNode?]()
            while i < currentList.count {
                let temp1 = currentList[i]
                var temp2: ListNode?
                if i+1 < currentList.count {
                    temp2 = currentList[i+1]
                }
                tempList.append(mergeList(temp1, temp2))
                i += 2
            }
            currentList = tempList
        }
        
        return currentList.first!
    }
}

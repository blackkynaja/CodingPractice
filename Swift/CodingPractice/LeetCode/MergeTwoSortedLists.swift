/*
 https://leetcode.com/problems/merge-two-sorted-lists/
 */
class MergeTwoSortedLists {
    func solution(_ l1: ListNode?,_ l2: ListNode?) -> ListNode? {
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
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return solution(l1,l2)
    }
}

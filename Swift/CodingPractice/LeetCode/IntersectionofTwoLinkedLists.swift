/*
 https://leetcode.com/problems/intersection-of-two-linked-lists/submissions/
 */

class IntersectionofTwoLinkedLists {
    
    func getLength(_ head: ListNode?) -> Int {
        var length = 0
        var temp = head
        while (temp != nil) {
            temp = temp!.next
            length+=1
        }
        
        return length
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if (headA == nil || headB == nil) {
            return nil
        }
        
        var lenA = getLength(headA)
        var lenB = getLength(headB)
        var currentA = headA
        var currentB = headB
        
        while (lenA > lenB) {
            lenA-=1
            currentA = currentA!.next
        }
        while (lenA < lenB) {
            lenB-=1
            currentB = currentB!.next
        }
        
        while (currentA !== currentB) {
            if (currentA == nil || currentB == nil) {
                return nil
            }
            
            currentA = currentA!.next
            currentB = currentB!.next
        }
        
        return currentA
    }
}

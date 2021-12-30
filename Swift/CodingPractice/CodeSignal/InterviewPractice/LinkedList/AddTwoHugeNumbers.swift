/*
 https://app.codesignal.com/interview-practice/task/RvDFbsNC3Xn7pnQfH/description
 */

class AddTwoHugeNumbers {
    func reverseLinkedList(a: ListNode?) -> ListNode? {
        var current = a
        var prev: ListNode? = nil
        var next: ListNode? = nil
        
        while current != nil {
            next = current!.next
            current!.next = prev
            prev = current
            current = next
        }
        return prev
    }
    
    func solution(a: ListNode?, b: ListNode?) -> ListNode? {
        let reA = reverseLinkedList(a: a)
        let reB = reverseLinkedList(a: b)
        
        var carry = 0
        var currentA = reA
        var currentB = reB
        var result: ListNode!
        var currentR = result
        
        while currentA != nil || currentB != nil {
            var temp = carry
            if currentA != nil {
                temp+=currentA!.val
                currentA = currentA!.next
            }
            if currentB != nil {
                temp+=currentB!.val
                currentB = currentB!.next
            }
            carry = temp/10000
            
            let tempR = ListNode(temp%10000)
            if result == nil {
                result = tempR
                currentR = result
            } else {
                currentR!.next = tempR
                currentR = currentR!.next
            }
        }
        
        if carry == 1 {
            let tempR = ListNode(1)
            currentR!.next = tempR
        }
        
        return reverseLinkedList(a: result)
    }
}
/*
nil 1 2 3
*/

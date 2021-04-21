/*
 https://leetcode.com/problems/add-two-numbers/
 */

class AddTwoNumbers {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var currentL1: ListNode? = l1
        var currentL2: ListNode? = l2
        var previous: ListNode?
        var result: ListNode?
        while (currentL1 != nil || currentL2 != nil) {
            var sum = 0
            
            if let node = currentL1  {
                sum+=node.val
                currentL1 = currentL1!.next
            }
            
            if let node = currentL2  {
                sum+=node.val
                currentL2 = currentL2!.next
            }
            
            sum+=carry
            let newNode = ListNode(sum%10)
            if result != nil {
                previous!.next = newNode
                previous = newNode
            } else {
                result = newNode
                previous = newNode
            }
            carry = sum/10
        }
        
        if carry == 1 {
            let newNode = ListNode(1)
            previous!.next = newNode
            previous = newNode
        }
        
        
        return result
    }
}

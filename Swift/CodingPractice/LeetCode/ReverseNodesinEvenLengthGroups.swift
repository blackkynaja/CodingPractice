/*
 https://leetcode.com/problems/reverse-nodes-in-even-length-groups/
 
 Topics: Linked List
 */

class ReverseNodesinEvenLengthGroups {
    func reverseAtIndex(_ index: Int,_ head: ListNode?,_ previousGroup: inout ListNode?) -> ListNode? {
        var current = head
        var previous: ListNode? = nil
        let tempHead = head
        var i = 0
        while (current != nil && i < index) {
            let tempNext = current!.next
            current!.next = previous
            previous = current
            current = tempNext
            i+=1
            
        }
        previousGroup!.next = previous
        tempHead!.next = current
        previousGroup = tempHead
        return current
    }
    
    func travelAtGroupIndex(_ index: Int,_ head: ListNode?,_ previousGroup: inout ListNode?) -> ListNode? {
        var current = head
        var i = 0
        while (current != nil && i < index) {
            previousGroup = current
            current = current!.next
            i+=1
        }
        return current
    }
    
    func lenghtNode(_ index: Int,_ head: ListNode?) -> Int {
        var current = head
        var i = 0
        while (current != nil && i < index) {
            current = current!.next
            i+=1
        }
        return i
    }
    
    func reverseEvenLengthGroups(_ head: ListNode?) -> ListNode? {
        var index = 1
        var current = head
        var previous: ListNode? = nil
        
        while(current != nil) {
            let length = lenghtNode(index, current)
            if length%2 == 0 {
                current = reverseAtIndex(index, current, &previous)
            } else {
                current = travelAtGroupIndex(index, current, &previous)
            }
            index+=1
        }
        
        return head
    }
}

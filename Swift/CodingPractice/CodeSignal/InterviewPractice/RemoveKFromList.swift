/*
 https://app.codesignal.com/interview-practice/task/gX7NXPBrYThXZuanm/description
 */

class RemoveKFromList {
    // MARK: - Solution1
    func removeKFromList(l: ListNode?, k: Int) -> ListNode? {
        var current = l
        var temp = current?.val
        var prev: ListNode?
        var newCurr: ListNode?
        while current != nil && temp == k {
            if current?.val == k {
                newCurr = current?.next
            }
            current = current?.next
            temp = current?.val
        }

        if let new = newCurr {
            current = new
        } else {
            newCurr = current
        }
        prev = current
        while current != nil {
            if current?.val == k {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next

        }
        return newCurr
    }
    
    // MARK: - Solution2
    func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return head }
        
        var current = head
        while current!.next != nil {
            if current!.next!.val == val {
                current!.next = current!.next!.next
            }  else {
                current = current!.next
            }
        }
        
        return head!.val == val ? head!.next : head
    }
}

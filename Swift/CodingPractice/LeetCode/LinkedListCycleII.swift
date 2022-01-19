/*
 https://leetcode.com/problems/linked-list-cycle-ii/
 
 Topics: Hash Table, Linked List, Two Pointers
 */

class LinkedListCycleII {
    
    // MARK: - Solution1
    /*
     - Make ListNode conform to hashtable
     - Loop through LinkedList, insert the visited node in set. If we found the same, we found cycle.
     - Space: O(n), hence not the best solution.
     */
    func detectCycle1(_ head: ListNode?) -> ListNode? {
        var set = Set<ListNode>()
        
        var current = head
        
        while current != nil {
            if set.contains(current!) {
                return current
            }
            set.insert(current!)
            current = current!.next
        }
        
        return nil
    }
    
    // MARK: - Solution2
    /*
     - Using Floyd's Tortoise and Hare
     - Has two pointers, slow and fast, which the slow move by 1 and fast move by 2
     - If there is a cycle, two pointer will be the same node at some point in cycle
     - The distance from head to intersection (node that start the cycle) node will equal to the distance from the node that two pointer point at the same node
     */
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head!.next == nil {
            return nil
        }
        
        var fast = head!.next!.next
        var slow = head!.next
        
        while fast != nil && slow != nil {
            if fast == slow {
                fast = head
                while fast != slow {
                    slow = slow!.next
                    fast = fast!.next
                }
                return fast
            }
            
            slow = slow!.next
            if fast!.next == nil {
                return nil
            }
            fast = fast!.next!.next
        }
        
        return nil
    }
    
    // MARK: - Solution
    func detectCycle(_ head: ListNode?) -> ListNode? {
        return detectCycle1(head)
    }
}

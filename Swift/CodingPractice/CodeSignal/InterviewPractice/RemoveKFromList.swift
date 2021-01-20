/*
 https://app.codesignal.com/interview-practice/task/gX7NXPBrYThXZuanm/description
 */

class ListNode<T> {
    let value: T? = nil
    var next: ListNode<T>? = nil
}

func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
    var current = l
    var temp = current?.value
    var prev: ListNode<Int>?
    var newCurr: ListNode<Int>?
    while current != nil && temp == k {
        if current?.value == k {
            newCurr = current?.next
        }
        current = current?.next
        temp = current?.value
    }

    if let new = newCurr {
        current = new
    } else {
        newCurr = current
    }
    prev = current
    while current != nil {
        if current?.value == k {
            prev?.next = current?.next
        } else {
            prev = current
        }
        current = current?.next

    }
    return newCurr
}

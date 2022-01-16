/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
 
 Topics: Array, Two Pointers
 */

class RemoveDuplicatesfromSortedArrayII {
    /*
     - Idea is to have two pointers p1, p2 and counter
     - If element at p1 is the same value as p1 - 1, increase counter by 1. Otherwise set counter back to 1
     - p1 and p2 will increase by one when counter <= 2, otherwise increse only p2 until we find the difference element to replace element at p1
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var count = 1
        var p1 = 1
        var p2 = 1
        
        while p1 < nums.count && p2 < nums.count {
            if nums[p2] == nums[p2-1] {
                count += 1
            } else {
                count = 1
            }
            
            if count <= 2 {
                nums[p1] = nums[p2]
                p1+=1
            }
            
            p2+=1
        }
        
        return p1
    }
}

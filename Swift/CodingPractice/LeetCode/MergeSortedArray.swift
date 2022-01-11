/*
 https://leetcode.com/problems/merge-sorted-array/
 
 Topics: Array, Two Pointers, Sorting
 */
class MergeSortedArray {
    
    // MARK: - Solution 1
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var temp = [Int]()
        var i = 0
        var j = 0
        while i < m || j < n {
            if i < m && j < n {
                if nums1[i] < nums2[j] {
                    temp.append(nums1[i])
                    i+=1
                } else if nums1[i] > nums2[j] {
                    temp.append(nums2[j])
                    j+=1
                } else if nums1[i] == nums2[j] {
                    temp.append(contentsOf: [nums1[i], nums2[j]])
                    i+=1
                    j+=1
                }
            } else if i < m {
                temp.append(nums1[i])
                i+=1
            } else if j < n {
                temp.append(nums2[j])
                j+=1
            }
        }
        
        nums1 = temp
    }
    
    // MARK: - Solution 2
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if m == 0 {
            nums1 = nums2
            return
        }
        
        var p1 = m-1
        var p2 = n-1
        var p = m+n-1
        
        while p >= 0 && p2 >= 0 {
            if p1 >= 0 && nums1[p1] > nums2[p2] {
                nums1[p] = nums1[p1]
                p1-=1
            } else {
                nums1[p] = nums2[p2]
                p2-=1
            }
            p-=1
        }
    }
}

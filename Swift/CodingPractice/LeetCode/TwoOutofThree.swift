/*
 https://leetcode.com/problems/two-out-of-three/
 
 Topics: Array, Hash Table
 */

class TwoOutofThree {
    func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        let set3 = Set(nums3)
        
        let int1 = set1.intersection(set2)
        let int2 = set2.intersection(set3)
        let int3 = set3.intersection(set1)
        
        return Array(int1.union(int2).union(int3))
    }
}

/*
 https://leetcode.com/problems/find-target-indices-after-sorting-array/
 
 Topics: Array
 */

class FindTargetIndicesAfterSortingArray {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.sorted()
        var results = [Int]()
        
        for (index, value) in sorted.enumerated() {
            if value == target {
                results.append(index)
            }
        }
        return results
    }
}

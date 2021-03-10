/*
 https://leetcode.com/problems/subsets/
 */

class Subsets {
    
    func subsetsHelper(_ nums: [Int],_ startIndex: Int,_ set: [Int], _ results: inout [[Int]]) {
        results.append(set)
        if startIndex == nums.count {
            return
        }
        for i in startIndex..<nums.count {
            let temp = set+[nums[i]]
            subsetsHelper(nums, i+1, temp, &results)
        }
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        results.append([])
        for i in 0..<nums.count {
            subsetsHelper(nums, i+1, [nums[i]], &results)
        }
        
        return results
    }
    
}

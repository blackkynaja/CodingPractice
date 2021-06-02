/*
 https://leetcode.com/problems/partition-to-k-equal-sum-subsets/
 */

class PartitiontoKEqualSumSubsets {
    func canPartitionKSubsetsHelper(_ nums: [Int], _ current: Int, _ sum: Int, _ target: Int, _ k: Int, _ visited: inout [Bool]) -> Bool {
        if k == 1 {
            return true
        }
        
        if sum == target {
            return canPartitionKSubsetsHelper(nums, 0, 0, target, k-1, &visited)
        } else if sum < target {
            for index in current..<nums.count {
                if !visited[index] {
                    visited[index] = true
                    if canPartitionKSubsetsHelper(nums, index+1, sum+nums[index], target, k, &visited) {
                        return true
                    }
                    visited[index] = false
                }
            }
        }
        
        return false
    }
    
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0,+)
        if sum%k != 0 {
            return false
        }
        let target = sum/k
        var visited = Array(repeating: false, count: nums.count)
        return canPartitionKSubsetsHelper(nums, 0, 0, target, k, &visited)
    }
}

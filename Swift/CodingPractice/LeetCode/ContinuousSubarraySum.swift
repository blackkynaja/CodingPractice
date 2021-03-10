/*
 https://leetcode.com/problems/continuous-subarray-sum/
 */

class ContinuousSubarraySum {
    //TODO: O(n^2) still need to improve the performance
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        for i in 0..<nums.count {
            var sum = nums[i]
            for j in i+1..<nums.count {
                sum += nums[j]
                if k == 0 {
                    if sum == 0 {
                        return true
                    }
                } else {
                    if sum%k == 0 {
                        return true
                    }
                }
            }
        }
        return false
    }
}

/*
 https://leetcode.com/problems/maximum-subarray/
 */

class MaximumSubarray {
    func maxSubArrayCulmulative(_ nums: [Int]) -> Int {
        var sumArr = [0]
        
        for n in nums {
            sumArr.append(sumArr.last!+n)
        }
        
        var min = 0
        var max = nums.first!
        for (index, value) in sumArr.enumerated() {
            if index > 0 {
                if value - min > max {
                    max = value - min
                }
                if value < min {
                    min = value
                }
            }
        }
        
        return max
    }
    
    func maxSubArrayDP(_ nums: [Int]) -> Int {
        var dp = [nums.first!]
        var result = dp.first!
        
        for i in 1..<nums.count {
            let next = dp[i-1] > 0 ? dp[i-1]+nums[i] : nums[i]
            result = max(next, result)
            dp.append(next)
        }
        
        return result
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        return maxSubArrayCulmulative(nums)
    }
}

/*
 https://leetcode.com/problems/maximum-subarray/
 
 Topics: Array, Divide and Conquer, DP
 */

class MaximumSubarray {
    
    // MARK: - Solution 1
    func maxSubArrayCulmulative(_ nums: [Int]) -> Int {
        var sumArr = [0]
        
        for n in nums {
            sumArr.append(sumArr.last!+n)
        }
        
        var minNum = 0
        var maxNum = nums.first!
        for (index, value) in sumArr.enumerated() {
            if index > 0 {
                maxNum = max(maxNum, value - minNum)
                minNum = min(minNum, value)
            }
        }
        
        return maxNum
    }
    
    // MARK: - Solution 2
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
    
    // MARK: - Solution 3
    func maxSubArrayPrev(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var result = nums.first!
        var prev = result > 0 ? result : 0
        
        for i in 1..<nums.count {
            let next = prev > 0 ? prev+nums[i] : nums[i]
            result = max(next, result)
            prev = next > 0 ? next : 0
        }
        
        return result
    }
    
    // MARK: - Solution
    func maxSubArray(_ nums: [Int]) -> Int {
        return maxSubArrayCulmulative(nums)
    }
}

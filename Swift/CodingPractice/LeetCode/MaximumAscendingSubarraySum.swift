/*
 https://leetcode.com/problems/maximum-ascending-subarray-sum/
 */

class MaximumAscendingSubarraySum {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var leftIndex = 0
        var results = [[Int]]()
        
        while (leftIndex < nums.count) {
            var rightIndex = leftIndex
            var temp = [Int]()
            while (rightIndex < nums.count) {
                if (rightIndex-leftIndex == 0) {
                    temp.append(nums[rightIndex])
                } else {
                    if (nums[rightIndex-1] >= nums[rightIndex]) {
                        break
                    } else {
                        temp.append(nums[rightIndex])
                    }
                }
                rightIndex+=1
            }
            leftIndex+=temp.count
            results.append(temp)
        }
        
        for result in results {
            let sum = result.reduce(0, +)
            if (sum > maxSum) {
                maxSum = sum
            }
        }
        
        return maxSum
    }
}

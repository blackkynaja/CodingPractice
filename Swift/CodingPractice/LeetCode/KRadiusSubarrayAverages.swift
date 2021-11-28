/*
 https://leetcode.com/problems/k-radius-subarray-averages/
 
 Topics: Array
 */

class KRadiusSubarrayAverages {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 0 { return nums }
        
        var sum = -1
        var results = [Int]()
        
        for (index, _) in nums.enumerated() {
            if index - k < 0 || index + k >= nums.count {
                results.append(-1)
            } else {
                if sum == -1 {
                    sum = Array(nums[0...index+k]).reduce(0,+)
                } else {
                    sum = sum - nums[index-k-1]
                    sum = sum + nums[index+k]
                }
                let avg = sum/(2*k+1)
                results.append(avg)
            }
        }
        
        return results
    }
}

/*
 https://leetcode.com/problems/burst-balloons/
 */

class BurstBalloons {
    
    // MARK: - DP Top Down
    func dpTopDownHelper(_ nums: [Int], _ left: Int, _ right: Int, _ dp: inout [String:Int]) -> Int {
        // print(nums, left, right)
        if left > right {
            return 0
        }

        let key = "\(left)+\(right)"
        if let value = dp[key] {
            // print("value:\(key) -> \(value)")
            return value
        }
        
        var maxCoins = 0
        
        for i in left...right {
            var gain = nums[i]
            if left > 0 {
                gain *= nums[left-1]
            }
            if right < nums.count - 1 {
                gain *= nums[right+1]
            }
            
            let remaining = dpTopDownHelper(nums, left, i-1, &dp) + dpTopDownHelper(nums, i+1, right, &dp)
            maxCoins = max(maxCoins, gain+remaining)
            // print(key,maxCoins)
        }
        
        dp[key] = maxCoins
        // print(key,maxCoins)
        return dp[key]!
    }
    
    func dpTopDown(_ nums: [Int]) -> Int {
        var maxCoins = 0
        
        // Special case for same element
        let set = Set(nums)
        if set.count == 1 && nums.count > 1 {
            let num = nums.first!
            return (nums.count-2)*num*num*num+num*num+num
        }
        
        var dp = [String:Int]()
        maxCoins = dpTopDownHelper(nums, 0, nums.count-1, &dp)
        
        return maxCoins
    }
    
    // MARK: - DP Brute Force
    func bruteForceHelper(_ nums: [Int], _ dp: inout [String:Int]) -> Int {
        // print(nums)
        if nums.count == 0 {
            return 0
        }
        
        let key = nums.reduce("") { (result, value) -> String in
            return "\(result)+\(value)"
        }
        if let value = dp[key] {
            return value
        }
        
        var maxCoins = 0
        
        for i in 0..<nums.count {
            var gain = nums[i]
            if i > 0 {
                gain *= nums[i-1]
            }
            if i < nums.count - 1 {
                gain *= nums[i+1]
            }
            
            var newNums = nums
            newNums.remove(at: i)
            let remaining = bruteForceHelper(newNums, &dp)
            maxCoins = max(maxCoins, gain+remaining)
        }
        
        dp[key] = maxCoins
        return dp[key]!
    }
    
    func bruteForce(_ nums: [Int]) -> Int {
        var maxCoins = 0
        var dp = [String:Int]()
        maxCoins = bruteForceHelper(nums, &dp)
        return maxCoins
    }
    
    // MARK: - Solution
    func maxCoins(_ nums: [Int]) -> Int {
//        return bruteForce(nums)
        return dpTopDown(nums)
    }
}


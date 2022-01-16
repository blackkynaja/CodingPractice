/*
 https://leetcode.com/problems/jump-game/
 
 Topics: Array, DP, Greedy
 */

class JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }
        
        var prev = nums.first!
        for i in 1..<nums.count - 1 {
            prev -= 1
            if prev < 0 {
                return false
            }
            prev = max(prev, nums[i])
        }
        
        return prev > 0
    }
}


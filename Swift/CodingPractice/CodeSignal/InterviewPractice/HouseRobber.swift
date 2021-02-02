/*
 https://app.codesignal.com/interview-practice/task/XBWN6DYRqPrKdMZs8/description
 
 You are planning to rob houses on a specific street, and you know that every house on the street has a certain amount of money hidden. The only thing stopping you from robbing all of them in one night is that adjacent houses on the street have a connected security system. The system will automatically trigger an alarm if two adjacent houses are broken into on the same night.

 Given a list of non-negative integers nums representing the amount of money hidden in each house, determine the maximum amount of money you can rob in one night without triggering an alarm.

 Example

 For nums = [1, 1, 1], the output should be
 houseRobber(nums) = 2.

 The optimal way to get the most money in one night is to rob the first and the third houses for a total of 2.
 */

func houseRobber(nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return nums.first!
    }
    
    var sums = [nums[0],nums[1]]
    
    for i in 2..<nums.count {
        if i == 2 {
            let sum = nums[i] + nums[0]
            sums.append(sum)
        } else {
            let sum = nums[i] + max(sums[i-2], sums[i-3])
            sums.append(sum)
        }
    }
    
    return max(sums[sums.count-1], sums[sums.count-2])
}

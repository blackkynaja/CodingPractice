/*
 https://leetcode.com/problems/maximum-score-from-removing-stones/
 
 Topics: Greedy, Heap
 */

class MaximumScoreFromRemovingStones {
    func maximumScore1(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var nums = [a,b,c]
        nums.sort(by: {$0 > $1})
        var count = 0
        while nums[0] != 0 && nums[1] != 0 {
            nums[0] = nums[0]-1
            nums[1] = nums[1]-1
            nums.sort(by: {$0 > $1})
            count+=1
        }

        return count
    }
    
    func maximumScore2(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var nums = [a,b,c]
        nums.sort(by: {$0 < $1})
        if nums[0]+nums[1] <= nums[2] {
            return nums[0]+nums[1]
        } else {
            return nums[2]+(((nums[0]+nums[1])-nums[2])/2)
        }
    }
}

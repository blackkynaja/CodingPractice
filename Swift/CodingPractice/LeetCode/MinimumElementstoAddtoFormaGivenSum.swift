/*
 https://leetcode.com/problems/minimum-elements-to-add-to-form-a-given-sum/
 */

class MinimumElementstoAddtoFormaGivenSum {
    func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
        let initialSum = nums.reduce(0, {$0+$1})
        let diff = abs(initialSum - goal)
        var count = diff/limit
        if diff%limit != 0 {
            count+=1
        }
        return count
    }
}

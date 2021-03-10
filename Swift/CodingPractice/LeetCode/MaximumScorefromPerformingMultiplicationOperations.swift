/*
 https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/
 */

class MaximumScorefromPerformingMultiplicationOperations {
    var array: [[Int]]!

    func maximumScoreHelper(_ nums: [Int], _ multipliers: [Int], _ multipliersIndex: Int,_ indexStart: Int,_ indexEnd: Int) -> Int {
        if multipliersIndex == multipliers.count {
            return 0
        }
        if array[indexStart][multipliersIndex] != -1 {
            return array[indexStart][multipliersIndex]
        }
        let result1 = maximumScoreHelper(nums, multipliers, multipliersIndex+1, indexStart+1, indexEnd) + nums[indexStart]*multipliers[multipliersIndex]
        let result2 = maximumScoreHelper(nums, multipliers, multipliersIndex+1, indexStart, indexEnd-1) + nums[indexEnd]*multipliers[multipliersIndex]
        let result = max(result1, result2)
        array[indexStart][multipliersIndex] = result
        return result
        
    }

    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        array = [[Int]](repeating: [Int](repeating: -1, count: multipliers.count), count: multipliers.count)
        return maximumScoreHelper(nums, multipliers, 0, 0, nums.count-1)
    }
}

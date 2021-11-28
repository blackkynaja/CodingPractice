/*
 https://leetcode.com/problems/removing-minimum-and-maximum-from-array/
 
 Topics:
 */

class RemovingMinimumandMaximumFromArray {
    func minimumDeletions(_ nums: [Int]) -> Int {
        if nums.count <= 2 {
            return nums.count
        }
        
        let minIndex = nums.firstIndex(of: nums.min()!)!
        let maxIndex = nums.firstIndex(of: nums.max()!)!
        let minNum = min(minIndex, maxIndex)
        let maxNum = max(minIndex, maxIndex)
        var results = 0
        
        if minNum+1 < nums.count-maxNum {
            results = minNum+1
            results = results + min(maxNum-minNum, nums.count-maxNum)
        } else {
            results = nums.count-maxNum
            results = results + min(maxNum-minNum, minNum+1)
        }
        return results
    }
}

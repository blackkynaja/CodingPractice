/*
 https://leetcode.com/problems/count-elements-with-strictly-smaller-and-greater-elements/
 
 Topics: Array, Sorting
 */

class CountElementsWithStrictlySmallerandGreaterElements {
    func countElements(_ nums: [Int]) -> Int {
        let minNum = nums.min()!
        let maxNum = nums.max()!
        var count = 0
        
        for num in nums {
            if num > minNum && num < maxNum {
                count += 1
            }
        }
        
        return count
    }
}

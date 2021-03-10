/*
 https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
 */
class CheckIfArrayIsSortedAndRotated {
    func check(_ nums: [Int]) -> Bool {
        var rotIndex = -1
        
        for i in 1..<nums.count {
            if nums[i-1] > nums[i] {
                rotIndex = i
                break
            }
        }
        
        if rotIndex == -1 {
            return true
        }
        
        for i in 0..<nums.count-1 {
            let index = (i+rotIndex)%nums.count
            let nextIndex = (index+1)%nums.count
            print(nums[index], nums[nextIndex])
            if nums[index] > nums[nextIndex] {
                return false
            }
        }
        
        return true
    }
}

/*
 https://leetcode.com/problems/valid-mountain-array/
 
 Topics: Array
 */

class ValidMountainArray {
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 3 {
            return false
        }
        if arr[1] <= arr[0] {
            return false
        }
        
        var isValid = false
        var isIncreasing = true
        
        for i in 1..<arr.count {
            if isIncreasing {
                if arr[i] <= arr[i-1] {
                    isIncreasing = false
                    if arr[i] < arr[i-1] {
                        isValid = true
                    }
                }
            } else {
                if arr[i] >= arr[i-1] {
                    return false
                }
            }
        }
        
        return isValid && !isIncreasing
    }
}

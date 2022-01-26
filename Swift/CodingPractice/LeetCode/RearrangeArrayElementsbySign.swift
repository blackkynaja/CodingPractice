/*
 https://leetcode.com/problems/rearrange-array-elements-by-sign/
 
 Topics: Array, Two Pointers, Simulation
 */

class RearrangeArrayElementsbySign {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var pIndex = 0
        var nIndex = 0
        var i = 0
        var results = [Int]()
        
        while i < nums.count {
            if i%2 == 0 {
                while pIndex < nums.count {
                    if nums[pIndex] > 0 {
                        results.append(nums[pIndex])
                        pIndex += 1
                        break
                    }
                    pIndex += 1
                }
            } else {
                while nIndex < nums.count {
                    if nums[nIndex] < 0 {
                        results.append(nums[nIndex])
                        nIndex += 1
                        break
                    }
                    nIndex += 1
                }
            }
            i += 1
        }
        
        return results
    }
}

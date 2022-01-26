/*
 https://leetcode.com/problems/find-all-lonely-numbers-in-the-array/
 
 Topics: Array, Hash Table, Counting
 */

class FindAllLonelyNumbersintheArray {
    func findLonely(_ nums: [Int]) -> [Int] {
        var dict = [Int: Int]()
        
        for num in nums {
            if let _ = dict[num] {
                dict[num]! += 1
            } else {
                dict[num] = 1
            }
            
            if let _ = dict[num-1] {
                dict[num-1]! += 1
            } else {
                dict[num-1] = 1
            }
            
            if let _ = dict[num+1] {
                dict[num+1]! += 1
            } else {
                dict[num+1] = 1
            }
        }
        
        var results = [Int]()
        
        for num in nums {
            if let value = dict[num], value == 1 {
                results.append(num)
            }
        }
        
        return results
    }
}

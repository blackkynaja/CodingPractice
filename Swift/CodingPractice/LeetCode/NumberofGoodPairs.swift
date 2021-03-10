/*
 https://leetcode.com/problems/number-of-good-pairs/
 */

class NumberofGoodPairs {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        var count = 0
        for num in nums {
            if let value = dict[num] {
                count+=value
                dict[num]!+=1
            } else {
                dict[num] = 1
            }
        }
        
        return count
    }
}

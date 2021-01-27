/*
 https://leetcode.com/problems/two-sum/
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dictNum = [Int:Int]()
    for i in 0..<nums.count {
        let value = nums[i]
        if let diffIndex = dictNum[target-value] {
            let result = [diffIndex, i]
            return result
        } else {
            dictNum[value] = i
        }
    }
    
    return [Int]()
}

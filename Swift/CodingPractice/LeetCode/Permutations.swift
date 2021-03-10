/*
 https://leetcode.com/problems/permutations/
 */
class Permutations {
    func permuteHelper(_ nums: [Int],_ temps: inout [Int],_ results: inout [[Int]]) {
        if temps.count == nums.count {
            results.append(temps)
            return
        }
        
        for num in nums {
            if !temps.contains(num) {
                temps.append(num)
                permuteHelper(nums, &temps, &results)
                temps.removeLast()
            }
        }
    }

    func permute(_ nums: [Int]) -> [[Int]] {
        var temps = [Int]()
        var results = [[Int]]()
        permuteHelper(nums, &temps, &results)
        return results
    }
}

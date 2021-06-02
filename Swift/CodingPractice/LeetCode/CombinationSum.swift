/*
 https://leetcode.com/problems/combination-sum/
 */

class CombinationSum {
    class Solution {
        func combinationSumHelper(_ candidates: [Int], _ current: [Int], _ target: Int, _ results: inout Set<[Int]>) {
            if target == 0 {
                results.insert(current.sorted())
            }
            
            if target > 0 {
                for n in candidates {
                    if n <= target {
                        combinationSumHelper(candidates, current+[n], target-n, &results)
                    }
                }
            }
        }
        
        func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var results = Set<[Int]>()
            combinationSumHelper(candidates, [Int](), target, &results)
            return Array(results)
        }
    }
}

/*
 https://leetcode.com/problems/combination-sum-ii/
 
 Topics: Array, Backtracking
 */

class CombinationSumII {
    func combinationSumHelper(_ candidates: [Int], _ current: inout [Int], _ start: Int, _ target: Int, _ results: inout Set<[Int]>) {
        if target < 0 {
            return
        }
        if target == 0 {
            results.insert(current.sorted())
            return
        }
        
        for i in start..<candidates.count {
            if(i > start && candidates[i] == candidates[i-1]) {
                continue
            }
            current.append(candidates[i])
            combinationSumHelper(candidates, &current, i+1, target-candidates[i], &results)
            current.removeLast()
        }
    }
        
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = Set<[Int]>()
        var current = [Int]()
        combinationSumHelper(candidates.sorted(), &current, 0, target, &results)
        return Array(results)
    }
}

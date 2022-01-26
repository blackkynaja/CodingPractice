/*
 https://leetcode.com/problems/permutations/
 
 Topics: Array, Backtracking
 */

class Permutations {
    
    // MARK: - Recursive
    func permuteHelper(_ nums: [Int],_ temps: [Int],_ results: inout [[Int]]) {
        if temps.count == nums.count {
            results.append(temps)
            return
        }
        
        for num in nums {
            if !temps.contains(num) {
                permuteHelper(nums, temps+[num], &results)
            }
        }
    }

    func permuteRe(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        permuteHelper(nums, [], &results)
        return results
    }
    
    // MARK: - BFS
    func permuteBFS(_ nums: [Int]) -> [[Int]] {
            var queue = [([Int], Set<Int>)]()
            var tempLength = 1
            
            for (index, value) in nums.enumerated() {
                let set : Set = [index]
                let item = ([value], set)
                queue.append(item)
            }
            
            while (tempLength < nums.count) {
                var nextQueue = [([Int], Set<Int>)]()
                for item in queue {
                    for (index, value) in nums.enumerated() {
                        if (!item.1.contains(index)) {
                            var tempValue = item.0
                            tempValue.append(value)
                            var tempSet = item.1
                            tempSet.insert(index)
                            nextQueue.append((tempValue, tempSet))
                        }
                    }
                }
                tempLength+=1
                queue = nextQueue
            }
            
            return queue.map({$0.0})
        }
}

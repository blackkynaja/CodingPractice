/*
 https://leetcode.com/problems/3sum/
 */
class ThreeSum {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var visited = Set<Int>()
        let sortedNums = nums.sorted()
        for (firstIndex, firstValue) in sortedNums.enumerated() {
            if visited.contains(firstValue) {
                continue
            }
            let target = 0 - firstValue
            var set = Set<Int>()
            var insideVisited = Set<Int>()
            for i in firstIndex+1..<sortedNums.count {
                if set.contains(target-sortedNums[i]) && !insideVisited.contains(sortedNums[i]) {
                    results.append([firstValue, sortedNums[i], target-sortedNums[i]])
                    insideVisited.insert(sortedNums[i])
                    insideVisited.insert(target-sortedNums[i])
                } else {
                    set.insert(sortedNums[i])
                }
            }
            visited.insert(firstValue)
        }
        
        return results
    }
    
}

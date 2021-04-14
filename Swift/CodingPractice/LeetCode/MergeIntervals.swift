/*
 https://leetcode.com/problems/merge-intervals/
 */

class MergeIntervals {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted(by: {$0[0] < $1[0]})
        var results = [[Int]]()
        for interval in sorted {
            if (results.count == 0) {
                results.append(interval)
            } else {
                let last = results.last!
                if (last[1] >= interval[0]) {
                    results.removeLast()
                    let mergeInterval = [min(last[0], interval[0]), max(last[1], interval[1])]
                    results.append(mergeInterval)
                } else {
                    results.append(interval)
                }
            }
        }
        
        return results
    }
}

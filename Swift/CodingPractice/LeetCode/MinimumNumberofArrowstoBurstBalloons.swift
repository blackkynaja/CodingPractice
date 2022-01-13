/*
 https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
 
 Topics: Array, Greedy, Sorting
 */

class MinimumNumberofArrowstoBurstBalloons {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var sorted = points.sorted {$0[0] < $1[0]}
        var merged = [sorted.first!]
        
        for i in 1..<sorted.count {
            let next = sorted[i]
            let last = merged.last!
            
            if next[0] <= last[1] {
                merged[merged.count-1] = [max(last[0], next[0]), min(last[1], next[1])]
            } else {
                merged.append(next)
            }
        }
        
        return merged.count
    }
}

/*
 https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
 
 Topics: Array, Greedy, Sorting
 */

class MinimumNumberofArrowstoBurstBalloons {
    
    // MARK: - Find Interception
    /*
     - Sort array by starting point
     - Find interception between to neigbour ballon by merge the interception to the merge array
     */
    func findMinArrowShots1(_ points: [[Int]]) -> Int {
        let sorted = points.sorted {$0[0] < $1[0]}
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
    
    // MARK: - Greedy
    /*
     - Sort array by ending point
     - Loop through sorted array if the next balloon start after the ending of the least end point, increase count by 1 and change the end point
     */
    func findMinArrowShots2(_ points: [[Int]]) -> Int {
        let sorted = points.sorted {$0[1] < $1[1]}
        var end = sorted.first!
        var count = 1
        for i in 1..<sorted.count {
            let next = sorted[i]
            
            if next[0] > end[1] {
                end = next
                count+=1
            }
        }
        
        return count
    }
    
    // MARK: - Solution
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        return findMinArrowShots1(points)
    }
}

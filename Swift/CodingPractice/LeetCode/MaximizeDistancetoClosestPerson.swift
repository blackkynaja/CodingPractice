/*
 https://leetcode.com/problems/maximize-distance-to-closest-person/
 
 Topics: Array
 */

class MaximizeDistancetoClosestPerson {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var maxGap = 0
        var countEmpty = 0
        var seatFound = false
        
        for seat in seats {
            if seat == 1 {
                let gap = seatFound ? (countEmpty+1)/2 : countEmpty
                maxGap = max(maxGap, gap)
                countEmpty = 0
                seatFound = true
            } else {
                countEmpty += 1
            }
        }
        
        if countEmpty > 0 {
            maxGap = max(maxGap, countEmpty)
        }
        
        return maxGap
    }
}

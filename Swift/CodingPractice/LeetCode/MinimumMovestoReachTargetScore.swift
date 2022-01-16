/*
 https://leetcode.com/problems/minimum-moves-to-reach-target-score/
 
 Topics: Math, Greedy
 */

class MinimumMovestoReachTargetScore {
    func minMoves(_ target: Int, _ maxDoubles: Int) -> Int {
        var temp = target
        var count = 0
        var maxD = maxDoubles
        
        while temp > 2 && maxD > 0 {
            if temp%2 != 0 {
                count+=1
            }
            temp /= 2
            count+=1
            maxD -= 1
        }
        
        count = count + temp - 1
        return count
    }
}

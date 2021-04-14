/*
 https://leetcode.com/problems/height-checker/
 */

class HeightChecker {
    func heightChecker(_ heights: [Int]) -> Int {
        let sorted = heights.sorted()
        var count = 0
        
        for i in 0..<sorted.count {
            if sorted[i] != heights[i] {
                count+=1
            }
        }
        
        return count
    }
}

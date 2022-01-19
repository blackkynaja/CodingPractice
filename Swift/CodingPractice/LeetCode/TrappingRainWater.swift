/*
 https://leetcode.com/problems/trapping-rain-water/
 
 Topics: Array, Two Pointers, DP
 */

class Solution {
    // MARK: - Solution1
    /*
     - Loop through height array, whenever we found the height that water can be trapped (height[i] < height[i-1]) then we start to collect all trap water by calling collectWater()
     - collectWater(): Find the max level and index that can match with the start level, if found, calculate the trap water between two index (start and maxLevelIndex) by finding all space between two level and minus by getCountBlock(). Return two value, water space and next index to find next possible trapped water.
     - getCountBlock(): Count the space that water can not trap
     */
    func getCountBlock(_ height: [Int], _ start: Int, _ end: Int, _ level: Int) -> Int {
        var count = 0
        for i in start..<end {
            if height[i] > level {
                count += level
            } else {
                count += height[i]
            }
        }
        
        return count
    }
    
    func collectWater(_ height: [Int], _ start: Int, _ level: Int) -> (Int, Int) {
        var i = start+1
        var maxLevel = Int.min
        var maxLevelIndex = -1
        var blockCount = Array(repeating: 0, count: height.count)
        blockCount[start] = height[start]
    
        while i < height.count {
            if height[i] >= maxLevel {
                maxLevel = height[i]
                maxLevelIndex = i
            }
            
            if maxLevel >= level {
                break
            }
            i += 1
        }
        
        if maxLevelIndex == -1 {
            return (0, height.count)
        }
        
        let countBlock = getCountBlock(height, start, maxLevelIndex, height[maxLevelIndex])
        let water = ((maxLevelIndex - start)*min(level, height[maxLevelIndex])) - countBlock
        
        return (water, maxLevelIndex)
    }
    
    // MARK: - Solution2
    /*
     - Use dp approach to store maximum level from left side and right side at index i
     - Water can be trapped in the mininum between left and right at index i minus by the height at index i
     */
    func trap1(_ height: [Int]) -> Int {
        var leftMaxArray = Array(repeating: 0, count: height.count)
        var rightMaxArray = Array(repeating: 0, count: height.count)
        var currentMax = 0
        var result = 0
        
        for i in 0..<height.count {
            currentMax = max(currentMax, height[i])
            leftMaxArray[i] = currentMax
        }
        
        currentMax = 0
        for i in 0..<height.count {
            let index = height.count - i - 1
            currentMax = max(currentMax, height[index])
            rightMaxArray[index] = currentMax
        }
        
        for i in 0..<height.count {
            result = result + min(leftMaxArray[i], rightMaxArray[i]) - height[i]
        }
        
        return result
    }
    
    // MARK: - Solution
    func trap(_ height: [Int]) -> Int {
        var trapWater = 0
        var i = 1
        
        while i < height.count {
            if height[i] < height[i-1] {
                let result = collectWater(height, i, height[i-1])
                trapWater += result.0
                i = result.1
            } else {
                i += 1
            }
        }
        
        return trapWater
    }
}

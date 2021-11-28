/*
 https://leetcode.com/problems/two-furthest-houses-with-different-colors/
 
 Topics: Array, Greedy
 */

class TwoFurthestHousesWithDifferentColors {
    func maxDistance(_ colors: [Int]) -> Int {
        var set = [Int: Int]()
        for (index, color) in colors.enumerated() {
            if set[color] == nil {
                set[color] = index
            }
        }
        
        var instance = 0
        
        for key in set.keys {
            let colorIndex = set[key]!
            for i in 0..<colors.count {
                let index = colors.count-1-i
                if colors[index] != key {
                    instance = max(instance, index-colorIndex)
                }
            }
        }
        
        return instance
    }
}

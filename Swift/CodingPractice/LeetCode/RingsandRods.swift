/*
 https://leetcode.com/problems/rings-and-rods/
 
 Topics: Hash Table, String
 */

class RingsandRods {
    func countPoints(_ rings: String) -> Int {
        let arr = Array(rings)
        var count = 0
        var dict = [String.Element: Set<String.Element>]()
        
        for i in stride(from: 0, to: arr.count, by: 2) {
            let color = arr[i]
            let index = arr[i+1]
            
            if let _ = dict[index] {
                dict[index]!.insert(color)
            } else {
                dict[index] = [color]
            }
        }
        
        for (_, value) in dict {
            if value.count >= 3 {
                count += 1
            }
        }
        
        return count
    }
}

/*
 https://leetcode.com/problems/first-unique-character-in-a-string/
 
 Topics: Hash Table, String
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [String.Element: Int]()
        
        for c in s {
            if let _ = dict[c] {
                dict[c]! += 1
            } else {
                dict[c] = 1
            }
        }
        
        for (index, c) in s.enumerated() {
            if let value = dict[c], value == 1 {
                return index
            }
        }
        
        return -1
    }
}

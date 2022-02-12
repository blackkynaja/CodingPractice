/*
 https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/
 
 Topics: Array, Hash Table, Bit Manipulation, Trie
 */

class MaximumXORofTwoNumbersinanArray {
    func pad(_ s : String, _ toSize: Int) -> String {
        var result = ""
        for _ in 0..<(toSize - s.count) {
            result.append("0")
        }
        result.append(s)
        return result
    }
    
    func findMaximumXOR(_ nums: [Int]) -> Int {
        let maxNum = nums.max()!
        let length = String(maxNum, radix: 2).count
        let trie = TrieNode()
        var strs = [String]()
        
        for num in nums {
            var node = trie
            let s = pad(String(num, radix: 2), length)
            strs.append(s)
            
            for c in s {
                if let child = node.get(c) {
                    node = child
                } else {
                    let newNode = TrieNode()
                    node.childs[c] = newNode
                    node = newNode
                }
            }
        }
        
        var maxValue = 0
        for s in strs {
            var currentValue = 0
            var node = trie
            for c in s {
                let diff = c == "0" ? "1" : "0"
                if let child = node.get(Character(diff)) {
                    node = child
                    currentValue = currentValue << 1 | 1
                } else if let child = node.get(c) {
                    node = child
                    currentValue = currentValue << 1
                }
            }
            maxValue = max(maxValue, currentValue)
        }
        
        
        return maxValue
    }
}

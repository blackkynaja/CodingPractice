/*
 https://leetcode.com/problems/number-of-equivalent-domino-pairs/
 */

class NumberofEquivalentDominoPairs {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var dict = [String:[Int]]()
        var count = 0
        
        for (index, value) in dominoes.enumerated() {
            let s = String(format: "\(value[0])\(value[1])")
            if let indexes = dict[s] {
                var newIndexes = indexes
                newIndexes.append(index)
                dict[s] = newIndexes
            } else {
                dict[s] = [index]
            }
        }
        
        for (index, value) in dominoes.enumerated() {
            let s1 = String(format: "\(value[0])\(value[1])")
            let s2 = String(format: "\(value[1])\(value[0])")
    
            if let indexes = dict[s1] {
                count+=indexes.filter({$0 > index}).count
            }
            
            if s1 != s2 {
                if let indexes = dict[s2] {
                    count+=indexes.filter({$0 > index}).count
                }
            }
        }
        
        return count
    }
}

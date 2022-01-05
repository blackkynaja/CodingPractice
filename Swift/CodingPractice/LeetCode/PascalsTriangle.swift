/*
 https://leetcode.com/problems/pascals-triangle/
 
 Topics: Array, Dynamic Programming
 */

class PascalsTriangle {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 {
            return [[1]]
        }
        if numRows == 2 {
            return [[1],[1,1]]
        }
        
        var results = [[1],[1,1]]
        
        for _ in 2..<numRows {
            let last = results.last!
            var newRow = [1]
            for i in 1..<last.count {
                let num = last[i-1]+last[i]
                newRow.append(num)
            }
            newRow.append(1)
            results.append(newRow)
        }
        
        return results
    }
}

/*
 https://leetcode.com/problems/cherry-pickup-ii/
 
 Topics: Array, DP, Matrix
 */

class CherryPickupII {
    func showRows(_ rows: [[[Int]]]) {
        for row in rows {
            print(row)
        }
    }
    
    func findMaxPath(_ rows: [[[Int]]], _ row: Int, _ col1: Int, _ col2: Int, _ grid: [[Int]]) -> Int {
        let sCol1 = max(col1 - 1, 0)
        let eCol1 = min(col1 + 1, rows[0].count - 1)
        let sCol2 = max(col2 - 1, 0)
        let eCol2 = min(col2 + 1, rows[0].count - 1)
        
        var currentValue = 0
        if col1 <= row {
            currentValue += grid[row][col1]
        }
        if col2 >= grid[0].count - 1 - row && col1 != col2 {
            currentValue += grid[row][col2]
        }
        var maxPath = currentValue
        for index1 in sCol1...eCol1 {
            for index2 in sCol2...eCol2 {
                maxPath = max(rows[row-1][index1][index2] + currentValue, maxPath)
            }
        }
        
        return maxPath
    }
    
    func cherryPickup(_ grid: [[Int]]) -> Int {
        var rows = [[[Int]]](repeating: Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid[0].count), count: grid.count)

        for row in 0..<grid.count {
            for col1 in 0..<grid[row].count {
                for col2 in 0..<grid[row].count {
                    if row - 1 < 0 {
                        if col1 <= row {
                            rows[row][col1][col2] += grid[row][col1]
                        }
                        if col2 >= grid[0].count - 1 - row {
                            rows[row][col1][col2] += grid[row][col2]
                        }
                    } else {
                        let maxPath = findMaxPath(rows, row, col1, col2, grid)
                        rows[row][col1][col2] = maxPath
                    }
                }
            }
        }
        
        return rows.last!.map{$0.max()!}.max()!
    }
}

/*
 https://leetcode.com/problems/spiral-matrix/
 */

class SpiralMatrix {
    
    func getBorder(_ matrix: [[Int]], _ index: Int) -> [Int] {
        let bRow = matrix.count-index-1
        let bCol = matrix[0].count-index-1

        var results = [Int]()
        for col in index...bCol {
            results.append(matrix[index][col])
        }
        
        if index < bRow {
            for row in index+1...bRow {
                results.append(matrix[row][bCol])
            }
        }
        
        if bRow != index {
            var col = bCol-1
            while col >= index {
                results.append(matrix[bRow][col])
                col-=1
            }
        }
        
        if bCol != index {
            var row = bRow-1
            while row > index {
                results.append(matrix[row][index])
                row-=1
            }
        }
        
        return results
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var results = [Int]()
        var border = 0
        
        if matrix.count == 2 || matrix[0].count == 2 {
            results+=getBorder(matrix, 0)
        } else {
            let maxBorder = min(matrix.count, matrix[0].count)
            while border < maxBorder/2+maxBorder%2 {
                results+=getBorder(matrix, border)
                border+=1
            }
        }
        
        return results
    }
}

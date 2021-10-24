/*
 https://leetcode.com/problems/spiral-matrix-ii/
 */

class SpiralMatrixII {
    func replaceBorder(_ matrix: inout [[Int]], _ index: Int, _ startNum: Int) -> Int {
        let bRow = matrix.count-index
        let bCol = matrix[0].count-index
        var num = startNum

        for col in index..<bCol {
            matrix[index][col] = num
            num+=1
        }
        
        for row in index+1..<bRow {
            matrix[row][bCol-1] = num
            num+=1
        }
        
        if bRow-1 != index {
            var col = bCol-2
            while col >= index {
                matrix[bRow-1][col] = num
                col-=1
                num+=1
            }
        }
        
        if bCol-1 != index {
            var row = bRow-2
            while row > index {
                matrix[row][index] = num
                row-=1
                num+=1
            }
        }
        
        return num
    }
    
    func generateMatrix2(_ n: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: Array(repeating: 0, count: n), count: n)
        var border = 0
        var num = 1
        
        if matrix.count == 2 || matrix[0].count == 2 {
            num = replaceBorder(&matrix, border, num)
        } else {
            let maxBorder = min(matrix.count, matrix[0].count)
            while border < maxBorder/2+maxBorder%2 {
                num = replaceBorder(&matrix, border, num)
                border+=1
            }
        }
        
        return matrix
    }
    
    func generateMatrix1(_ n: Int) -> [[Int]] {
        var direction = 0
        var left = 0
        var right = n-1
        var top = 0
        var bottom = n-1
        var count = 1
        var row = 0
        var column = 0
        var matrix = [[Int]](repeating: Array(repeating: 0, count: n), count: n)
        
        while count <= n*n {
            matrix[row][column] = count
            count+=1
            if direction%4 == 0 {
                column+=1
                if column == right {
                    direction+=1
                    right-=1
                }
            } else if direction%4 == 1 {
                row+=1
                if row == bottom {
                    direction+=1
                    bottom-=1
                }
            } else if direction%4 == 2 {
                column-=1
                if column == left {
                    direction+=1
                    left+=1
                }
            } else if direction%4 == 3 {
                row-=1
                if row == top {
                    direction+=1
                    top+=1
                    row = top
                    column = left
                }
            }
        }
        
        return matrix
    }
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        return generateMatrix2(n)
    }

}

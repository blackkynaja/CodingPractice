/*
 
 */

class SpiralMatrixII {
    func generateMatrix(_ n: Int) -> [[Int]] {
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
            print(row, column)
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
}

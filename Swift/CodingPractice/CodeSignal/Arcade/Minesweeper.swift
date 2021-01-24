/*
 In the popular Minesweeper game you have a board with some mines and those cells that don't contain a mine have a number in it that indicates the total number of mines in the neighboring cells. Starting off with some arrangement of mines we want to create a Minesweeper game setup.

 Example

 For

 matrix = [[true, false, false],
           [false, true, false],
           [false, false, false]]
 the output should be

 minesweeper(matrix) = [[1, 2, 1],
                        [2, 1, 1],
                        [1, 1, 1]]
 */

private func getNumberOfMine(row: Int, column: Int, matrix: [[Bool]]) -> Int {
    var countMine = 0
    let startRow = row-1 >= 0 ? row-1 : 0
    let endRow = row+1 < matrix.count ? row+1 : row
    
    for rowIndex in startRow...endRow {
        let startColumn = column-1 >= 0 ? column-1 : 0
        let endColumn = column+1 < matrix[rowIndex].count ? column+1 : column
        for columnIndex in startColumn...endColumn {
            if matrix[rowIndex][columnIndex] && !(rowIndex == row && columnIndex == column) {
                countMine+=1
            }
        }
    }
    
    return countMine
}

func minesweeper(matrix: [[Bool]]) -> [[Int]] {
    var results = [[Int]]()
    for row in 0..<matrix.count {
        var resultRows = [Int]()
        for column in 0..<matrix[row].count {
            let numberOfMine = getNumberOfMine(row: row, column: column, matrix: matrix)
            resultRows.append(numberOfMine)
        }
        results.append(resultRows)
    }
    
    return results
}


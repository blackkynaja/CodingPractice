/*
 https://app.codesignal.com/interview-practice/task/SKZ45AF99NpbnvgTn/description
 */
func findInRow(row: Int, column: Int, c: Character, grid: [[Character]]) -> Bool {
    for i in 0..<grid[column].count {
        let s = grid[column][i]
        if s == c && i != row  {
//            print("1")
            return true
        }
    }
    return false
}

func findInColumn(row: Int, column: Int, c: Character, grid: [[Character]]) -> Bool {
    for i in 0..<grid.count {
        let s = grid[i][row]
        if s == c && i != column {
//            print("2")
            return true
        }
    }
    return false
}

func findIn3x3(row: Int, column: Int, c: Character, grid: [[Character]]) -> Bool {
    let startColumn = column/3*3
    let startRow = row/3*3
    
    for i in startColumn..<startColumn+3 {
        for j in startRow..<startRow+3 {
            let s = grid[i][j]
            if s == c && i != column && j != row {
//                print("3")
                return true
            }
        }
    }
    return false
    
}

func sudoku2(grid: [[Character]]) -> Bool {
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            let s = grid[i][j]
            if s != "." {
                if findInRow(row: j, column: i, c: s, grid: grid) || findInColumn(row: j, column: i, c: s, grid: grid) || findIn3x3(row: j, column: i, c: s, grid: grid) {
                    print(i, j)
                    return false
                }
            }
        }
    }
    return true
}

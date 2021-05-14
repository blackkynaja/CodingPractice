/*
 https://leetcode.com/problems/rotting-oranges/
 */

class RottingOranges {
    func spreadRotten(_ grid: inout [[Int]], _ row: Int, _ column: Int, _ day: Int) -> (row: Int, column: Int)? {
        if grid[row][column] == 1 || grid[row][column] > day {
            grid[row][column] = day
            return (row, column)
        }
        return nil
    }
    
    func bfs(_ grid: inout [[Int]], _ startRow: Int, _ startColumn: Int) {
        var queue = [(row: Int, column: Int)]()
        queue.append((startRow, startColumn))
        
        var day = 3
        
        while queue.count > 0 {
            print(queue, day)
            var nextQueue = [(row: Int, column: Int)]()
            for item in queue {
                if item.row > 0 {
                    if let next = spreadRotten(&grid, item.row-1, item.column, day) {
                        nextQueue.append(next)
                    }
                }
                if item.column > 0 {
                    if let next = spreadRotten(&grid, item.row, item.column-1, day) {
                        nextQueue.append(next)
                    }
                }
                if item.row < grid.count-1 {
                    if let next = spreadRotten(&grid, item.row+1, item.column, day) {
                        nextQueue.append(next)
                    }
                }
                if item.column < grid[item.row].count-1 {
                    if let next = spreadRotten(&grid, item.row, item.column+1, day) {
                        nextQueue.append(next)
                    }
                }
            }
            
            queue = nextQueue
            day+=1
        }
    }
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var newGrid = grid
        
        for row in 0..<newGrid.count {
            for column in 0..<newGrid[row].count {
                if newGrid[row][column] == 2 {
                    bfs(&newGrid, row, column)
                }
            }
        }
        
        var max = 0
        for row in 0..<newGrid.count {
            for column in 0..<newGrid[row].count {
                if newGrid[row][column] == 1 {
                    return -1
                } else if newGrid[row][column] != 0 {
                    if newGrid[row][column] > max {
                        max = newGrid[row][column]
                    }
                }
            }
        }
        
        return max == 0 ? max : max-2
    }
}

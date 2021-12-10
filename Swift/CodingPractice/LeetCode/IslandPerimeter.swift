/*
 https://leetcode.com/problems/island-perimeter/
 
 Topics: Array, DFS, BFS, Matrix
 */

class IslandPerimeter {
    func getPerimeter(_ grid: [[Int]], _ row: Int, _ col: Int) -> Int {
        let neigbours = [(-1,0), (0,-1), (1,0), (0,1)]
        var perimeter = 0
        
        for neigbour in neigbours {
            let tempRow = row+neigbour.0
            let tempCol = col+neigbour.1
            if tempRow < 0 || tempRow >= grid.count || tempCol < 0 || tempCol >= grid[row].count {
                perimeter+=1
            } else {
                if grid[tempRow][tempCol] == 0 {
                    perimeter+=1
                }
            }
        }
        return perimeter
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 1 {
                    perimeter+=getPerimeter(grid, row, col)
                }
            }
        }
        return perimeter
    }
}

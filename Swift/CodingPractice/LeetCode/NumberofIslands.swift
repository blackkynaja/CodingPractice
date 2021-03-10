/*
 https://leetcode.com/problems/number-of-islands/
 */

class NumberofIslands {
    // MARK: - BFS
    func fillIsland(_ row: Int,_ column: Int,_ grid: inout [[String]]) {
        var islands = [(Int,Int)]()
        islands.append((row,column))
        
        while islands.count > 0 {
            print(islands)
            var nextIsland = [(Int,Int)]()
            for island in islands {
                grid[island.0][island.1] = "2"
                if island.0 > 0 {
                    if grid[island.0-1][island.1] == "1" {
                        grid[island.0-1][island.1] = "2"
                        nextIsland.append((island.0-1,island.1))
                    }
                }
                if island.1 > 0 {
                    if grid[island.0][island.1-1] == "1" {
                        grid[island.0][island.1-1] = "2"
                        nextIsland.append((island.0-1,island.1))
                    }
                }
                if island.0 < grid.count-1 {
                    if grid[island.0+1][island.1] == "1" {
                        grid[island.0+1][island.1] = "2"
                        nextIsland.append((island.0+1,island.1))
                    }
                }
                if island.1 < grid[island.0].count-1 {
                    if grid[island.0][island.1+1] == "1" {
                        grid[island.0][island.1+1] = "2"
                        nextIsland.append((island.0,island.1+1))
                    }
                }
            }
            islands = nextIsland
        }
    }
    
    func numIslands(_ grid: [[String]]) -> Int {
        var newGrid = grid.map{$0}
        var count = 0
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if newGrid[row][column] == "1" {
                    count+=1
                    fillIsland(row,column,&newGrid)
                }
            }
        }
        
        return count
    }
    
    // MARK: - DFS
    func fillIslandDFS(_ row: Int,_ column: Int,_ grid: inout [[String]]) {
        if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count {
            return
        }
        if grid[row][column] != "1" {
            return
        }
        
        grid[row][column] = "2"
        
        fillIslandDFS(row-1,column,&grid)
        fillIslandDFS(row+1,column,&grid)
        fillIslandDFS(row,column-1,&grid)
        fillIslandDFS(row,column+1,&grid)
    }
}

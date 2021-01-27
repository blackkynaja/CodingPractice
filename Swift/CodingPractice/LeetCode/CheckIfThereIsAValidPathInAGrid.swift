/*
 https://leetcode.com/problems/check-if-there-is-a-valid-path-in-a-grid/
 */

private struct Path {
    let path = [1: ["neighbor": [[1,4,6],[1,3,5]], "next": [[-1,0],[1,0]]],
            2: ["neighbor": [[2,3,4],[2,5,6]], "next": [[0,-1],[0,1]]],
            3: ["neighbor": [[1,4,6],[2,5,6]], "next": [[-1,0],[0,1]]],
            4: ["neighbor": [[1,3,5],[2,5,6]], "next": [[1,0],[0,1]]],
            5: ["neighbor": [[2,3,4],[1,4,6]], "next": [[0,-1],[-1,0]]],
            6: ["neighbor": [[2,3,4],[1,3,5]], "next": [[0,-1],[1,0]]],
            ]
}

func hasValidPath(_ grid: [[Int]]) -> Bool {
    let path = Path()
    var stack = [[0,0]]
    var visited = Set<[Int]>()
    while stack.count > 0 {
        let currentPos = stack.removeLast()
        if currentPos[0] == grid[0].count - 1 && currentPos[1] == grid.count - 1 {
            print("visited: ",visited)
            return true
        }
        
        visited.insert(currentPos)
        let currentPath = grid[currentPos[1]][currentPos[0]]
        if let pathItem = path.path[currentPath] {
            if let nextPos = pathItem["next"] {
                for i in 0..<nextPos.count {
                    let pos = nextPos[i]
                    let nextX = currentPos[0] + pos[0]
                    let nextY = currentPos[1] + pos[1]
                    if nextX < grid[0].count && nextX >= 0 && nextY >= 0 && nextY < grid.count {
                        let newPos = [nextX,nextY]
                        let nextPath = grid[nextY][nextX]
                        if let neighbor = pathItem["neighbor"] {
                            let nextNeighbor = neighbor[i]
                            if nextNeighbor.contains(nextPath) && !visited.contains(newPos) {
                                stack.append(newPos)
                            }
                        }
                    }
                }
            }
        }
    }
    return false
}

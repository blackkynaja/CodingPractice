
/*
 N*N
 Only go Down(D) or Right(R)
 Find all paths from 1,1 to N,N
 */

class TopLeftToBottomRight {
    // MARK: - DFS
    func findAllPathsDFSHelper(_ n: Int,_ row: Int,_ column: Int,_ path: String) -> [String] {
        if row == n {
            var newPath = path
            newPath.append(contentsOf: (repeatElement("D", count: n-column)))
            return [newPath]
        }
        
        if column == n {
            var newPath = path
            newPath.append(contentsOf: (repeatElement("R", count: n-row)))
            return [newPath]
        }
        
        return findAllPathsDFSHelper(n, row+1, column, path+"R")+findAllPathsDFSHelper(n, row, column+1, path+"D")
    }
    
    func findAllPathsDFS(_ n: Int) -> [String] {
        let paths = findAllPathsDFSHelper(n, 1, 1, "")
        return paths
    }
    
    // MARK: - BFS
    func findAllPathsBFS(_ n: Int) -> [String] {
        var paths = [("R", 2, 1), ("D", 1, 2)]
        var depth = 1

        while depth < 2*(n-1) {
            var nextPaths = [(String, Int, Int)]()
            for path in paths {
                if path.1 < n {
                    let newPath = (path.0+"R", path.1+1, path.2)
                    nextPaths.append(newPath)
                }
                if path.2 < n {
                    let newPath = (path.0+"D", path.1, path.2+1)
                    nextPaths.append(newPath)
                }
            }
            paths = nextPaths
            depth+=1
        }
        return paths.map({$0.0})
    }
    
    // MARK: - Main
    func findAllPaths(_ n: Int) -> [String] {
        return findAllPathsBFS(n)
    }
}

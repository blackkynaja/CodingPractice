/*
 https://app.codesignal.com/company-challenges/dropbox/5yzYzP9pnzWD2XY44
 */

class FileSyncOrder {
    func getNext(files: [[Int]], startTime: Int, visited: Set<Int>) -> [[Int]] {
        return files.filter{$0[1] <= startTime && !visited.contains($0[2])}.sorted{$0[0] < $1[0]}
    }

    func solution(files: [[Int]], storageLimit: Int, uploadSpeed: Int, duration: Int) -> [Int] {
        var sorted = [[Int]]()
        var visited = Set<Int>()
        
        for (index,file) in files.enumerated() {
            var temp = file
            temp.append(index)
            sorted.append(temp)
        }
        sorted.sort{$0[1] < $1[1]}
        var currentTime = 0
        var currentStorage = 0
        var results = [Int]()
        var queues = sorted.filter{$0[1] == sorted.first![1]}
        queues.sort{$0[0] < $1[0]}
        
        while queues.count > 0 {
            let sync = queues.first!
            queues.removeFirst()
            visited.insert(sync[2])
            if currentTime < sync[1] {
                currentTime = sync[1]
            }
            let timeUsed = currentTime + sync[0]/uploadSpeed
            let storageUsed = currentStorage + sync[0]
            if timeUsed <= duration && storageUsed <= storageLimit {
                results.append(sync[2])
                currentTime = timeUsed
                currentStorage = storageUsed
                queues = getNext(files: sorted, startTime: currentTime, visited: visited)
            }
            
            // In case that no task left in current sync, find unvisited file to get in the dropbox next
            if queues.count == 0 {
                queues = sorted.filter{!visited.contains($0[2])}
            }
        }
        return results
    }
}

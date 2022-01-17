/*
 https://leetcode.com/problems/jump-game-iv/
 
 Topics: Array, Hash Table, BFS
 */

class JumpGameIV {
    // MARK: - BFS
    /*
     - Using BFS to solve because we need to find the shortest way to reach the end
     - All edges has three possible vertices (i-1, i+1, same value for arr[i])
     - Use dict to store indexes of the value
     - Run BFS start at arr[0] and keep track visited index by "visited" array and track value of arr[i] by using set to store value (Because we only need to visit each value once to find all possible paths)
     */
    func minJumps(_ arr: [Int]) -> Int {
        var dict = [Int: [Int]]()
        
        for (index, value) in arr.enumerated() {
            if let _ = dict[value] {
                dict[value]!.append(index)
            } else {
                dict[value] = [index]
            }
        }
        
        var visited = Array(repeating: false, count: arr.count)
        var set = Set<Int>()
        
        var queues = [(0,0)]
        
        while queues.count > 0 {
            
            var nextQ = [(Int, Int)]()
            
            for q in queues {
                let temp = q
                visited[temp.0] = true
                if temp.0 == arr.count - 1 {
                    return temp.1
                }

                let prev = temp.0 - 1
                if prev >= 0 && !visited[prev] {
                    visited[prev] = true
                    nextQ.append((prev, temp.1+1))
                }

                let next = temp.0 + 1
                if next < arr.count && !visited[next] {
                    visited[next] = true
                    nextQ.append((next, temp.1+1))
                }

                let num = arr[temp.0]
                if !set.contains(num) {
                    set.insert(num)
                    for index in dict[num]! {
                        if !visited[index] {
                            visited[index] = true
                            nextQ.append((index, temp.1+1))
                        }
                    }
                }
            }
            
            queues = nextQ
        }
        
        return -1
    }
}

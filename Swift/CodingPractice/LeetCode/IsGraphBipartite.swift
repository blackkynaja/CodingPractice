/*
 https://leetcode.com/problems/is-graph-bipartite/submissions/
 */

class IsGraphBipartite {
    enum SetGraph: Int {
        case SetA = 0
        case SetB = 1
    }

    private func generateAllNodes(_ graph: [[Int]]) -> [Int:[Int]] {
        var dict = [Int:[Int]]()
        for (index, values) in graph.enumerated() {
            var temp = [Int]()
            for value in values {
                temp.append(value)
            }
            
            if temp.count > 0 {
                dict[index] = temp
            }
        }
        
        return dict
    }

    func isBipartite(_ graph: [[Int]]) -> Bool {
        let dict = generateAllNodes(graph)
        var stack = dict.map { (arg0) -> Int in
            let (key, _) = arg0
            return key
        }

        var sets = Array(repeating: -1, count: graph.count)
        
        while stack.count > 0 {
            let current = stack.last!
            stack.removeLast()
            // Not visited
            if sets[current] == -1 {
                sets[current] = SetGraph.SetA.rawValue
                if let neigbors = dict[current] {
                    for neigbor in neigbors {
                        if sets[neigbor] == -1 {
                            sets[neigbor] = SetGraph.SetB.rawValue
                            stack.append(neigbor)
                        } else if sets[neigbor] == SetGraph.SetA.rawValue {
                            return false
                        }
                    }
                }
            } else {
                if let neigbors = dict[current] {
                    for neigbor in neigbors {
                        if sets[neigbor] == -1 {
                            sets[neigbor] = sets[current] == SetGraph.SetB.rawValue ? SetGraph.SetA.rawValue : SetGraph.SetB.rawValue
                            stack.append(neigbor)
                        } else if sets[neigbor] == sets[current] {
                            return false
                        }
                    }
                }
            }
        }
        
        return true
    }
}

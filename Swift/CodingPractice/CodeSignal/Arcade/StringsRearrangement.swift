/*
 Given an array of equal-length strings, you'd like to know if it's possible to rearrange the order of the elements in such a way that each consecutive pair of strings differ by exactly one character. Return true if it's possible, and false if not.

 Note: You're only rearranging the order of the strings, not the order of the letters within the strings!

 Example

 For inputArray = ["aba", "bbb", "bab"], the output should be
 stringsRearrangement(inputArray) = false.

 There are 6 possible arrangements for these strings:

 ["aba", "bbb", "bab"]
 ["aba", "bab", "bbb"]
 ["bbb", "aba", "bab"]
 ["bbb", "bab", "aba"]
 ["bab", "bbb", "aba"]
 ["bab", "aba", "bbb"]
 None of these satisfy the condition of consecutive strings differing by 1 character, so the answer is false.

 For inputArray = ["ab", "bb", "aa"], the output should be
 stringsRearrangement(inputArray) = true.

 It's possible to arrange these strings in a way that each consecutive pair of strings differ by 1 character (eg: "aa", "ab", "bb" or "bb", "ab", "aa"), so return true.
 
 https://app.codesignal.com/arcade/intro/level-7/PTWhv2oWqd6p4AHB9
 */

private struct Node: CustomStringConvertible {
    let index: Int
    var neighbors: [Int]
    
    var description: String {
        return "(\(index) -> [\(neighbors)])"
    }
}

private func addNextNeighbor(array: [String], visited: Set<Int>) -> [Int] {
    var next = [Int]()
    for i in 0..<array.count {
        if !visited.contains(i) {
            next.append(i)
        }
    }
    
    return next
}

private func generateAllNodes(array: [String]) -> [Int:[Int]] {
    var nodes = [Int:[Int]]()
    for i in 0..<array.count {
        var temp = [Int]()
        for j in 0..<array.count {
            if i != j {
                temp.append(j)
            }
        }
        nodes[i] = temp
    }
    
    return nodes
}

private func isStringDifferByOneCharacter(s1: String, s2: String) -> Bool {
    var dict = [String.Element: Int]()
    
    for s in s1 {
        if let _ = dict[s] {
            dict[s]!+=1
        } else {
            dict[s] = 1
        }
    }
    
    var isDiff = false
    for s in s2 {
        if let value = dict[s] {
            dict[s]! -= 1
            if value < 0 {
                if isDiff {
                    return false
                }
                isDiff = true
            }
        } else {
            if isDiff {
                return false
            }
            isDiff = true
        }
    }
    
    return true
}

private func isDifferectByOneCharacterInSeq(s1: String, s2: String) -> Bool {
    let arrayS1 = Array(s1)
    let arrayS2 = Array(s2)
    var isDiff = false
    for i in 0..<s1.count {
        if arrayS1[i] != arrayS2[i] {
            if isDiff {
                return false
            }
            isDiff = true
        }
    }
    
    return isDiff == true
}

private func dfsPermutation(array: [String]) -> [[String]] {
    var permutations = [[String]]()
    let nodes = generateAllNodes(array: array)
    var stack = [Node]()
    var visited = Set<Int>()
    var currentpath = [Int]()
    
    for (key, value) in nodes {
        stack.append(Node(index: key, neighbors: value))
    }
    
    while stack.count > 0 {
        var last = stack.last!
        if last.neighbors.count > 0 {
            visited.insert(last.index)
            currentpath.append(last.index)
            if last.neighbors.count > 0 {
                let neighbors = last.neighbors
                last.neighbors.removeAll()
                stack[stack.count-1] = last
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        let allNeighbors = nodes[neighbor]!
                        var temp = [Int]()
                        for next in allNeighbors {
                            if !visited.contains(next) {
                                temp.append(next)
                            }
                        }
                        if temp.count > 0 {
                            stack.append(Node(index: neighbor, neighbors: temp))
                        } else {
                            currentpath.append(neighbor)
                        }
                    }
                }
            } else {
                stack.removeLast()
                visited.remove(currentpath.last!)
                currentpath.removeLast()
            }
            if currentpath.count == array.count {
                permutations.append(currentpath.map { (index) -> String in
                    array[index]
                })
                visited.remove(currentpath.last!)
                currentpath.removeLast()
            }
        } else {
            visited.remove(currentpath.last!)
            currentpath.removeLast()
            stack.removeLast()
        }
    }
    
    return permutations
}

func stringsRearrangement(inputArray: [String]) -> Bool {
    let permutations = dfsPermutation(array: inputArray)
    
    for permutation in permutations {
        var isValid = true
        for i in 1..<permutation.count {
            if !(isDifferectByOneCharacterInSeq(s1: permutation[i], s2: permutation[i-1])) {
                print(permutation[i],permutation[i-1])
                isValid = false
                break
            }
        }
        if isValid {
            return true
        }
    }
    
    return false
}


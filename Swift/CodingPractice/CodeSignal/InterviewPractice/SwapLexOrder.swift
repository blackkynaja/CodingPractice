/*
 https://app.codesignal.com/interview-practice/task/5vXzdE9yzjsoMZ9sk/description
 */

class SwapLexOrder {
    
    // MARK: - Brute Force
    /*
     Time Lmit Exceed + Bad Memory Access
     Tests passed: 6/15
     */
    func generateString(_ str: String, _ pairs: [[Int]], _ currentAnswer: String, _ set: inout Set<String>) -> String {
        set.insert(str)
        var tempAnswer = max(currentAnswer, str)
        
        for pair in pairs {
            var tempStr = Array(str)
            let temp = tempStr[pair[0]-1]
            tempStr[pair[0]-1] = tempStr[pair[1]-1]
            tempStr[pair[1]-1] = temp
            let newStr = String(tempStr)
            if set.contains(newStr) {
                continue
            }
            tempAnswer = max(tempAnswer, generateString(newStr, pairs, tempAnswer, &set))
        }
        
        return tempAnswer
    }
    
    func solution1(str: String, pairs: [[Int]]) -> String {
        var set = Set<String>()
        let ans = generateString(str, pairs, "", &set)
        return ans
    }
    
    // MARK: - Graph
    /*
     - Create edge and vertex from pairs
     - Sort desc part by lexicographical
     - Create new string from sorted path
     */
    func createPath(_ pairs: [[Int]]) -> [Int: Set<Int>] {
        var pathDict = [Int: Set<Int>]()
        var headDict = [Int: Int]()
        
        for pair in pairs {
            let first = pair[0]
            let second = pair[1]
            
            if let head = headDict[first] {
                if let secondHead = headDict[second] {
                    if head == secondHead {
                        continue
                    }
                    pathDict[head]!.formUnion(pathDict[secondHead]!)
                    for point in pathDict[secondHead]! {
                        headDict[point] = head
                    }
                    pathDict[secondHead] = nil
                } else {
                    pathDict[head]!.insert(second)
                    headDict[second] = head
                }
            } else {
                if let head = headDict[second] {
                    pathDict[head]!.insert(first)
                    headDict[first] = head
                } else {
                    headDict[first] = first
                    headDict[second] = first
                    pathDict[first] = [first, second]
                }
            }
        }
        
        return pathDict
    }
    
    func solution2(str: String, pairs: [[Int]]) -> String {
        let paths = createPath(pairs)
        var arrStr = Array(str)
        
        for (_, values) in paths {
            let indexes = values.sorted()
            let newStr = indexes.map{arrStr[$0-1]}.sorted(by: {$0>$1})
            for (index, value) in indexes.enumerated() {
                arrStr[value-1] = newStr[index]
            }
        }
        
        return String(arrStr)
    }
    
    func solution(str: String, pairs: [[Int]]) -> String {
        if pairs.count == 0 {
            return str
        }
        
        return solution2(str: str, pairs: pairs)
    }

}

/*
1 2 3 4 5
 
 4 3 2
*/

/*
 https://leetcode.com/problems/execution-of-all-suffix-instructions-staying-in-a-grid/
 */

class ExecutionofAllSuffixInstructionsStayinginaGrid {
    let moveDict = ["R": (0,1), "L": (0,-1), "D": (1,0), "U": (-1,0)]
        
    func moveRobot(_ n: Int, _ startPos: [Int], _ s: String) -> Int {
        var count = 0
        var currentPos = (startPos[0], startPos[1])
        for c in s {
            let move = moveDict[String(c)]!
            currentPos.0+=move.0
            currentPos.1+=move.1
            if currentPos.0 >= 0 && currentPos.0 < n && currentPos.1 >= 0 && currentPos.1 < n {
                count+=1
            } else {
                return count
            }
        }
        return count
    }
    
    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {
        if n == 1 {
            return s.map { _ in
                return 0
            }
        }
        
        var results = [Int]()
        let arrS = Array(s)
        for i in 0..<s.count {
            let subString = String(arrS[i..<s.count])
            let result = moveRobot(n, startPos, subString)
            results.append(result)
        }
        
        return results
    }
}

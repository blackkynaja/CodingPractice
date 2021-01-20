/*
 https://app.codesignal.com/interview-practice/task/yM4uWYeQTHzYewW9H/description
 */

func solutionToDict(solution: [[Character]]) -> [Character:Character] {
    var dict = [Character:Character]()
    for item in solution {
        dict[item[0]] = item[1]
    }
    return dict
}

func isCryptSolution(crypt: [String], solution: [[Character]]) -> Bool {
    let solutionDict = solutionToDict(solution: solution)
    
    let word1 = crypt[0]
    var word1Num = ""
    for i in 0..<word1.count {
        let s = Array(word1)[i]
        let value = solutionDict[s]!
        if i == 0 && value == "0" && word1.count > 1 {
            return false
        }
        word1Num += String(value)
    }
    
    let word2 = crypt[1]
    var word2Num = ""
    for i in 0..<word2.count {
        let s = Array(word2)[i]
        let value = solutionDict[s]!
        if i == 0 && value == "0" && word2.count > 1 {
            return false
        }
        word2Num += String(value)
    }
    
    let word3 = crypt[2]
    var word3Num = ""
    for i in 0..<word3.count {
        let s = Array(word3)[i]
        let value = solutionDict[s]!
        if i == 0 && value == "0" && word3.count > 1 {
            return false
        }
        word3Num += String(value)
    }
//    print(word1Num,word2Num,word3Num)
    if Int(word1Num)! + Int(word2Num)! != Int(word3Num)! {
        return false
    }
    return true
}

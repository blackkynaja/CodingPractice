/*
 https://leetcode.com/problems/solving-questions-with-brainpower/
 
 Topics: Array, DP
 */

class SolvingQuestionsWithBrainpower {
    var memo = [Int]()
    
    func mostPointsHelper(_ questions: [[Int]], _ start: Int) -> Int {
        count += 1
        if start >= questions.count {
            return 0
        }
        if memo[start] != -1 {
            return memo[start]
        }
        
        let q = questions[start]
        memo[start] = max(mostPointsHelper(questions, start+1), mostPointsHelper(questions, start+1+q[1]) + q[0])
        return memo[start]
    }
    
    func mostPoints(_ questions: [[Int]]) -> Int {
        memo = Array(repeating: -1, count: questions.count)
        let result = mostPointsHelper(questions, 0)
        return result
    }
}

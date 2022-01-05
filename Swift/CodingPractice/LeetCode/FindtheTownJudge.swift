/*
 https://leetcode.com/problems/find-the-town-judge/
 
 Topics: Array, Hash Table, Graph
 */

class FindtheTownJudge {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        if n == 1 {
            return 1
        }
        
        var people = Set<Int>()
        var judge = Set<Int>()
        
        for t in trust {
            people.insert(t[0])
            
            if judge.contains(t[0]) {
                judge.remove(t[0])
            } else if !people.contains(t[1]) {
                judge.insert(t[1])
            }
        }
        
        return judge.count == 1 ? Array(judge).first! : -1
    }
}

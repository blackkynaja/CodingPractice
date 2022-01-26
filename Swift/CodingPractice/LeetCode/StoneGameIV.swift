/*
 https://leetcode.com/problems/stone-game-iv/
 
 Topics: Math, DP, Game Theory
 */

class StoneGameIV {
    var dict = [Int: Bool]()
    
    func dfs(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        
        if n == 1 {
            return true
        }
        
        if let value = dict[n] {
            return value
        }
        
        var i = 1
        while i*i <= n {
            let result = dfs(n-i*i)
            if !result {
                dict[n] = true
                return true
            }
            i += 1
        }
        
        dict[n] = false
        return false
    }
    
    func winnerSquareGame(_ n: Int) -> Bool {
        return dfs(n)
    }
}

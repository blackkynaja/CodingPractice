/*
 https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/
 
 Topics: Array, Hash Table, Matrix, Simulation
 */

class FindWinneronaTicTacToeGame {
    func isWin(_ moves: Set<[Int]>) -> Bool {
        if moves.contains([0,0]) {
            if moves.contains([0,1]) && moves.contains([0,2]) {
                return true
            }
            if moves.contains([1,0]) && moves.contains([2,0]) {
                return true
            }
        }
        
        if moves.contains([1,0]) {
            if moves.contains([1,1]) && moves.contains([1,2]) {
                return true
            }
        }
        
        if moves.contains([0,1]) {
            if moves.contains([1,1]) && moves.contains([2,1]) {
                return true
            }
        }
        
        if moves.contains([2,2]) {
            if moves.contains([2,1]) && moves.contains([2,0]) {
                return true
            }
            if moves.contains([1,2]) && moves.contains([0,2]) {
                return true
            }
        }
        
        if moves.contains([1,1]) {
            if moves.contains([0,2]) && moves.contains([2,0]) {
                return true
            }
            if moves.contains([0,0]) && moves.contains([2,2]) {
                return true
            }
        }
        
        return false
    }
    
    func tictactoe(_ moves: [[Int]]) -> String {
        var a = Set<[Int]>()
        var b = Set<[Int]>()
        
        for (index, move) in moves.enumerated() {
            if index%2 == 0 {
                a.insert(move)
            } else {
                b.insert(move)
            }
        }
        
        if isWin(a) {
            return "A"
        }
        if isWin(b) {
            return "B"
        }
        
        return moves.count == 9 ? "Draw" : "Pending"
    }
}

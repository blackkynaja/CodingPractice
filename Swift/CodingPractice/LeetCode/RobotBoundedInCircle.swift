/*
 https://leetcode.com/problems/robot-bounded-in-circle/
 
 Topics: Math, String, Simulation
 */

class RobotBoundedInCircle {
    func isRobotBounded(_ instructions: String) -> Bool {
        // GGLGRGRGRG
        var direction = 0
        var pos = (0,0)
        let move = [(0,1),(1,0),(0,-1),(-1,0)]
        var i = 1
        
        while i <= 4 {
            for s in instructions {
                if s == "G" {
                    pos.0+=move[direction].0
                    pos.1+=move[direction].1
                } else {
                    if s == "L" {
                        direction-=1
                    } else if s == "R" {
                        direction+=1
                    }
                    if direction == -1 {
                    direction = 3
                    }
                    direction = direction%4
                }
            }
            i+=1
            if pos == (0,0) {
                return true
            }
        }
        return false
    }
}

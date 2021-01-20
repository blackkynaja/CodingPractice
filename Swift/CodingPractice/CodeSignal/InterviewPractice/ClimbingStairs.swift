/*
 https://app.codesignal.com/interview-practice/task/oJXTWuwEZiC6FTw3A/description
 */

func climbingStairsHelper(n: Int) -> Int {
    if n == 1 || n == 0 {
        return 1
    } else {
        return climbingStairsHelper(n: n-1) + climbingStairsHelper(n: n-2)
    }
}

func climbingStairs(n: Int) -> Int {
    climbingStairsHelper(n: n)
}

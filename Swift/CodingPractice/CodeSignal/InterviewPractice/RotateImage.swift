/*
 https://app.codesignal.com/interview-practice/task/5A8jwLGcEpTPyyjTB/description
 */

func rotateImage(a: [[Int]]) -> [[Int]] {
    var b = a.map{$0}
    for i in 0..<a.count {
        for j in 0..<a[i].count {
            b[i][a[i].count-j-1] = a[j][i]
        }
    }
    return b
}

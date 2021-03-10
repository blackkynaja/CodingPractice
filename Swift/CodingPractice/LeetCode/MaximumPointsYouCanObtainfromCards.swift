/*
 https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/
 Array, DP, Slicing Window
 */

// DP
//func maxScoreHelper(_ cardPoints: [Int], _ k: Int, _ indexStart: Int, _ indexEnd: Int, _ round: Int, _ array: inout [[Int]]) -> Int {
//    if round == k {
//        return 0
//    }
//    if array[indexStart][round] != -1 {
//        return array[indexStart][round]
//    }
//
//    let head = cardPoints[indexStart] + maxScoreHelper(cardPoints, k, indexStart+1, indexEnd, round+1, &array)
//    let tail = cardPoints[indexEnd] + maxScoreHelper(cardPoints, k, indexStart, indexEnd-1, round+1, &array)
//    let result = max(head, tail)
//    array[indexStart][round] = result
//    return result
//}
//
//func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
//    var array = [[Int]](repeating: [Int](repeating: -1, count: cardPoints.count), count: cardPoints.count)
//    return maxScoreHelper(cardPoints, k, 0, cardPoints.count-1, 0, &array)
//}

func getWindowSums(_ cardPoints: [Int], _ k: Int) -> [Int] {
    let n = cardPoints.count-k
    var tempSum = Array(cardPoints[0..<n]).reduce(0, {$0+$1})
    var results = [tempSum]
    for i in 1...cardPoints.count-n {
        tempSum-=cardPoints[i-1]
        tempSum+=cardPoints[i+n-1]
        results.append(tempSum)
    }
    return results
}

func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
    var max = 0
    let totalPoint = cardPoints.reduce(0, {$0+$1})
    let windowSums = getWindowSums(cardPoints, k)
    for windowSum in windowSums {
        if totalPoint-windowSum > max {
            max = totalPoint-windowSum
        }
    }
    return max
}

//[11,49,100,20,86,29,72]

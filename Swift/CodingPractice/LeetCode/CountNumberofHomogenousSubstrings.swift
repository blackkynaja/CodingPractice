/*
 https://leetcode.com/problems/count-number-of-homogenous-substrings/
 */

func countHomogenous(_ s: String) -> Int {
    let arrayS = Array(s)
    var culmutatives = [Int]()
    for (index, _) in arrayS.enumerated() {
        if index == 0 {
            culmutatives.append(1)
        } else {
            if arrayS[index] == arrayS[index-1] {
                culmutatives.append(culmutatives[index-1]+1)
            } else {
                culmutatives.append(1)
            }
        }
    }
    return culmutatives.reduce(0, {$0+$1})%1000000007
}

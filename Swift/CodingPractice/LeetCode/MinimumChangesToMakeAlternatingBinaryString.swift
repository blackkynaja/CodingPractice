/*
 https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/
 */

class MinimumChangesToMakeAlternatingBinaryString {
    func minOperations(_ s: String) -> Int {
        var matchPattern1 = 0
        var matchPattern2 = 0
        let arrS = Array(s)
        
        for (index, value) in arrS.enumerated() {
            if index%2==0 {
                if value == "0" {
                    matchPattern1+=1
                } else {
                    matchPattern2+=1
                }
            } else {
                if value == "0" {
                    matchPattern2+=1
                } else {
                    matchPattern1+=1
                }
            }
        }
        
        return min(matchPattern1, matchPattern2)
    }
}

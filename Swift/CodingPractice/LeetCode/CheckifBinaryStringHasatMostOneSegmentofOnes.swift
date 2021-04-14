/*
 https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/
 */

class CheckifBinaryStringHasatMostOneSegmentofOnes {
    func checkOnesSegment(_ s: String) -> Bool {
        var foundZero = false
        let arrS = Array(s)
        for (_, value) in arrS.enumerated() {
            if value == "1" {
                if foundZero == true {
                    return false
                }
            } else {
                foundZero = true
            }
        }

        return true
    }
}

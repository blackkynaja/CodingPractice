/*
 https://leetcode.com/problems/longest-common-prefix/
 */

class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var index = 0
        var isDiff = false
        var ans = [String.Element]()
        while (!isDiff) {
            if index >= strs.first!.count {
                break
            }
            let temp = Array(strs.first!)[index]
            for s in strs {
                let arrS = Array(s)
                if index >= arrS.count {
                    isDiff = true
                    break
                }
                if arrS[index] != temp {
                    isDiff = true
                    break
                }
            }
            index+=1
            if !isDiff {
                ans.append(temp)
            }
        }
        return String(ans)
    }
}

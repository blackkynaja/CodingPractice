/*
 https://leetcode.com/problems/shortest-word-distance/
 
 Topics: Array, String
 */

class ShortestWordDistance {
    func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
        var w1 = -1
        var w2 = -1
        var result = wordsDict.count

        for (index, word) in wordsDict.enumerated() {
            if word == word1 {
                w1 = index
            } else if word == word2 {
                w2 = index
            }

            if w1 != -1 && w2 != -1 {
                result = min(result, abs(w1-w2))
            }
        }

        return result
    }
}

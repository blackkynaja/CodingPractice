/*
 https://leetcode.com/problems/shortest-word-distance-ii/
 
 Topics: Array, Hash Table, Two Pointers, String, Design
 */

class ShortestWordDistanceII {
    
    // MARK: - Solution1
    /*
     - Create dict of indexes of all the word in wordsDict
     - Loop through index by creating two pointers
     - Because index cannot be negative, we can find min distance by increase pointer which has larger index
     - Track min distance between indexes[index]
     */
    class WordDistance1 {
        let wordsDict: [String]
        var dict = [String: [Int]]()
        
        init(_ wordsDict: [String]) {
            self.wordsDict = wordsDict
            
            for (index, word) in wordsDict.enumerated() {
                if let _ = dict[word] {
                    dict[word]!.append(index)
                } else {
                    dict[word] = [index]
                }
            }
        }
        
        func shortest(_ word1: String, _ word2: String) -> Int {
            
            let indexes1 = dict[word1]!
            let indexes2 = dict[word2]!
            var index1 = 0
            var index2 = 0
            var result = wordsDict.count
            
            while index1 < indexes1.count && index2 < indexes2.count {
                result = min(result, abs(indexes1[index1]-indexes2[index2]))
                
                if indexes1[index1] < indexes2[index2] {
                    index1 += 1
                } else {
                    index2 += 1
                }
            }

            return result
        }
    }
    
    // MARK: - Solution 2
    /*
     - Create two pointer given initial index to -1
     - When word is found update pointer of the value
     - Track min distance between two pointer
     */
    class WordDistance2 {
        
        let wordsDict: [String]
        
        init(_ wordsDict: [String]) {
            self.wordsDict = wordsDict
        }
        
        func shortest(_ word1: String, _ word2: String) -> Int {
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
    
    // MARK: - Solution
    let solution: WordDistance1
    
    init(_ wordsDict: [String]) {
        solution = WordDistance1(wordsDict)
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        return solution.shortest(word1, word2)
    }
}


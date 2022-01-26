/*
 https://leetcode.com/problems/largest-merge-of-two-strings/
 
 Topics: Two Pointers, String, Greedy
 */

class LargestMergeOfTwoStrings {
    func compareWord(_ i: Int, _ word1: [String.Element], _ j: Int, _ word2: [String.Element]) -> Bool {
        var tempI = i
        var tempJ = j
        while tempI < word1.count && tempJ < word2.count {
            if word1[tempI] == word2[tempJ] {
                tempI+=1
                tempJ+=1
            } else if word1[tempI] > word2[tempJ] {
                return true
            } else {
                return false
            }
        }
        
        if tempI >= word1.count {
            return false
        }
        
        return true
    }
    
    func largestMerge(_ word1: String, _ word2: String) -> String {
        var i = 0
        var j = 0
        var word = ""
        let arrWord1 = Array(word1)
        let arrWord2 = Array(word2)
        
        while i < arrWord1.count && j < arrWord2.count {
            if arrWord1[i] > arrWord2[j] {
                word.append(arrWord1[i])
                i+=1
            } else if (arrWord1[i] < arrWord2[j]) {
                word.append(arrWord2[j])
                j+=1
            } else {
                let isTop = compareWord(i, arrWord1, j, arrWord2)
                if isTop {
                    word.append(arrWord1[i])
                    i+=1
                } else {
                    word.append(arrWord2[j])
                    j+=1
                }
            }
        }
        
        if i < arrWord1.count {
            for index in i..<arrWord1.count {
                word.append(arrWord1[index])
            }
        }
        
        if j < arrWord2.count {
            for index in j..<arrWord2.count {
                word.append(arrWord2[index])
            }
        }
        
        return word
    }
}

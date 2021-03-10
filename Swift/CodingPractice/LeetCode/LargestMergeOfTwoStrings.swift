/*
 https://leetcode.com/problems/largest-merge-of-two-strings/submissions/
 */
class LargestMergeOfTwoStrings {
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
                var isTop = true
                var tempI = i
                var tempJ = j
                while tempI < arrWord1.count && tempJ < arrWord2.count {
                    if arrWord1[tempI] == arrWord2[tempJ] {
                        tempI+=1
                        tempJ+=1
                    } else if arrWord1[tempI] > arrWord2[tempJ] {
                        break
                    } else {
                        isTop = false
                        break
                    }
                }
                
                if tempI >= arrWord1.count {
                    isTop = false
                }
                
                if tempJ >= arrWord2.count {
                    isTop = true
                }
                
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


//" uguuuuguugguggggggguuggguuggggggg"

/*
 https://leetcode.com/problems/letter-case-permutation/
 */

class LetterCasePermutation {
    func letterCasePermutationHelper(_ s: [String.Element],_ temp: String,_ index: Int,_ results: inout [String]) {
        if (index == s.count)  {
            results.append(temp)
            return
        }
        if (s[index].isLetter) {
            var newLowerString = temp
            newLowerString.append(s[index].lowercased())
            letterCasePermutationHelper(s, newLowerString, index+1, &results)
            
            var newUpperString = temp
            newUpperString.append(s[index].uppercased())
            letterCasePermutationHelper(s, newUpperString, index+1, &results)
        } else {
            var nextString = temp
            nextString.append(s[index])
            letterCasePermutationHelper(s, nextString, index+1, &results)
        }
    }
    
    func letterCasePermutation(_ S: String) -> [String] {
        var results = [String]()
        letterCasePermutationHelper(Array(S), "", 0, &results)
        return results
    }
}

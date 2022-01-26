/*
 https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 
 Topics: Hash Table, String, Backtracking
 */

class LetterCombinationsOfAPhoneNumber {
    func letterCombinations(_ digits: String) -> [String] {
        let letterComb = [2: "abc", 3: "def", 4: "ghi", 5: "jkl", 6: "mno", 7: "pqrs", 8: "tuv", 9: "wyxz"]
        var results = [String]()
        for c in digits {
          var temp = [String]()
          if let d = c.wholeNumberValue {
            if let letter = letterComb[d] {
              for l in letter {
                if results.count > 0 {
                  for result in results {
                    let combString = result+String(l)
                    temp.append(combString)
                  }
                } else {
                  temp.append(String(l))
                }
              }
              results = temp
            }
          }
        }
        
        return results
    }
}

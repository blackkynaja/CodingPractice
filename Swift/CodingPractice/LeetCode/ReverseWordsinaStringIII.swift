/*
 https://leetcode.com/problems/reverse-words-in-a-string-iii/
 
 Topics: Two Pointers, String
 */

class ReverseWordsinaStringIII {
    func reverseWords(_ s: String) -> String {
        var results = [String]()
        for word in s.split(separator: " ") {
            let r = String(word.reversed())
            results.append(r)
        }
        return results.joined(separator: " ")
    }
}

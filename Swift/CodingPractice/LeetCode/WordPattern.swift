/*
 https://leetcode.com/problems/word-pattern/
 
 Topics: Hash Table, String
 */

class WordPattern {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var arr = s.components(separatedBy: " ")
        
        if arr.count != pattern.count {
            return false
        }
        
        var dictP = [String.Element: String]()
        var set = Set<String>()
        
        for (index, value) in pattern.enumerated() {
            if let word = dictP[value] {
                if word != arr[index] {
                    return false
                }
            } else {
                if !set.contains(arr[index]) {
                    dictP[value] = arr[index]
                    set.insert(arr[index])
                } else {
                    return false
                }
            }
        }
        
        return true
    }
}

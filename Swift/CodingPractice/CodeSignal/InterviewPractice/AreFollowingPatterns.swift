/*
 https://app.codesignal.com/interview-practice/task/3PcnSKuRkqzp8F6BN/description
 */

func areFollowingPatterns(strings: [String], patterns: [String]) -> Bool {
    var dict = [String: String]()
    var patternSet = Set([String]())
    
    for i in 0..<strings.count {
        let stringItem = strings[i]
        let patternItem = patterns[i]
        if let item = dict[stringItem] {
            if item != patternItem {
                return false
            }
        } else {
            if patternSet.contains(patternItem) {
                return false
            } else {
                dict[stringItem] = patterns[i]
                patternSet.insert(patternItem)
            }
        }
    }
    
    return true
}

/*
 https://app.codesignal.com/interview-practice/task/uX5iLwhc6L5ckSyNC/description
 */

func firstNotRepeatingCharacter(s: String) -> Character {
    var founded = Set([Character]())
    var unique = [Character]()
    
    for item in Array(s) {
        if !founded.contains(item) {
            founded.insert(item)
            unique.append(item)
        } else {
            unique.removeAll { (c) -> Bool in
                return c == item
            }
        }
    }
    
    return unique.first ?? "_"
}

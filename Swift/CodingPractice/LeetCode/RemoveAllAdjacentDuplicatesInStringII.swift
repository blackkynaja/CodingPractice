/*
 https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
 */

private struct CharacterApp {
    var s: String.Element
    var freq: Int
}

func removeDuplicates(_ s: String, _ k: Int) -> String {
    let arrayString = Array(s)
    var index = 0
    var stack = [CharacterApp]()
    
    while index < arrayString.count {
        let char = arrayString[index]
        if stack.count == 0 {
            let charApp = CharacterApp(s: char, freq: 1)
            stack.append(charApp)
        } else {
            let peek = stack.last!
            if peek.s == char {
                let freq = peek.freq+1
                if freq == k {
                    for _ in 1..<k {
                        stack.removeLast()
                    }
                } else {
                    let charApp = CharacterApp(s: char, freq: freq)
                    stack.append(charApp)
                }
            } else {
                let charApp = CharacterApp(s: char, freq: 1)
                stack.append(charApp)
            }
        }
        index+=1
    }
    
    return String(stack.map{$0.s})
}

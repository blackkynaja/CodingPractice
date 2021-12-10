func longestDigitsPrefix(inputString: String) -> String {
    var index = 0
    for c in inputString {
        if let _ = Int(String(c)) {
            index+=1
        } else {
            break
        }
    }
    return String(inputString.prefix(index))
}

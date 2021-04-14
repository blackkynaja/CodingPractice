/*
 https://leetcode.com/problems/long-pressed-name/
 */

class LongPressedName {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var nameIndex = 0
        var typedIndex = 0
        let arrName = Array(name)
        let arrTyped = Array(typed)
        var last = arrName[0]
        
        while (nameIndex < name.count) {
            if typedIndex == arrTyped.count {
                return false
            }
            
            if arrName[nameIndex] == arrTyped[typedIndex] {
                last = arrName[nameIndex]
                nameIndex+=1
                typedIndex+=1
            } else {
                if last == arrTyped[typedIndex] {
                    typedIndex+=1
                } else {
                    return false
                }
            }
        }
        
        for i in typedIndex..<arrTyped.count {
            if arrTyped[i] != last {
                return false
            }
        }
        
        return true
    }
}

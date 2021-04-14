/*
 https://leetcode.com/problems/add-binary/
 */

class AddBinary {
    func addBinary(_ a: String, _ b: String) -> String {
        let length = max(a.count, b.count)
        var results = [String.Element](repeating: "0", count: length+1)
        let arrA = Array(a)
        let arrB = Array(b)
        
        var carry = 0
        var i = 0
        while(i < length) {
            let indexA = a.count-i-1
            let indexB = b.count-i-1
            
            let reA = indexA >= 0 ? Int(arrA[indexA].asciiValue! - Character("0").asciiValue!) : 0
            let reB = indexB >= 0 ? Int(arrB[indexB].asciiValue! - Character("0").asciiValue!) : 0
            
            let tempResult = reA+reB+carry
            carry = tempResult/2==1 ? 1 : 0
            results[results.count-i-1] = Character(String(tempResult%2))
            i+=1
        }
        
        if (carry == 1) {
            results[0] = "1"
        } else {
            results.removeFirst()
        }
        
        return String(results)
    }
}

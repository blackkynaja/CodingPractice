/*
 https://leetcode.com/problems/decode-string/description/
 */

class DecodeString {
    func isContainBracket(_ arrS: [String.Element]) -> Bool {
        return arrS.contains("[")
    }
    
    func getCloseBracketIndex(_ arrS: [String.Element], _ start: Int) -> Int {
        var openB = 0
        var foundOpen = false
        var end = start
        while (!foundOpen) {
            let c = arrS[end]
            if c == "[" {
                openB+=1
            } else if c == "]" {
                if openB == 0 {
                    foundOpen = true
                } else {
                    openB-=1
                }
            }
            end+=1
        }
        
        return end
    }
    
    func decodeString(_ input: String) -> String {
        var arrS = Array(input)
        var results = [String.Element]()
        
        while (isContainBracket(arrS)) {
            var i = 0
            while (i < arrS.count) {
                let s = arrS[i]
                if s >= "0" && s <= "9" {
                    var num = [s]
                    var insideIndex = i+1
                    while (arrS[insideIndex] >= "0" && arrS[insideIndex] <= "9") {
                        num.append(arrS[insideIndex])
                        insideIndex+=1
                    }
                    
                    let startIndex = insideIndex+1
                    let endIndex = getCloseBracketIndex(arrS, startIndex)
                    let number = Int(String(num))!
                    let sliceString = arrS[startIndex..<endIndex-1]
                    for _ in 0..<number {
                        results.append(contentsOf: sliceString)
                    }
                    i = endIndex
                } else {
                    results.append(s)
                    i+=1
                }
            }
            arrS = results
            results.removeAll()
        }
        
        return String(arrS)
        
    }
}




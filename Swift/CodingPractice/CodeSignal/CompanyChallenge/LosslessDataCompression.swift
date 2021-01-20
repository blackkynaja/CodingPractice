/* Company: Dropbox
 https://app.codesignal.com/company-challenges/dropbox/7mqgw4QPQwPPgpRgu
 */

func findLength(window: [String.Element], startIndex: Int, inputStringArray: [String.Element]) -> (Int,Int) {
    var index = startIndex
    var length = 0
    var returnIndex = -1
    for i in 0..<window.count {
        if window[i] == inputStringArray[index] {
            var j = i+1
            let foundedIndex = i
            var tempLength = 1
            index+=1
            while (j < window.count && index < inputStringArray.count) {
                if window[j] != inputStringArray[index] {
                    break
                }
                j+=1
                index+=1
                tempLength+=1
            }
            if tempLength > length {
                length = tempLength
                returnIndex = foundedIndex
            }
            index = startIndex
        }
    }
    
    return (returnIndex,length)
}

func losslessDataCompression(inputString: String, width: Int) -> String {
    let inputStringArray = Array(inputString)
    var windowIndex = 0
    var window: String = ""
    var result = ""
    var i = 0
    while(i < inputStringArray.count) {
        let s = inputStringArray[i]
        if window.count == 0 {
            window = String(s)
            result += window
            i+=1
        } else {
            let (firstIndex, length) = findLength(window: Array(window), startIndex: i, inputStringArray: inputStringArray)
            if length == 0 {
                result += String(s)
                i+=1
                if window.count < width {
                    window.append(s)
                } else {
                    window.removeFirst()
                    window.append(s)
                    windowIndex+=1
                }
            } else {
                result += "(\(firstIndex+windowIndex),\(length))"
                i+=length
                windowIndex = i-width < 0 ? 0 : i-width
                window = String(inputStringArray[windowIndex..<i])
            }
        }
    }
    
    return result
}

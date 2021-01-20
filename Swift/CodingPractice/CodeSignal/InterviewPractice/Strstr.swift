/*
 https://app.codesignal.com/interview-practice/task/C8Jdyk3ybixqQdAvM/description
 */

func getlps(arrPat: [String.Element]) -> [Int] {
    var len = 0
    var lps = [Int](repeating: 0, count: arrPat.count)
    var i = 1
    
    while i < arrPat.count {
        if arrPat[i] == arrPat[len] {
            len+=1
            lps[i] = len
            i+=1
        } else {
            if len != 0 {
                len = lps[len-1]
            } else {
                lps[i] = 0
                i+=1
            }
        }
    }
    
    return lps
}

func strstr(s: String, x: String) -> Int {
    let arrS = Array(s)
    let arrPat = Array(x)
    var i = 0
    var j = 0
    
    let lps = getlps(arrPat: arrPat)
    
    while i < arrS.count {
        if arrPat[j] == arrS[i] {
            i+=1
            j+=1
        }
        
        if j == arrPat.count {
            return i-arrPat.count
        } else if i < arrS.count {
            if arrPat[j] != arrS[i] {
                if j != 0 {
                    j = lps[j-1]
                } else {
                    i+=1
                }
            }
        }
    }
    
    return -1
}

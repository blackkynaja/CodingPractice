/*
 https://leetcode.com/problems/divide-a-string-into-groups-of-size-k/
 
 Topics:
 */

class DivideaStringIntoGroupsofSizek {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        let arr = Array(s)
        var len = arr.count/k
        
        if arr.count%k != 0 {
            len += 1
        }
        
        var results = [String]()
        var temp = [String.Element]()
        for i in 0..<len*k {
            if i < arr.count {
                temp.append(arr[i])
            } else {
                temp.append(fill)
            }
            if (i+1)%k == 0 {
                results.append(String(temp))
                temp = [String.Element]()
            }
        }
        
        return results
    }
}

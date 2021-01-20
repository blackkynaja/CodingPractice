/*
 Find a pair in array that has the follwing condition
 arr[i] + reverseArr[j] = arr[j] + reverseArr[i]
 
 [1,11,20,2]
 
 1 + 11 = 11 + 1
 1 + 2 = 20 + 1 X
 1 + 2 = 2 + 1
 11 + 2 = 20 + 11 X
 */

func oppositeSums(array: [Int]) -> Int {
    var resultArr = [Int:Int]()
    var count = 0
    for a in array {
        let reA = Int(String(String(a).reversed()))!
        let diff = a - reA
        if let _ = resultArr[diff] {
            resultArr[diff]!+=1
        } else {
            resultArr[diff] = 1
        }
    }
    
    for (_, value) in resultArr {
        if value > 1 {
            count += value*(value-1)/2
        }
    }
    
    return count
}

/*
 Brute Force Solution
 */
func checkOppositeSums(array: [Int]) -> Int {
    var count = 0
    for i in 0..<array.count {
        for j in i+1..<array.count {
            let a = array[i]
            let reA = Int(String(String(a).reversed()))!
            let b = array[j]
            let reB = Int(String(String(b).reversed()))!
            if a + reB == b + reA {
                count+=1
            }
        }
    }
    
    return count
}

/*
 Test Example
 let array = [1,11,20,2,22,13,5]
 let array1 = [1,1,1,1,1]
 let array2 = Array(1...30)
 let array3 = Array(1...200)
 */

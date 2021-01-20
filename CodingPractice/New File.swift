func efficientJanitor(weight: [Float]) -> Int {
    var count = 0
    var temp = 0.0 as Float
    let bags = weight.sorted()
    var bagDict = [Float: Int]()
    print(bags)
    for bag in bags {
        if let _ = bagDict[bag] {
            bagDict[bag]!+=1
        } else {
            bagDict[bag] = 1
        }
    }
    
    var i = 0
    var max = bags.count-1
    
    while (i < bags.count) {
        let bag = bags[i]
        temp += bag
        bagDict[bag]!-=1
        var maxBag = bags[max]
        var isValid = true
        while isValid && max > i {
            if maxBag + temp > 3.0 || bagDict[maxBag]! <= 0 {
                max-=1
                maxBag = bags[max]
            } else {
                isValid = false
            }
        }
        
        if i >= max {
            count+=1
            break
        }
        
        bagDict[maxBag]! -= 1
        temp += maxBag
        
        count+=1
        temp = 0
        i+=1
    }
    
    for index in i..<bags.count {
        let tempBag = bags[index]
        count += bagDict[tempBag]!
        bagDict[tempBag]! = 0
    }
    return count
}

//var bags = [1.01, 1.05, 1.09, 1.09, 1.09, 1.1, 1.11, 1.11, 1.12, 1.12, 1.14, 1.17, 1.17, 1.19, 1.2, 1.21, 1.21, 1.23, 1.25, 1.27, 1.27, 1.28, 1.31, 1.31, 1.31, 1.32, 1.32, 1.33, 1.33, 1.35, 1.35, 1.35, 1.37, 1.37, 1.37, 1.38, 1.39, 1.4, 1.41, 1.41, 1.41, 1.42, 1.43, 1.44, 1.45, 1.45, 1.46, 1.46, 1.47, 1.47, 1.49, 1.49, 1.49, 1.5, 1.5, 1.52, 1.53, 1.55, 1.56, 1.57, 1.57, 1.59, 1.61, 1.63, 1.63, 1.65, 1.65, 1.66, 1.68, 1.68, 1.69, 1.69, 1.71, 1.72, 1.73, 1.73, 1.75, 1.76, 1.77, 1.77, 1.81, 1.82, 1.82, 1.83, 1.86, 1.86, 1.87, 1.89, 1.89, 1.89, 1.89, 1.89, 1.92, 1.93, 1.93, 1.94, 1.94, 1.95, 1.96, 1.97, 1.98, 1.98, 1.99, 2.0, 2.02, 2.02, 2.03, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.07, 2.11, 2.12, 2.12, 2.13, 2.14, 2.14, 2.15, 2.15, 2.15, 2.17, 2.17, 2.19, 2.19, 2.2, 2.21, 2.23, 2.25, 2.25, 2.25, 2.25, 2.29, 2.29, 2.29, 2.29, 2.29, 2.29, 2.33, 2.34, 2.36, 2.36, 2.37, 2.39, 2.4, 2.43, 2.45, 2.45, 2.45, 2.45, 2.47, 2.47, 2.47, 2.48, 2.48, 2.49, 2.51, 2.53, 2.53, 2.53, 2.53, 2.56, 2.57, 2.57, 2.6, 2.61, 2.61, 2.61, 2.63, 2.63, 2.65, 2.67, 2.67, 2.67, 2.69, 2.71, 2.73, 2.76, 2.77, 2.77, 2.77, 2.81, 2.83, 2.85, 2.88, 2.89, 2.89, 2.89, 2.92, 2.93, 2.93, 2.93, 2.93, 2.93, 2.95, 2.97, 2.98, 2.99] as [Float]
//var bags = [1.01,1.02,1.2,1.2,1.3,2,2,2,3,3,3,1,1,1] as [Float]
//print(efficientJanitor(weight: bags))

func sumInLenGrid(grid: [[Int]], startRow: Int, startColumn: Int, length: Int) -> Int {
    let endRow = startRow+length
    let endColumn = startColumn+length
    var sum = 0
    for row in startRow..<endRow {
        for column in startColumn..<endColumn {
            sum += grid[row][column]
        }
    }
//    print(length,startRow,startColumn)
    return sum
}

func largestSubgrid(grid: [[Int]], maxSum: Int) -> Int {
    // Write your code here
    var maxReturn = maxSum
    var len = 1
    while len <= grid.count {
        if len == 1 {
            var max = grid[0][0]
            for row in 0..<grid.count {
                for column in 0..<grid[row].count {
                    if grid[row][column] > max {
                        max = grid[row][column]
                    }
                }
            }
            maxReturn = max
        } else {
            var max = 0
            for row in 0..<grid.count-len+1 {
                for column in 0..<grid[row].count-len+1 {
                    let sum = sumInLenGrid(grid: grid, startRow: row, startColumn: column, length: len)
                    if sum > max {
                        max = sum
                    }
                }
            }
            maxReturn = max
        }
//        print(len, maxReturn)
        if maxReturn > maxSum {
            return len-1
        } else if maxReturn == maxSum {
            return len
        }
        len+=1
    }
    
    return grid.count
}

//var grid = [[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3],[4,4,4,4,4],[5,5,5,5,5]]
//print(largestSubgrid(grid: grid, maxSum: 1500))

func prison(n: Int, m: Int, h: [Int], v: [Int]) -> Int {
    // Write your code here
    let sortH = h.sorted()
    let sortV = v.sorted()
    
    var tempH = 1
    var maxH = 1
    for i in 0..<sortH.count-1 {
        if sortH[i] == sortH[i+1]-1 {
            tempH+=1
            maxH = tempH
        } else {
            tempH = 1
        }
    }
    
    var tempV = 1
    var maxV = 1
    for i in 0..<sortV.count-1 {
        if sortV[i] == sortV[i+1]-1 {
            tempV+=1
            maxV = tempV
        } else {
            tempV = 1
        }
    }
    
    print(maxH,maxV)
    return (maxH+1)*(maxV+1)

}

//var h = [1,2,8,9,10]
//var v = [1,2,8,9,10]
//print(prison(n: 100, m: 100, h: h, v: v))

/* Company Challenge: Dropbox*/
/*
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

print(losslessDataCompression(inputString: "abacabadabacaba", width: 7))
*/

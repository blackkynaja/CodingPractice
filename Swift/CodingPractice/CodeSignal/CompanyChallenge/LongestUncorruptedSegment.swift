/*
 Company: Pure Storage
 */

func longestUncorruptedSegment(sourceArray: [Int], destinationArray: [Int]) -> [Int] {
    var longestStartPoint = 0
    var tempLength = 0
    var segments = [Int:Int]()
    for i in 0..<sourceArray.count {
        if sourceArray[i] == destinationArray[i] {
            tempLength+=1
        } else {
            if tempLength > 0 {
                segments[longestStartPoint] = tempLength
            }
            longestStartPoint = i+1
            tempLength = 0
        }
    }
    
    if tempLength > 0 {
        segments[longestStartPoint] = tempLength
    }
    
    if let maxSegment = segments.max(by: {$0.value < $1.value}) {
        return [maxSegment.value, maxSegment.key]
    }
    
    return [0,0]
}


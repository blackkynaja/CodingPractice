import Foundation

// Problem: Merge two arrays of intervals

// Given 2 arrays of intervals.

// Interval is defined with left and right border and discrete points, like [2, 3], [0, 0], etc.

// Array of intervals is non intersected array of sorted intervals, for example: [0, 0], [2, 2], [5, 10] is a valid array of intervals, but [0, 1], [1, 2] is not valid, because you can write it as [0, 2]. [0, 2], [1, 5] is not valid as well, since these two intervals intersect.

// You need to find the AND operation of these two arrays. For example:

// 1st array: [0, 2], [5, 10], [16, 20] = {0, 1, 2, 5, 6... 10, 16.. 20}
// 2nd array: [1, 5], [10, 18], [20, 23] = {1..5, ...}


// AND Result: [1, 2], [5, 5], [10, 10], [16, 18], [20, 20]

public class MergeTwoIntervalArray {
    func isIntersect(array1: [Int], array2: [Int]) -> Bool {
        if (array1[0] < array2[0]) {
            return array1[1] >= array2[0]
        } else if (array1[0] > array2[0]) {
            return array2[1] >= array1[0]
        }
        return true
    }

    func getIntersect(array1: [Int], array2: [Int]) -> [Int] {
        return [max(array1[0], array2[0]), min(array1[1], array2[1])]
    }

    public func mergeIntervalArray(array1: [[Int]], array2: [[Int]]) -> [[Int]] {
        var results = [[Int]]()
        var index1 = 0
        var index2 = 0
        
        while (index1 < array1.count && index2 < array2.count) {
            let interval1 = array1[index1]
            let interval2 = array2[index2]
            if (isIntersect(array1: interval1, array2: interval2)) {
                let temp = getIntersect(array1: array1[index1], array2: array2[index2])
                results.append(temp)
            }
            
            if (interval1[1] < interval2[1]) {
                index1+=1
            } else if (interval1[1] > interval2[1]) {
                index2+=1
            } else {
                if (interval1[0] < interval2[0]) {
                    index1+=1
                } else {
                    index2+=1
                }
            }
        }
        
        return results
    }
}

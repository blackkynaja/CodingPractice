/*
 https://leetcode.com/problems/range-frequency-queries/
 
 Topics: Array, Hash Table, Binary Search, Design
 */

class RangeFreqQuery {
    
    let array = [Int]()
    var dict = [Int: [Int]]()

    init(_ arr: [Int]) {
        for (index, value) in arr.enumerated() {
            if let _ = dict[value]{
                dict[value]!.append(index)
            } else {
                dict[value] = [index]
            }
        }
    }
    
    func binarySearchIndex(_ index: Int, _ arr: [Int]) -> Int {
        var left = 0
        var right = arr.count-1
        var mid = (right+left)/2
        
        while(left < right) {
            let value = arr[mid]
            
            if index > value {
                left = mid + 1
            } else if index < value {
                right = mid - 1
            } else {
                return mid
            }
            mid = (right+left)/2
        }
        return mid
    }
    
    func query(_ left: Int, _ right: Int, _ value: Int) -> Int {
        guard let arr = dict[value] else { return 0 }
    
        var leftB = binarySearchIndex(left, arr)
        leftB = left > arr[leftB] ? leftB+1 : leftB
        var rightB = binarySearchIndex(right, arr)
        rightB = right < arr[rightB] ? rightB-1 : rightB
        return rightB - leftB + 1
    }
}

/**
 * Your RangeFreqQuery object will be instantiated and called as such:
 * let obj = RangeFreqQuery(arr)
 * let ret_1: Int = obj.query(left, right, value)
 */

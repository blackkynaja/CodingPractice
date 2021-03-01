/*
 https://leetcode.com/problems/equal-sum-arrays-with-minimum-number-of-operations/submissions/
 */

import Foundation

func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var count = 0
    var ascSum = nums1.reduce(0, {$0+$1})
    var descSum = nums2.reduce(0, {$0+$1})
    var ascNum = [Int]()
    var descNum = [Int]()
    let max = 6
    let min = 1
    
    if ascSum < descSum {
        ascNum = nums1.sorted()
        descNum = nums2.sorted().reversed()
    } else {
        ascNum = nums2.sorted()
        descNum = nums1.sorted().reversed()
    }
    
    ascSum = ascNum.reduce(0, {$0+$1})
    descSum = descNum.reduce(0, {$0+$1})
    
    var ascIndex = 0
    var descIndex = 0
    var tempDiff = descSum - ascSum
    
    while ascSum != descSum {
        
        if descIndex >= descNum.count && ascIndex >= ascNum.count {
            return -1
        }
        
        var shouldPickASC = true
        
        if ascIndex >= ascNum.count {
            shouldPickASC = false
        } else {
            if descNum[descIndex] - min > max - ascNum[ascIndex] {
                shouldPickASC = false
            }
        }
        
        if !shouldPickASC {
            let diff = tempDiff > descNum[descIndex] - min ? descNum[descIndex] - min : tempDiff
            descSum-=diff
            descNum[descIndex]-=diff
            descIndex+=1
        } else {
            let diff = tempDiff > max - ascNum[ascIndex] ? max - ascNum[ascIndex] : tempDiff
            ascSum+=diff
            ascNum[ascIndex]+=diff
            ascIndex+=1
        }
        tempDiff = descSum - ascSum
        count+=1
    }
    
    return count
}

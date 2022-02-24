//
//  MinimizeDeviationinArray.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/19/22.
//

class MinimizeDeviationinArray {
    
    // MARK: - Sorted
    /*
     - Time Exceeded
     */
    func minimumDeviation2(_ nums: [Int]) -> Int {
        
        let length = nums.count
        var sorted = nums.sorted()
        var result = sorted.last! - sorted.first!
        
        for (index, value) in sorted.enumerated() {
            if value%2 == 1 {
                sorted[index] = value*2
            }
        }
        
        while sorted.last!%2 == 0 {
            let temp = sorted.last!/2
            sorted[length-1] = temp
            sorted.sort()
            result = min(result, sorted.last! - sorted.first!)
        }
        
        result = min(result, sorted.last! - sorted.first!)
        
        return result
    }
    
    // MARK: - Sliding Window + Dict + Set + Sorting
    func generateNum(_ num: Int, _ index: Int) -> [(Int,Int)] {
        var results = [(Int,Int)]()
        
        if num%2 == 0 {
            var temp = num
            while temp%2 == 0 {
                results.append((temp, index))
                temp /= 2
            }
            results.append((temp, index))
        } else {
            results.append((num, index))
            results.append((num*2, index))
        }
        
        return results
    }
    
    func minimumDeviation1(_ nums: [Int]) -> Int {
        var sorted = [(Int,Int)]()
        var dict = [Int:Int]()
        var set = Set<Int>()
        let length = nums.count
        var left = 0
        var right = 0
        
        for (index, value) in nums.enumerated() {
            sorted.append(contentsOf: generateNum(value, index))
        }
        sorted.sort {$0.0 < $1.0}
        
        for item in sorted {
            set.insert(item.1)
            dict[item.1] = dict[item.1] == nil ? 1 : dict[item.1]!+1
            if set.count == length {
                break
            }
            right += 1
        }
        
        var result = sorted[right].0 - sorted[left].0
        
        while right < sorted.count {
            if set.count < length {
                right += 1
                if right == sorted.count {
                    break
                }
                set.insert(sorted[right].1)
                dict[sorted[right].1]! += 1
            }
            
            while set.count == length {
                result = min(result, sorted[right].0 - sorted[left].0)
                dict[sorted[left].1]! -= 1
                if dict[sorted[left].1]! == 0 {
                    set.remove(sorted[left].1)
                }
                left += 1
            }
        }
        
        return result
    }
    
    // MARK: - Solution
    func minimumDeviation(_ nums: [Int]) -> Int {
        return minimumDeviation2(nums)
    }
}

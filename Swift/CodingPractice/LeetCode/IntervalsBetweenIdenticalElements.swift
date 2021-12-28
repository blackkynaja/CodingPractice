/*
 https://leetcode.com/problems/intervals-between-identical-elements/
 */

class IntervalsBetweenIdenticalElements {
    // MARK: - Brute Force
    // Time Exceeded
    func getDistances1(_ arr: [Int]) -> [Int] {
        var dict = [Int:[Int]]()
        
        for (index, value) in arr.enumerated() {
            if let _ = dict[value] {
                dict[value]!.append(index)
            } else {
                dict[value] = [index]
            }
        }
        
        var results = [Int]()
        for (index, value) in arr.enumerated() {
            let indexes = dict[value]!
            var result = 0
            for d in indexes {
                result+=abs(d-index)
            }
            results.append(result)
        }
        
        return results
    }
    
    // MARK: - Optimized
    // Accepted
    func getDistances(_ arr: [Int]) -> [Int] {
        var dict = [Int:[Int]]()
        var sumDict = [Int:[Int]]()
        
        for (index, value) in arr.enumerated() {
            if let _ = dict[value] {
                dict[value]!.append(index)
                let tempSum = sumDict[value]!.last!+index
                sumDict[value]!.append(tempSum)
            } else {
                dict[value] = [index]
                sumDict[value] = [0, index]
            }
        }
        
        var results = [Int](repeating: 0, count: arr.count)
        
        for (key, values) in dict {
            let culSums = sumDict[key]!
            for (index, value) in values.enumerated() {
                let first = index*value - culSums[index]
                let second = (values.count-index)*value - (culSums.last!-culSums[index])
                results[value] = abs(first) + abs(second)
            }
        }
        
        return results
    }
}

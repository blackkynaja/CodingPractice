class GasStation {
    
    // MARK: - Solution1
    /*
     O(n^2) - Time Exceeded
     */
    func runCarAtIndex(_ index: Int, _ gas: [Int], _ cost: [Int]) -> Bool {
        let length = gas.count
        var countGas = 0
        for num in index..<index+length {
            let i = num%length
            countGas += gas[i]
            if countGas >= cost[i] {
                countGas -= cost[i]
            } else {
                return false
            }
        }
        
        return true
    }
    
    func canCompleteCircuit1(_ gas: [Int], _ cost: [Int]) -> Int {
        var possibleIndex = [Int]()
        var countGas = 0
        var maxGas = Int.min
        var maxIndex = -1
        
        for i in 0..<gas.count {
            if cost[i] <= gas[i] {
                possibleIndex.append(i)
            }
            
            let used = gas[i] - cost[i]
            countGas += used
            if maxGas < used {
                maxGas = used
                maxIndex = i
            }
        }
        
        return countGas >= 0 ? maxIndex : -1
    }
    
    // MARK: - Solution2
    /*
     O(n)
     - The idea is that we culmulate the sum of used gas, if it is possible to travel in circle, it means that the car should start after the index that has minimum culmulative number
     */
    func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
        var countGas = 0
        var minNum = Int.max
        var minIndex = -1
        for i in 0..<gas.count {
            let used = gas[i] - cost[i]
            countGas += used
            
            if countGas < minNum {
                minNum = countGas
                minIndex = i
            }
        }
        
        return countGas >= 0 ? (minIndex+1)%gas.count : -1
    }
    
    // MARK: - Caller
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        return canCompleteCircuit2(gas, cost)
    }
}

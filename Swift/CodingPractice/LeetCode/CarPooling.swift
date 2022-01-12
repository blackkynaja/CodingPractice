/*
 https://leetcode.com/problems/car-pooling/
 
 Topics: Array, Sorting, Heap, Simulation, Prefix Sum
 */

class CarPooling {
    // MARK: - Solution 3
    /*
     - Kind like solution 2, add "from" and "to" in array then sort by time and passenger
     - Loop true array, if passenger is more than capacity then it's false
     */
    func carPooling3(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var stops = [[Int]]()
        for trip in trips {
            stops.append([trip[1], trip[0]])
            stops.append([trip[2], -trip[0]])
        }
        
        stops.sort(by: {($0[0],$0[1]) < ($1[0],$1[1])})
        var cap = 0

        for stop in stops {
            cap+=stop[1]
            if cap > capacity {
                return false
            }
        }
        return true
    }
    
    // MARK: - Solution 2
    /*
     - Idea is that it only has 1000 stops, so add passenger in stop[i] from "from" and minus capacity in stop[i] from "to"
     - Loop through stop, if current passenger is more than capacity then it's false, otherwise it's true
     */
    func carPooling2(_ trips: [[Int]], _ capacity: Int) -> Bool {
            var stops = [Int](repeating: 0, count: 1001)
            for trip in trips {
                stops[trip[1]]+=trip[0]
                stops[trip[2]]-=trip[0]
            }
            
            var cap = 0
            for stop in stops {
                cap+=stop
                if cap > capacity {
                    return false
                }
            }
            return true
        }
    
    // MARK: - Solution 1
    /*
     - Sort from and to
     - Go through from array if have enough cap
     - Go through to array if don't have enough cap to free space
     */
    func carPooling1(_ trips: [[Int]], _ capacity: Int) -> Bool {
        let froms = trips.map {[$0[0], $0[1]]}.sorted(by: {$0[1] < $1[1]})
        let tos = trips.map {[$0[0], $0[2]]}.sorted(by: {$0[1] < $1[1]})
        var currentCap = 0
        var fromIndex = 0
        var toIndex = 0
        
        while fromIndex < froms.count {
            let tempFrom = froms[fromIndex]
            if tempFrom[0] + currentCap <= capacity {
                fromIndex+=1
                currentCap+=tempFrom[0]
            } else {
                // Find if we have free cap
                let tempTo = tos[toIndex]
                if tempTo[1] <= tempFrom[1] {
                    currentCap-=tempTo[0]
                    toIndex+=1
                } else {
                    return false
                }
            }
        }
        
        return true
    }
    
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        return carPooling1(trips, capacity)
    }
}

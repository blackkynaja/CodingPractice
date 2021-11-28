/*
 https://leetcode.com/problems/watering-plants/
 
 Topics: Array
 */

class WateringPlants {
    func wateringPlants(_ plants: [Int], _ capacity: Int) -> Int {
        var step = 0
        var tempCap = capacity
        for (index, water)in plants.enumerated() {
            step+=1
            if tempCap < water {
                step = step + index*2
                tempCap = capacity
            }
            tempCap-=water
        }
        return step
    }
}

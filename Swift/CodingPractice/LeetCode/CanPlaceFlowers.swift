/*
 https://leetcode.com/problems/can-place-flowers/
 
 Topics: Array, Greedy
 */

class CanPlaceFlowers {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var arr = flowerbed
        var result = 0
        
        for i in 0..<arr.count {
            if arr[i] == 0 && (i == 0 || arr[i-1] == 0) && (i == arr.count-1 || arr[i+1] == 0) {
                result += 1
                arr[i] = 1
            }
        }
        
        return result >= n
    }
}

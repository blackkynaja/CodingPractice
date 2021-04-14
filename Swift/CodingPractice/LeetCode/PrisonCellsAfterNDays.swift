/*
 https://leetcode.com/problems/prison-cells-after-n-days/
 */

class PrisonCellsAfterNDays {
    class Solution {
        func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
            var temp = cells
            
            for _ in 0...(n-1)%14 {
                var newTemp = temp
                newTemp[0] = 0
                newTemp[7] = 0
                for j in 1...6 {
                    if temp[j-1] == temp[j+1] {
                        newTemp[j] = 1
                    } else {
                        newTemp[j] = 0
                    }
                }
                temp = newTemp
            }
            
            return temp
        }
    }
}

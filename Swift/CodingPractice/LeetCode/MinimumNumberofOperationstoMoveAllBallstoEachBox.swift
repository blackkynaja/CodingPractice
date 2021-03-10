/*
 https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box/
 */
class MinimumNumberofOperationstoMoveAllBallstoEachBox {
    func minOperations(_ boxes: String) -> [Int] {
        var stones = [Int]()
        for (index,box) in boxes.enumerated() {
            if box == "1" {
                stones.append(index)
            }
        }
        
        var results = [Int]()
        for (index, _) in boxes.enumerated() {
            var count = 0
            for stone in stones {
                count+=abs(index-stone)
            }
            results.append(count)
        }
        
        return results
    }
}

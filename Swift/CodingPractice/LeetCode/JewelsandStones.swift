/*
 https://leetcode.com/problems/jewels-and-stones/
 */

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    var set = Set<String.Element>()
    
    for jewel in jewels {
        set.insert(jewel)
    }
    
    var countJewel = 0
    for stone in stones {
        if set.contains(stone) {
            countJewel+=1
        }
    }
    
    return countJewel
}

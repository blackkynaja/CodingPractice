/*
 https://www.hackerrank.com/challenges/lonely-integer/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=7-day-campaign
 */

class LonelyInteger {
    func lonelyinteger(a: [Int]) -> Int {
        var set = Set<Int>()
        
        for num in a {
            if set.contains(num) {
                set.remove(num)
            } else {
                set.insert(num)
            }
        }
        
        return set.first!
    }
}

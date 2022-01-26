/*
 https://leetcode.com/problems/koko-eating-bananas/
 
 Topics: Array, Binary Search
 */

class KokoEatingBananas {
    // MAKR: - Solution1
    /*
     - Naive Brute Force
     - Try all speed start from one, if that speed can complete eating in limited hour then it is the answer.
     */
    func getHour(_ piles: [Int], _ speed: Int) -> Int {
        var count = 0
        for p in piles {
            count += p/speed
            if p%speed > 0 {
                count += 1
            }
        }
        
        return count
    }
    
    func minEatingSpeed1(_ piles: [Int], _ h: Int) -> Int {
        var speed = 1
        let maxSpeed = piles.max()!
        
        while speed <= maxSpeed {
            let count = getHour(piles, speed)
            if count <= h {
                return speed
            }
            speed += 1
        }
        
        return 0
    }
    
    // MARK: - Solution2
    /*
     - Instead of increasing by 1 start from 1, we limit lower bound and upper bound. Lower bound start from 1 and upper bound is a maximum number in piles array
     - Set speed from the middle of lower bound and upper bound, if hour from this speed is less than given hour, it mean that we can still decrease speed. So, we set upper bound to the mid otherwise it means this speed can not make Koko finish on time, so we set lower bound to mid+1
     - Loop in this condition until lower and upper bound overlap. We will get the lowest possible speed from lower bound
     */
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var minSpeed = 1
        var maxSpeed = piles.max()!
        
        while minSpeed < maxSpeed {
            let speed = (maxSpeed + minSpeed)/2
            let hour = getHour(piles, speed)
            if hour <= h {
                maxSpeed = speed
            } else {
                minSpeed = speed + 1
            }
        }
        
        return minSpeed
    }
}

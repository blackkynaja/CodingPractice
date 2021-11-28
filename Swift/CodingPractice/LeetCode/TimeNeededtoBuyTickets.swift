/*
https://leetcode.com/problems/time-needed-to-buy-tickets/
 
Topics: Array
*/

class TimeNeededtoBuyTickets {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var count = 0
        let ticketNum = tickets[k]
        for i in 0..<tickets.count {
            if i <= k {
                count = count + min(ticketNum, tickets[i])
            } else {
                count = count + min(ticketNum-1, tickets[i])
            }
        }
        
        return count
    }
}

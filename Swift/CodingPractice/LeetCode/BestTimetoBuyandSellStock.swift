/*
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 */

class BestTimetoBuyandSellStock {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = prices.first!
        var max = 0
        
        for price in prices {
            if price < buy {
                buy = price
            }
            
            if price - buy > max {
                max = price - buy
            }
        }
        
        return max
    }
}

/*
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 */

class BestTimetoBuyandSellStockII {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy: Int?
        var sell: Int?
        var profit = 0
        
        for price in prices {
            if let s = sell {
                if price > s {
                    sell = price
                } else {
                    profit = profit+s-buy!
                    buy = nil
                    sell = nil
                }
            } else if let b = buy, price > b {
                sell = price
            }
            
            if let b = buy {
                if price < b {
                    buy = price
                }
            } else {
                buy = price
            }
        }
        
        if let b = buy, let s = sell, s > b {
            profit = profit + s - b
        }
        return profit
    }
}

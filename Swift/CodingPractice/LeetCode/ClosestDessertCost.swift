/*
 https://leetcode.com/problems/closest-dessert-cost/
 */

class ClosestDessertCost {
    func generateAllPossibleSumHelper(allCosts: [[Int]], row: Int, sum: Int, set: inout Set<Int>) {
        if row == allCosts.count {
            set.insert(sum)
            return
        }
        
        generateAllPossibleSumHelper(allCosts: allCosts, row: row+1, sum: sum+allCosts[row][0], set: &set)
        generateAllPossibleSumHelper(allCosts: allCosts, row: row+1, sum: sum+allCosts[row][1], set: &set)
        generateAllPossibleSumHelper(allCosts: allCosts, row: row+1, sum: sum+allCosts[row][2], set: &set)

    }

    func generateAllPossibleSum(allCosts: [[Int]]) -> Set<Int> {
        var set = Set<Int>()
        generateAllPossibleSumHelper(allCosts: allCosts, row: 0, sum: 0, set: &set)
        return set
    }

    func generatePossibleToppingCost(toppingCosts: [Int]) -> Set<Int>
    {
        var allCost = [[Int]]()
        for item in toppingCosts {
            let temp = [item*0,item*1,item*2]
            allCost.append(temp)
        }
        
        return generateAllPossibleSum(allCosts: allCost)
    }

    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var result = 0
        let possibleToppingCost = Array(generatePossibleToppingCost(toppingCosts: toppingCosts)).sorted()
        var closestCost: Int?
        for base in baseCosts {
            for topping in possibleToppingCost {
                let cost = base + topping
                if let closestCostValue = closestCost {
                    if abs(target-cost) < closestCostValue {
                        closestCost = abs(target-cost)
                        result = cost
                    }
                } else {
                    closestCost = abs(target-cost)
                    result = cost
                }
            }
        }
        
        return result
    }
}

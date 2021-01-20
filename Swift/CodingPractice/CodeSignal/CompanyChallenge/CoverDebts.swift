/*
 Company: Freedom Financial Network
 https://app.codesignal.com/company-challenges/freedomfinancialnetwork/dkMAufMxQC9wx8igS
 */

func increaseDebt(debts: [Double], interests: [Double]) -> [Double] {
    var newDebts = [Double]()
    for i in 0..<debts.count {
        newDebts.append(debts[i] + (debts[i]*interests[i]/100))
    }
    return newDebts
}

func coverDebts(s: Int, debts: [Int], interests: [Int]) -> Double {
    var newDebts: [Double] = debts.map { (t) -> Double in
        return Double(t)
    }
    var newInt = interests.map { (t) -> Double in
        return Double(t)
    }
    var sum = 0.0
    var validMoney = Double(s)*0.1
    var i = 0
    
    while true {
        if let maxInt = newInt.max() {
            if maxInt == 0 {
                break
            }
            if let maxPos = newInt.firstIndex(of: maxInt) {
                let debt = newDebts[maxPos]
                let paid = validMoney - debt
                if paid == 0 {
                    newDebts[maxPos] = 0
                    newInt[maxPos] = 0
                    newDebts = increaseDebt(debts: newDebts, interests: newInt)
                    sum += validMoney
                    validMoney = Double(s)*0.1
                } else if paid > 0 {
                    sum += debt
                    validMoney -= debt
                    newDebts[maxPos] = 0
                    newInt[maxPos] = 0
                } else {
                    newDebts[maxPos] = newDebts[maxPos] - validMoney
                    sum += validMoney
                    validMoney = Double(s)*0.1
                    newDebts = increaseDebt(debts: newDebts, interests: newInt)
                }
            }
        }
        
        i+=1
    }
    
    return sum
}

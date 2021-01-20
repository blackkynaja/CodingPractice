/*
 Company: Freedom Financial Network
 https://app.codesignal.com/company-challenges/freedomfinancialnetwork/GvruWwC39wkDK7mhf
 */

struct Sale {
    let name: String
    let score: Double
    let time: Int
}

func salesLeadsScore(names: [String], time: [Int], netValue: [Int], isOnVacation: [Bool]) -> [String] {
    var sales = [Sale]()
    for i in 0..<names.count {
        if !isOnVacation[i] {
            let score = Double(netValue[i])*Double(time[i])/365.0
            let sale = Sale(name: names[i], score: score, time: time[i])
            sales.append(sale)
        }
    }
    
    sales.sort { (sale1, sale2) -> Bool in
        if sale1.score != sale2.score {
            return sale1.score > sale2.score
        } else {
            if sale1.time != sale2.time {
                return sale1.time > sale2.time
            } else {
                return sale1.name < sale2.name
            }
        }
    }
    let s = sales.map { (sale) -> String in
        return sale.name
    }
    return s
}

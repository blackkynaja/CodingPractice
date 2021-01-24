/*
 Company: Freedom Financial Network
 https://app.codesignal.com/company-challenges/freedomfinancialnetwork/GvruWwC39wkDK7mhf
 */

import Foundation

private enum SuggestType {
    case leave
    case add
    case remove
    
    var suggestString: String {
        switch self {
        case .leave: return "Leave as it is"
        case .add: return "Add one year"
        case .remove: return "Remove one year"
        }
    }
}

private struct HistoryPayment: CustomStringConvertible {
    var amount: Int
    var date: Date
    
    var description: String {
        return "amount: \(amount), date: \(date)"
    }
}

private func getHistoryPayment(history: [String]) -> [HistoryPayment] {
    var historyPayments = [HistoryPayment]()
    
    for item in history {
        let array = item.components(separatedBy: " ")
        if let amountString = array.first {
            if let dateString = array.last {
                let dateformat = DateFormatter()
                dateformat.dateFormat = "MM/dd/yyyy"
                if let d = dateformat.date(from: dateString) {
                    if let amount = Int(amountString.replacingOccurrences(of: "$", with: "")) {
                        let paymentItem = HistoryPayment(amount: amount, date: d)
                        historyPayments.append(paymentItem)
                    }
                }
            }
        }
    }
    
    return historyPayments
}

private func getNewPaid(currentAmount: Int, credit: Int, percent: Int, suggestType: SuggestType) -> Int {
    if suggestType == .leave {
        return currentAmount
    }
    
    var newAmount = Double(currentAmount)
    let amountChange = round(Double(credit*percent)/100.0)
    if suggestType == .add {
        newAmount += amountChange
    } else {
        newAmount -= amountChange
    }
    return Int(round(newAmount))
}

private func generateSuggest(type: SuggestType, amount: Int, credit: Int) -> String {
    var suggestString = ""
    suggestString += type.suggestString
    suggestString += ", \(amount)."
    
    return suggestString
}

func creditPayments(a: Int, b: Int, startDate: String, endDate: String, history: [String]) -> [String] {
    var suggest = [String]()
    var currentAmount = b
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/yyyy"
    
    let historyPayments = getHistoryPayment(history: history)
    if let start = dateFormatter.date(from: startDate), var current = dateFormatter.date(from: startDate) {
        if let end = dateFormatter.date(from: endDate) {
            var countMonth = 0
            
            let calendar = Calendar.current
            var component = DateComponents()
            component.month = 1
            
            while current <= end {
                let currentPayment = historyPayments.filter { (item) -> Bool in
                    let comp1 = calendar.dateComponents([.month,.year], from: item.date)
                    let comp2 = calendar.dateComponents([.month,.year], from: current)
                    return item.date >= start && comp1.month! <= comp2.month!
                }
                
                var suggestType: SuggestType = .leave
                
                if countMonth > 1 {
                    let lastThreeMonthPayment = currentPayment.filter { (item) -> Bool in
                        var threeMonthComp = DateComponents()
                        threeMonthComp.month = -3
                        let threeMonthDate = calendar.date(byAdding: threeMonthComp, to: current)!
                        let itemComp = calendar.dateComponents([.month,.year], from: item.date)
                        let newDate = calendar.date(from: itemComp)!
                        return newDate > threeMonthDate
                    }
                    
                    let amountLastThree = lastThreeMonthPayment.reduce(0, {$0 + $1.amount})
                    if amountLastThree >= 3*currentAmount {
                        var isLate = true
                        let lastTwoMonthPayment = currentPayment.filter { (item) -> Bool in
                            var twoMonthComp = DateComponents()
                            twoMonthComp.month = -1
                            let twoMonthDate = calendar.date(byAdding: twoMonthComp, to: current)!
                            return item.date > twoMonthDate
                        }
                        
                        if lastTwoMonthPayment.count > 0 {
                            for item in lastThreeMonthPayment {
                                let itemComp = calendar.dateComponents([.day,.month,.year], from: item.date)
                                if itemComp.day! < 16 {
                                    isLate = false
                                }
                            }
                        }
                        
                        if isLate {
                            suggestType = .add
                        } else {
                            var isDouble = true
                            var paidMonth = Set([Int]())
                            for item in lastThreeMonthPayment {
                                let itemComp = calendar.dateComponents([.day,.month,.year], from: item.date)
                                if !paidMonth.contains(itemComp.month!) {
                                    paidMonth.insert(itemComp.month!)
                                }
                                if item.amount < currentAmount*2 {
                                    isDouble = false
                                }
                            }
                            
                            if paidMonth.count < 3 {
                                isDouble = false
                            }
                            
                            if isDouble {
                                suggestType = .remove
                            }
                        }
                    } else {
                        suggestType = .add
                    }
                }
                
                currentAmount = getNewPaid(currentAmount: currentAmount, credit: a, percent: 1, suggestType: suggestType)
                                
                let suggestString = generateSuggest(type: suggestType, amount: currentAmount, credit: a)
                suggest.append(suggestString)
                
                current = calendar.date(byAdding: component, to: current)!
                countMonth += 1
            }
        }
    }
    
    return suggest
}

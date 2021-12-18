/*
 https://app.codesignal.com/company-challenges/asana/igEBmm3ykm4zwYkcQ
 */

import Foundation

class RecurringTask {
    func solution(firstDate: String, k: Int, daysOfTheWeek: [String], n: Int) -> [String] {
        let weekdayDict = ["Sunday":1, "Monday":2, "Tuesday":3, "Wednesday":4, "Thursday":5, "Friday":6, "Saturday":7]
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        
        let startdDate = dateFormat.date(from: firstDate)!
        let component = Calendar.current.dateComponents([.weekday], from: startdDate)
        let startDayOfTheWeek = component.weekday!
        let daysOfTheWeekInt = daysOfTheWeek.map{weekdayDict[$0]!}
        
        let rotatedIndex = Int(daysOfTheWeekInt.firstIndex(of: startDayOfTheWeek)!)
        var rotatedDaysOfTheWeek = [Int]()
        
        for i in rotatedIndex..<rotatedIndex+daysOfTheWeek.count {
            var diffValue = daysOfTheWeekInt[i%daysOfTheWeekInt.count]-startDayOfTheWeek
            if i >= daysOfTheWeek.count  {
                diffValue+=7
            }
            rotatedDaysOfTheWeek.append(diffValue)
        }
        
        var results = [String]()
        var additionDay = 0
        
        while results.count < n {
            for day in rotatedDaysOfTheWeek {
                let result = Calendar.current.date(byAdding: .day, value: day+additionDay, to: startdDate)!
                results.append(dateFormat.string(from: result))
                if results.count == n {
                    break
                }
            }
            additionDay = additionDay + k*7
        }
        
        return results
    }
}

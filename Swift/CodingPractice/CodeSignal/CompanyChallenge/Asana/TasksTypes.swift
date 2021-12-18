/*
 https://app.codesignal.com/company-challenges/asana/2vJMZnQzdkkhCvmxs
 */

class TasksTypes {
    func solution(deadlines: [Int], day: Int) -> [Int] {
        var results = [0,0,0]
        for d in deadlines {
            let gap = d - day
            if gap <= 0 {
                results[0]+=1
            } else if gap > 7 {
                results[2]+=1
            } else {
                results[1]+=1
            }
        }
        
        return results
    }

}

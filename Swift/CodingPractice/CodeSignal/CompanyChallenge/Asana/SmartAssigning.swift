/*
 https://app.codesignal.com/company-challenges/asana/vpDXQhiLagoaM27KL
 */

class SmartAssigning {
    struct Person {
        let name: String
        let project: Int
        let task: Int
    }

    func solution(names: [String], statuses: [Bool], projects: [Int], tasks: [Int]) -> String {
        var persons = [Person]()
        var minTask = tasks.max()!
        
        for i in 0..<names.count {
            if !statuses[i] {
                let person = Person(name: names[i], project: projects[i], task: tasks[i])
                persons.append(person)
                minTask = min(tasks[i], minTask)
            }
        }
        
        persons = persons.filter{$0.task == minTask}
        persons.sort{$0.project < $1.project}

        return persons.first!.name
    }

}

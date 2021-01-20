/*
 https://app.codesignal.com/interview-practice/task/pMvymcahZ8dY4g75q/description
 */

func firstDuplicate(a: [Int]) -> Int {
    var found = Set([Int]())
    for i in 0..<a.count {
        if found.contains(a[i]) {
            return a[i]
        } else {
            found.insert(a[i])
        }
    }
    return -1
}

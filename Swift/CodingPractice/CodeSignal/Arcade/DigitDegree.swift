func digitDegree(n: Int) -> Int {
    var temp = n
    var degree = 0
    
    while temp >= 10 {
        let s = String(temp)
        temp = s.map {Int(String($0))!}.reduce(0,+)
        degree+=1
    }
    return degree
}

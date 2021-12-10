func knapsackLight(value1: Int, weight1: Int, value2: Int, weight2: Int, maxW: Int) -> Int {
    if maxW < min(weight1, weight2) {
        return 0
    }
    if maxW >= weight1+weight2 {
        return value1+value2
    }
    
    if value1 > value2 {
        return weight1 <= maxW ? value1 : value2
    } else {
        return weight2 <= maxW ? value2 : value1
    }
}

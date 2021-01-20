/*
 Company: Uber
 https://app.codesignal.com/company-challenges/uber/HNQwGHfKAoYsz9KX6
 */

func fareEstimator(ride_time: Int, ride_distance: Int, cost_per_minute: [Double], cost_per_mile: [Double]) -> [Double] {
//    (Cost per minute) * (ride time) + (Cost per mile) * (ride distance)
    var fares = [Double]()
    for i in 0..<cost_per_minute.count {
        let fare = cost_per_minute[i] * Double(ride_time) + cost_per_mile[i] * Double(ride_distance)
        fares.append(fare)
    }
    
    return fares
}

/*
 https://leetcode.com/problems/k-closest-points-to-origin/
 */
import Foundation

class KClosestPointstoOrigin {
    
    //TODO: O(NLogN), can improve solution with max heap
    func getEuclideanDistance(point1: [Int], point2: [Int]) -> Int {
        let d = abs(Int(pow(Double((point1[0] - point2[0])), 2) + pow(Double((point1[1] - point2[1])), 2)))
        return d
    }

    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var results = [[Int: [Int]]]()
        let origin = [0,0]
        
        for point in points {
            let d = getEuclideanDistance(point1:origin, point2: point)
            results.append([d: point])
        }
        
        results.sort { (d1, d2) -> Bool in
            return d1.keys.first! < d2.keys.first!
        }
        
        return Array(results.map { (d) -> [Int] in
            return d.values.first!
        }[0..<K])
    }
}

/*
 Company: Uber
 https://app.codesignal.com/company-challenges/uber/tucq8L9FB7QyDZ4M6
 */

import Foundation

class Brigde: CustomStringConvertible, NSCopying {
    
    var startPoint: Int
    var endPoint: [Point]
    
    init(s: Int, p: [Point]) {
        self.startPoint = s
        self.endPoint = p
    }
    
    var description: String {
        return "\(startPoint) -> [\(endPoint)]"
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Brigde(s: startPoint, p: endPoint)
        return copy
    }
}

class Point: CustomStringConvertible, NSCopying {
    var position: Int
    var cost: Int
    
    init(p: Int, c: Int) {
        self.position = p
        self.cost = c
    }
    
    var description: String {
        return "\(position): \(cost)"
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Point(p: position, c: cost)
        return copy
    }
}

func presentMap(map: [Brigde]) {
    let sorted = map.sorted { (item1, item2) -> Bool in
        return item1.startPoint < item2.startPoint
    }
    
    for bridge in sorted {
        let sortedPath = bridge.endPoint.sorted { (point1, point2) -> Bool in
            return point1.position < point2.position
        }
        var s = "["
        for point in sortedPath {
            s += "\(point.position): \(point.cost)"
            if point.position != sortedPath.last!.position {
                s += ", "
            }
        }
        s += "]"
        print("\(bridge.startPoint) -> \(s)")
    }
}

func createMap(city: [[Int]]) -> [Brigde] {
    var bridges = [Brigde]()
    for i in 0..<city.count {
        var paths = [Point]()
        for j in 1..<city[i].count {
            if i != j && city[i][j] != -1 {
                let path = Point(p: j, c: city[i][j])
                paths.append(path)
            }
        }
        let bridge = Brigde(s: i, p: paths)
        bridges.append(bridge)
    }
//    presentMap(map: bridges)
    return bridges
}

func nightRoute(city: [[Int]]) -> Int {
    let map = createMap(city: city)
    let destination = city.count - 1
    var min = Int.max
    var route = [Point]()
    var stack = [Brigde]()
    if let start = map.filter({ (item) -> Bool in
        return item.startPoint == 0
    }).first {
        stack.append(start.copy() as! Brigde)
    }
    
    while stack.count > 0 {
//        print("map: ",map)
        let currentPos = stack.last!
       print("stack: ",stack)
        if currentPos.endPoint.count > 0 {
            if let next = currentPos.endPoint.last {
               print("next: ", next)
                currentPos.endPoint.removeLast()
                if next.position != destination {
                    if !route.contains(where: { (item1) -> Bool in
                        return next.position == item1.position
                    }) {
                        route.append(next)
                       print("current Route: " ,route, map)
                        if let nextBridge = map.first(where: { (item) -> Bool in
                            return item.startPoint == next.position
                        }) {
                            stack.append(nextBridge.copy() as! Brigde)
                        }
                    }
                } else {
                   print("Finish Route: " ,route, next)
                    var cost = next.cost
                    for item in route {
                        cost += item.cost
                    }
                    if min > cost {
                        min = cost
                    }
                }
            }
        } else {
            stack.removeLast()
            if route.count > 0 {
                route.removeLast()
            }
        }
    }

    return min
}

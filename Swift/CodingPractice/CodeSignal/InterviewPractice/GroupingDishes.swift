/*
 https://app.codesignal.com/interview-practice/task/xrFgR63cw7Nch4vXo/description
 */
func groupingDishes(dishes: [[String]]) -> [[String]] {
    var dict = [String: [String]]()
    for dish in dishes {
        for i in 1..<dish.count {
            if let items = dict[dish[i]] {
                var newArray = Array(items)
                newArray.append(dish[0])
                dict[dish[i]] = newArray
            } else {
                dict[dish[i]] = [dish[0]]
            }
        }
    }
    
    var group = [[String]]()
    let keys = dict.keys.sorted { (item1, item2) -> Bool in
                   return item1 < item2
               }
    for key in keys {
        if let value = dict[key] {
            if value.count > 1 {
                var array = [String]()
                for item in value {
                    array.append(item)
                }
                array.sort { (item1, item2) -> Bool in
                    return item1 < item2
                }
                array.insert(key, at: 0)
                group.append(array)
            }
        }
    }
    return group
}

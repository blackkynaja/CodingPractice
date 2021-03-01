/*
 
 */

func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
    var count = 0
    let indexRule = ruleKey == "type" ? 0 : ruleKey == "color" ? 1 : 2
    for item in items {
        if item[indexRule] == ruleValue {
            count+=1
        }
    }
    return count
}

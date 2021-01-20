/*
 Write a function that reverses characters in (possibly nested) parentheses in the input string.

 Input strings will always be well-formed with matching ()s.
 
 For inputString = "(bar)", the output should be
 reverseInParentheses(inputString) = "rab";
 For inputString = "foo(bar)baz", the output should be
 reverseInParentheses(inputString) = "foorabbaz";
 For inputString = "foo(bar)baz(blim)", the output should be
 reverseInParentheses(inputString) = "foorabbazmilb";
 For inputString = "foo(bar(baz))blim", the output should be
 reverseInParentheses(inputString) = "foobazrabblim".
 Because "foo(bar(baz))blim" becomes "foo(barzab)blim" and then "foobazrabblim".
 */

struct Pair {
    let first: Int
    let second: Int
}

func reverseInParentheses(inputString: String) -> String {
    var inputArray = Array(inputString)
    var tempParenthis = [Int]()
    var pairs = [Pair]()
    for i in 0..<inputArray.count {
        let s = inputArray[i]
        if s == "(" {
            tempParenthis.append(i)
        } else if s == ")" {
            let index = tempParenthis.last!
            if index+1 < i {
                let pair = Pair(first: index,second: i)
                pairs.append(pair)
                tempParenthis.removeLast()
            }
        }
    }
    
    print(pairs)
    
    for pair in pairs {
        var first = pair.first
        var last = pair.second
        while first < last {
            let tempLeft = inputArray[first]
            let tempRight = inputArray[last]
            if tempLeft == "(" || tempLeft == ")" {
                first += 1
                continue
            } else if tempRight == "(" || tempRight == ")" {
                last -= 1
                continue
            } else {
                inputArray[first] = tempRight
                inputArray[last] = tempLeft
                first+=1
                last-=1
            }
        }
        print(String(inputArray))
    }
    
    var result = String(inputArray).replacingOccurrences(of: "(", with: "")
    result = result.replacingOccurrences(of: ")", with: "")
    return result
}

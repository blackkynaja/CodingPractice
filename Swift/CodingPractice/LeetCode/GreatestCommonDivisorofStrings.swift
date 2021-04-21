/*
 https://leetcode.com/problems/greatest-common-divisor-of-strings/submissions/
 */

class GreatestCommonDivisorofStrings {
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a%b)
    }
    
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {

        var long = ""
        var short = ""
        
        if (str1.count >= str2.count) {
            long = str1
            short = str2
        } else {
            short = str1
            long = str2
        }
        
        let gcdInt = gcd(long.count, short.count)
        
        var split = short.components(separatedBy: String(short.prefix(gcdInt)))
        for s in split {
            if (s.count != 0) {return ""}
        }
        
        split = long.components(separatedBy: String(short.prefix(gcdInt)))
        for s in split {
            if (s.count != 0) {return ""}
        }
        
        return String(short.prefix(gcdInt))
    }
}

/*
 https://leetcode.com/problems/complement-of-base-10-integer/
 
 Topics: Bit Manipulation
 */

class ComplementofBase10Integer {
    func bitwiseComplement(_ n: Int) -> Int {
        let length = 32-String(n, radix: 2).count
        let maxBi = UInt32.max >> length
        return Int(~UInt32(n) & maxBi)
    }
}

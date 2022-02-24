//
//  ExcelSheetColumnNumber.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/24/22.
//

/*
 https://leetcode.com/problems/excel-sheet-column-number/
 
 Topics: Math, String
 */

class ExcelSheetColumnNumber {
    func pow(_ base: Int, _ pow: Int) -> Int {
        if pow == 0 {
            return 1
        }
        
        var result = 1
        for _ in 0..<pow {
            result *= base
        }
        return result
    }
    
    func titleToNumber(_ columnTitle: String) -> Int {
        let startAsciiValue = 64
        let length = columnTitle.count
        var result = 0
        for (index, value) in columnTitle.enumerated() {
            let base = (Int(value.asciiValue!) - startAsciiValue)
            let digit = pow(26, (length - index - 1))
            result += base*digit
        }
        return result
    }
}

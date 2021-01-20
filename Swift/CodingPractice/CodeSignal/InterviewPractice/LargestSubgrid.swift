/*
 N grid
 Find maximum sum in sub N grid that not more than maximum
 */

import Foundation

func sumInLenGrid(grid: [[Int]], startRow: Int, startColumn: Int, length: Int) -> Int {
    let endRow = startRow+length
    let endColumn = startColumn+length
    var sum = 0
    for row in startRow..<endRow {
        for column in startColumn..<endColumn {
            sum += grid[row][column]
        }
    }
    return sum
}

func largestSubgrid(grid: [[Int]], maxSum: Int) -> Int {
    // Write your code here
    var maxReturn = maxSum
    var len = 1
    while len <= grid.count {
        if len == 1 {
            var max = grid[0][0]
            for row in 0..<grid.count {
                for column in 0..<grid[row].count {
                    if grid[row][column] > max {
                        max = grid[row][column]
                    }
                }
            }
            maxReturn = max
        } else {
            var max = 0
            for row in 0..<grid.count-len+1 {
                for column in 0..<grid[row].count-len+1 {
                    let sum = sumInLenGrid(grid: grid, startRow: row, startColumn: column, length: len)
                    if sum > max {
                        max = sum
                    }
                }
            }
            maxReturn = max
        }
        
        if maxReturn > maxSum {
            return len-1
        } else if maxReturn == maxSum {
            return len
        }
        len+=1
    }
    
    return grid.count
}

/* Test Example
 
 var grid = [[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3],[4,4,4,4,4],[5,5,5,5,5]]
 print(largestSubgrid(grid: grid, maxSum: 1500))

 */

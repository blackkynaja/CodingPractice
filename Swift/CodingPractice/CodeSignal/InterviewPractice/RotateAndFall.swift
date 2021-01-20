/*
 # is an object
 . is a space
 * is an obstacle
 
 Given an metric, rotate it clockwise
 Return result metric after rotate
 
 Given metric:   [["#","#",".","*",".","."],
                 [ "#","#",".",".",".","."],
                 [ "#",".","*","#",".","#"],
                 [ "#",".","#","*",".","#"]]
 
 Result: [[".",".",".","."],
         [ "#","#",".","#"],
         [ "#","*",".","#"],
         [ "*",".",".","*"],
         [ ".","#","#","."],
         [ "#","#","#","."]]
 
 */

func rotateAndFall(matrix: [[String]]) -> [[String]] {
    var rotateMatrix = [[String]]()
    
    for column in 0..<matrix[0].count {
        var temp = [String]()
        for row in 0..<matrix.count {
            temp.append(matrix[row][column])
        }
        rotateMatrix.append(temp.reversed())
    }
    
    for column in 0..<rotateMatrix[0].count {
        var countObj = 0
        for row in 0..<rotateMatrix.count {
            let m = rotateMatrix[row][column]
            if m == "#" {
                countObj+=1
            } else if m == "*" {
                if countObj > 0 {
                    var tempRow = row-1
                    while tempRow >= 0 {
                        if rotateMatrix[tempRow][column] == "*" {
                            break
                        }
                        if countObj > 0 {
                            rotateMatrix[tempRow][column] = "#"
                            countObj-=1
                        } else {
                            rotateMatrix[tempRow][column] = "."
                        }
                        tempRow-=1
                    }
                }
            }
        }
        
        if countObj > 0 {
            print(column,countObj)
            var tempRow = rotateMatrix.count-1
            while tempRow >= 0 {
                if rotateMatrix[tempRow][column] == "*" {
                    break
                }
                if countObj > 0 {
                    rotateMatrix[tempRow][column] = "#"
                    countObj-=1
                } else {
                    rotateMatrix[tempRow][column] = "."
                }
                tempRow-=1
            }
        }
    }
    
    return rotateMatrix
}

/*
 Test Example
var matrix = [["#","#",".","*",".","."],
              ["#","#",".",".",".","."],
              ["#",".","*","#",".","#"],
              ["#",".","#","*",".","#"]]
 
 result = [[".", ".", ".", "."],
           ["#", "#", ".", "#"],
           ["#", "*", ".", "#"],
           ["*", ".", ".", "*"],
           [".", "#", "#", "."],
           ["#", "#", "#", "."]]
*/

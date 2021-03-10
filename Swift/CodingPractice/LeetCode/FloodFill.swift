/*
 https://leetcode.com/problems/flood-fill/
 */

class FloodFill {
    func fillAndGetNeigbors(_ image: inout [[Int]], _ sr: Int, _ sc: Int ,_ newColor: Int, _ colorToFill: Int) -> [[Int]] {
        var neigbors = [[Int]]()
        
        if sr > 0 {
            if image[sr-1][sc] == colorToFill {
                neigbors.append([sr-1, sc])
                image[sr-1][sc] = newColor
                neigbors.append([sr-1, sc])
            }
        }
        if sc > 0  {
            if image[sr][sc-1] == colorToFill {
                neigbors.append([sr, sc-1])
                image[sr][sc-1] = newColor
                neigbors.append([sr, sc-1])
            }
        }
        if sr < image.count-1 {
            if image[sr+1][sc] == colorToFill {
                neigbors.append([sr+1, sc])
                image[sr+1][sc] = newColor
                neigbors.append([sr+1, sc])
            }
        }
        if sc < image[sr].count-1 {
            if image[sr][sc+1] == colorToFill {
                neigbors.append([sr, sc+1])
                image[sr][sc+1] = newColor
                neigbors.append([sr, sc+1])
            }
        }
        return neigbors
    }

    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var spotToFill = [[sr, sc]]
        let colorToFill = image[sr][sc]
        
        if colorToFill == newColor {
            return image
        }
        
        var imageResult = image.map({$0})
        imageResult[sr][sc] = newColor
        
        while spotToFill.count > 0 {
            let currentSpot = spotToFill.last!
            spotToFill.removeLast()
            spotToFill+=fillAndGetNeigbors(&imageResult, currentSpot[0], currentSpot[1], newColor, colorToFill)
        }
        
        return imageResult
    }
}

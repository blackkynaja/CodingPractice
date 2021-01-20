/*
 Two arrays are called similar if one can be obtained from another by swapping at most one pair of elements in one of the arrays.

 Given two arrays a and b, check whether they are similar.
 */

func areSimilar(a: [Int], b: [Int]) -> Bool {
    var index1 = -1
    var index2 = -1
    var isSimilar = true
    
    for i in 0..<a.count {
        if a[i] != b[i] {
            if !isSimilar {
                if index2 != -1 {
                    return false
                } else {
                    index2 = i
                }
            } else {
                isSimilar = false
                index1 = i
            }
        }
    }
    
    if !isSimilar {
        if index1 != 1 && index2 != -1 {
            if a[index1] == b[index2] && a[index2] == b[index1] {
                isSimilar = true
            }
        }
    }
    
    return isSimilar
}

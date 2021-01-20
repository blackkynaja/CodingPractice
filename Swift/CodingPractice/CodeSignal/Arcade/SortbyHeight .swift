/*
 Some people are standing in a row in a park. There are trees between them which cannot be moved. Your task is to rearrange the people by their heights in a non-descending order without moving the trees. People can be very tall!
 
 For a = [-1, 150, 190, 170, -1, -1, 160, 180], the output should be
 sortByHeight(a) = [-1, 150, 160, 170, -1, -1, 180, 190].
 
 */

func sortByHeight(a: [Int]) -> [Int] {
    var array = a.sorted {
        if $0 != -1 && $1 != -1 {
            return $0 < $1
        }
        
        return $0 != -1
    }
    
    for i in 0..<a.count {
        if a[i] == -1 {
            array.insert(-1, at: i)
            array.removeLast()
        }
    }
    
    return array
}

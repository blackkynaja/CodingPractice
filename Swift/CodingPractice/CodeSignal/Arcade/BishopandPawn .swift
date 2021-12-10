func allMoves(bishop: String) -> Set<String> {
    
    var set = Set<String>()
    let x = UnicodeScalar(String(bishop.first!))!.value - UnicodeScalar("a").value
    let y = Int(String(bishop.last!))!
    
    var tempY = y
    for i in 0...x {
        if tempY > 8 { break }
        let index = x-i
        let s = String(UnicodeScalar(UnicodeScalar("a").value+index)!) + String(tempY)
        set.insert(s)
        tempY+=1
    }

    tempY = y
    for i in x...7 {
        if tempY > 8 { break }
        let s = String(UnicodeScalar(UnicodeScalar("a").value+i)!) + String(tempY)
        set.insert(s)
        tempY+=1
    }
    
    tempY = y
    for i in 0...x {
        if tempY < 1 { break }
        let index = x-i
        let s = String(UnicodeScalar(UnicodeScalar("a").value+index)!) + String(tempY)
        set.insert(s)
        tempY-=1
    }
    
    tempY = y
    for i in x...7 {
        if tempY < 1 { break }
        let s = String(UnicodeScalar(UnicodeScalar("a").value+i)!) + String(tempY)
        set.insert(s)
        tempY-=1
    }
    
    return set
}

func bishopAndPawn(bishop: String, pawn: String) -> Bool {
    let x1 = Int(UnicodeScalar("h").value - UnicodeScalar(String(bishop.first!))!.value + 1)
    let y1 = Int(String(bishop.last!))!
    
    let x2 = Int(UnicodeScalar("h").value - UnicodeScalar(String(pawn.first!))!.value + 1)
    let y2 = Int(String(pawn.last!))!
    return abs(x1-x2) == abs(y1-y2)
}

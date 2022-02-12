extension Collection where Self.Element: Collection {
    func print2D() {
        for row in self {
            print(row)
        }
    }
}

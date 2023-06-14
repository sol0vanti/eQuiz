import Foundation

extension Int {
    static func random(in range: ClosedRange<Int>, excluding: Int) -> Int {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: range)
        } while randomNumber == excluding
        return randomNumber
    }
}

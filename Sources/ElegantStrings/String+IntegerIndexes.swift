// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 14/05/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

/// Explicit support for integer slicing of strings.

public extension StringProtocol {
    subscript(_ intIndex: Int) -> Character {
        let stringIndex = index(startIndex, offsetBy: intIndex)
        return self[stringIndex]
    }
    
    subscript(_ partial: PartialRangeUpTo<Int>) -> SubSequence {
        get {
            let upper = index(startIndex, offsetBy: partial.upperBound)
            return self[..<upper]
        }
    }

    subscript(_ partial: PartialRangeFrom<Int>) -> SubSequence {
        get {
            let lower = index(startIndex, offsetBy: partial.lowerBound)
            return self[lower...]
        }
    }

    subscript(_ range: ClosedRange<Int>) -> SubSequence {
        get {
            let lower = index(startIndex, offsetBy: range.lowerBound)
            let upper = index(lower, offsetBy: range.count - 1)
            return self[lower...upper]
        }
    }

}

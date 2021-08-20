// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 20/08/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

/// String slicing with NSRange

public extension StringProtocol {
    subscript(_ range: NSRange) -> SubSequence {
        get {
            let lower = index(startIndex, offsetBy: range.location)
            let upper = index(lower, offsetBy: range.length)
            return self[lower ..< upper]
        }
    }
}

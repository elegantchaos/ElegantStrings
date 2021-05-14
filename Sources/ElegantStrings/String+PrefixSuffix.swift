// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 13/05/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public extension StringProtocol {
    /// Alias for hasSuffix
    /// String supports Collection's `starts(with:)`; for consistency it
    /// makes sense to also support `ends(with:)` since that's intuitively
    /// what we often try to call!
    func ends<S>(with other: S) -> Bool where S: StringProtocol {
        hasSuffix(other)
    }

    func removing<S>(prefix: S) -> SubSequence where S: StringProtocol {
        guard hasPrefix(prefix) else { return self[..<endIndex] }
        return self[prefix.count...]
    }

    func removing<S>(suffix: S) -> SubSequence where S: StringProtocol {
        guard suffix.count > 0, let start = range(of: suffix, options: .backwards, range: nil, locale: nil), start.upperBound == endIndex else { return self[..<endIndex] }
        return self[..<start.lowerBound]
    }

    func trimmed<S>(ifPrefix prefix: S) -> SubSequence? where S: StringProtocol {
        guard hasPrefix(prefix) else { return nil }
        return self[prefix.count...]
    }

    func trimmed<S>(ifSuffix suffix: S) -> SubSequence? where S: StringProtocol {
        guard suffix.count > 0, let start = range(of: suffix, options: .backwards, range: nil, locale: nil), start.upperBound == endIndex else { return nil }
        return self[..<start.lowerBound]
    }

}


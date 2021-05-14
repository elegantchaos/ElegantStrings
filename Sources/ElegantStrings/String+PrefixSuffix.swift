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
    
    /// Returns the original string with a prefix removed.
    /// If the prefix wasn't present, the original string is returned unchanged.
    /// - Parameter prefix: The prefix to remove.
    /// - Returns: The modified string.
    func removing<S>(prefix: S) -> SubSequence where S: StringProtocol {
        guard hasPrefix(prefix) else { return self[..<endIndex] }
        return self[prefix.count...]
    }

    
    /// Returns the original string with a suffix removed.
    /// If the suffix wasn't present, the original string is returned unchanged.
    /// - Parameter suffix: The first characters of the suffix to remove.
    /// - Returns: The modified string.
    func removing<S>(suffixStartingWith suffix: S) -> SubSequence where S: StringProtocol {
        guard suffix.count > 0, let start = range(of: suffix, options: .backwards, range: nil, locale: nil) else { return self[..<endIndex] }
        return self[..<start.lowerBound]
    }
    
    /// Returns the original string with a prefix removed.
    /// If the prefix wasn't present, the original string is returned unchanged.
    /// - Parameter prefix: The last characters of the prefix to remove.
    /// - Returns: The modified string.
    func removing<S>(prefixEndingWith prefix: S) -> SubSequence where S: StringProtocol {
        guard prefix.count > 0, let end = range(of: prefix, range: nil, locale: nil) else { return self[..<endIndex] }
        return self[end.upperBound...]
    }

    
    /// Returns the original string with a suffix removed.
    /// If the suffix wasn't present, the original string is returned unchanged.
    /// - Parameter suffix: The suffix to remove.
    /// - Returns: The modified string.
    func removing<S>(suffix: S) -> SubSequence where S: StringProtocol {
        guard suffix.count > 0, let start = range(of: suffix, options: .backwards, range: nil, locale: nil), start.upperBound == endIndex else { return self[..<endIndex] }
        return self[..<start.lowerBound]
    }

    
    /// If the string is prefixed by a value, return the rest of the string.
    /// - Parameter prefix: The prefix.
    /// - Returns: The remainder of the string without the prefix, or nil if the prefix was missing.
    func remainder<S>(ifPrefix prefix: S) -> SubSequence? where S: StringProtocol {
        guard prefix.count > 0, hasPrefix(prefix) else { return nil }
        return self[prefix.count...]
    }
    
    /// If the string is suffixed by a value, return the rest of the string.
    /// - Parameter suffix: The suffix.
    /// - Returns: The remainder of the string without the suffix, or nil if the suffix was missing.
    func remainder<S>(ifSuffix suffix: S) -> SubSequence? where S: StringProtocol {
        guard suffix.count > 0, let start = range(of: suffix, options: .backwards, range: nil, locale: nil), start.upperBound == endIndex else { return nil }
        return self[..<start.lowerBound]
    }
}


// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 20/08/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation


import XCTest
@testable import ElegantStrings

final class NSRangeTests: XCTestCase {
    func testRangeSubscript() {
        let test = "foobar"
        XCTAssertEqual(String(test[NSRange(location: 0, length: 0)]), "")
        XCTAssertEqual(String(test[NSRange(location: 1, length: 1)]), String(test[1]))
        XCTAssertEqual(String(test[NSRange(location: 0, length: test.count)]), test)
    }
}


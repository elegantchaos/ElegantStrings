// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 20/08/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

import XCTest
@testable import ElegantStrings

final class IntegerIndexTests: XCTestCase {
    func testSingleIndex() {
        XCTAssertEqual("foobar"[0], "f")
        XCTAssertEqual("foobar"[5], "r")
    }
}


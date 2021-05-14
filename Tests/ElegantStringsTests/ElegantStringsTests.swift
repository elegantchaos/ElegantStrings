// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 13/05/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import ElegantStrings

final class StringTests: XCTestCase {
    func testEndsWith() {
        XCTAssertTrue("foobar".ends(with: "bar"))
        XCTAssertTrue("foobar".ends(with: ""))
        XCTAssertFalse("foobar".ends(with: "foo"))
    }
    
    func testSlicing() {
        XCTAssertEqual("foobar"[..<3], "foo")
        XCTAssertEqual("foobar"[3...], "bar")
        XCTAssertEqual("foobar"[0...2], "foo")
        XCTAssertEqual("foobar"[3...5], "bar")
        XCTAssertEqual("foobar"[1...4], "ooba")
    }
}


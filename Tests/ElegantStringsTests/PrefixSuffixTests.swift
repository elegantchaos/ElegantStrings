// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 13/05/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import ElegantStrings

final class PrefixSuffixTests: XCTestCase {
    func testPrefix() {
        XCTAssertEqual("foobar".trimmed(ifPrefix: "foo"), "bar")
        XCTAssertEqual("foobar".removing(prefix: "foo"), "bar")

        XCTAssertNil("foobar".trimmed(ifPrefix: "bar"))
        XCTAssertEqual("foobar".removing(prefix: "bar"), "foobar")

        XCTAssertNil("foobar".trimmed(ifPrefix: ""))
        XCTAssertEqual("foobar".removing(prefix: ""), "foobar")
    }
    
    func testSuffix() {
        XCTAssertEqual("foobar".trimmed(ifSuffix: "bar"), "foo")
        XCTAssertEqual("foobar".removing(suffix: "bar"), "foo")

        XCTAssertNil("foobar".trimmed(ifSuffix: "foo"))
        XCTAssertEqual("foobar".removing(suffix: "foo"), "foobar")

        XCTAssertNil("foobar".trimmed(ifSuffix: ""))
        XCTAssertEqual("foobar".removing(suffix: ""), "foobar")
    }
}


// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 13/05/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import ElegantStrings

final class PrefixSuffixTests: XCTestCase {
    func testPrefix() {
        XCTAssertEqual("foobar".remainder(ifPrefix: "foo"), "bar")
        XCTAssertEqual("foobar".removing(prefix: "foo"), "bar")

        XCTAssertNil("foobar".remainder(ifPrefix: "bar"))
        XCTAssertEqual("foobar".removing(prefix: "bar"), "foobar")

        XCTAssertNil("foobar".remainder(ifPrefix: ""))
        XCTAssertEqual("foobar".removing(prefix: ""), "foobar")
    }
    
    func testSuffix() {
        XCTAssertEqual("foobar".remainder(ifSuffix: "bar"), "foo")
        XCTAssertEqual("foobar".removing(suffix: "bar"), "foo")

        XCTAssertNil("foobar".remainder(ifSuffix: "foo"))
        XCTAssertEqual("foobar".removing(suffix: "foo"), "foobar")

        XCTAssertNil("foobar".remainder(ifSuffix: ""))
        XCTAssertEqual("foobar".removing(suffix: ""), "foobar")
    }
    
    func testRemovingPartial() {
        XCTAssertEqual("foo-bar".removing(suffixStartingWith: "-"), "foo")
        XCTAssertEqual("foo-bar".removing(prefixEndingWith: "-"), "bar")

        XCTAssertEqual("foo-bar".removing(suffixStartingWith: ""), "foo-bar")
        XCTAssertEqual("foo-bar".removing(prefixEndingWith: ""), "foo-bar")

        XCTAssertEqual("foo-bar".removing(suffixStartingWith: "missing"), "foo-bar")
        XCTAssertEqual("foo-bar".removing(prefixEndingWith: "missing"), "foo-bar")

    }
}


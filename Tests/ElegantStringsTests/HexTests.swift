// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/02/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest

import ElegantStrings

class HexTestCase: XCTestCase {
    func testHexValue() {
        XCTAssertEqual("0xFF".hexValue, 255)
        XCTAssertEqual("0XA".hexValue, 10)
        XCTAssertEqual("FE".hexValue, 254)
        XCTAssertEqual("0xDEADBEEF".hexValue, 3735928559)
    }
    
    func testEmpty() {
        XCTAssertNil("".hexValue)
    }
    
    func testGapAfter0X() {
            XCTAssertNil("0X FF".hexValue)
    }
    
    func testOnly0x() {
        XCTAssertNil("0x".hexValue)
    }
    
    func testSpaceAfterStrict() {
        XCTAssertNil("0xFF ".hexValue)
    }
    
    func testCharactersAfterRelaxed() {
        XCTAssertEqual("0xFF ".hexValue(ignoringExtraCharacters: true), 255)
        XCTAssertEqual("0XAzzz".hexValue(ignoringExtraCharacters: true), 10)
        XCTAssertEqual("FE FE FE".hexValue(ignoringExtraCharacters: true), 254)
        XCTAssertEqual("0xDEADBEEF some other guff".hexValue(ignoringExtraCharacters: true), 3735928559)

    }
    
    func testBytesToHex() {
        let bytes: [UInt8] = [0xDE, 0xAD, 0xBE, 0xEF]
        XCTAssertEqual(String(hex: bytes), "DEADBEEF")
        XCTAssertEqual(String(hex: bytes, digitCase: .upper), "DEADBEEF")
        XCTAssertEqual(String(hex: bytes, digitCase: .lower), "deadbeef")
        XCTAssertEqual(String(hex: bytes, tagMode: .upper), "0XDEADBEEF")
        XCTAssertEqual(String(hex: bytes, tagMode: .lower), "0xDEADBEEF")
    }

    func testDataToHex() {
        let bytes: [UInt8] = [0xDE, 0xAD, 0xBE, 0xEF]
        let data = Data(bytes: bytes, count: bytes.count)
        XCTAssertEqual(String(hex: data), "DEADBEEF")
        XCTAssertEqual(String(hex: data, digitCase: .upper), "DEADBEEF")
        XCTAssertEqual(String(hex: data, digitCase: .lower), "deadbeef")
        XCTAssertEqual(String(hex: data, tagMode: .upper), "0XDEADBEEF")
        XCTAssertEqual(String(hex: data, tagMode: .lower), "0xDEADBEEF")
    }

    func testHexToData() {
        let data = "DEADBEEF".hexData!
        XCTAssertEqual(data.count, 4)
        XCTAssertEqual(data[0], 0xDE)
        XCTAssertEqual(data[1], 0xAD)
        XCTAssertEqual(data[2], 0xBE)
        XCTAssertEqual(data[3], 0xEF)
    }
    
    func testHexDataRoundTrip() {
        let string = "This is a test string"
        let data = string.data(using: .utf8)!
        let hex = String(hex: data)
        let decodedData = hex.hexData!
        let decodedString = String(data: decodedData, encoding: .utf8)
        XCTAssertEqual(decodedString, string)
    }
}

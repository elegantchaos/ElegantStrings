// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/02/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public extension String {
    enum HexMode {
        case lower
        case upper
        case none
        
        internal var format: String {
            switch self {
                case .lower:
                    return "%02x"
                default:
                    return  "%02X"
            }
        }
        
        internal func tagged(_ value: String) -> String {
            switch self {
                case .none: return value
                case .lower: return "0x\(value)"
                case .upper: return "0X\(value)"
            }
        }
    }
    
    /// Takes in an array of bytes, returns a hex-encoded string.
    /// The string optionally starts with "0x" or "0X".
    init(hex bytes: [UInt8], digitCase: HexMode = .upper, tagMode: HexMode = .none) {
        let format = digitCase.format
        let hex = bytes.map({ String(format: format, $0)}).joined(separator: "")
        self.init(tagMode.tagged(hex))
    }

    /// Takes in some data, returns a hex-encoded string.
    /// The string optionally starts with "0x" or "0X".
    init(hex data: Data, digitCase: HexMode = .upper, tagMode: HexMode = .none) {
        let format = digitCase.format
        let hex =  data.map({ String(format: format, $0)}).joined(separator: "")
        self.init(tagMode.tagged(hex))
    }

    /// Returns the integer value that results from interpreting the string
    /// as a hex number.
    ///
    /// Assumes that the hex number will fit into an Int.
    /// The string can optionally start with "0x" or "0X", but otherwise
    /// must consist only of upper or lower-case hex characters.
    var hexValue: Int? {
        return hexValue(ignoringExtraCharacters: false)
    }
    
    /// Returns the integer value that results from interpreting the string
    /// as a hex number.
    ///
    /// Assumes that the hex number will fit into an Int.
    /// The string must start with "0x", "0X" or a hex digit.
    /// If the string contains extra characters after the number,
    /// they can optionally be ignored, or can cause parsing to fail.
    func hexValue(ignoringExtraCharacters: Bool) -> Int? {
        var start = startIndex
        if starts(with: "0x") || starts(with: "0X") {
            start = index(start, offsetBy: 2)
        }

        let digits = self[start...]
        guard digits.first?.hexDigitValue != nil else { return nil }

        var value = 0
        for digit in digits {
            if let hex = digit.hexDigitValue {
                value = (value << 4) + hex
            } else {
                return ignoringExtraCharacters ? value : nil
            }
        }
        
        return value
    }
    
    /// Returns the Data that results from interpreting the string
    /// as a series of hex-encoded bytes.
    ///
    /// The string must contain an even number of hex digits, and
    /// no other characters.
    var hexData: Data? {
        assert(count % 2 == 0)
        var result = Data()

        var value: UInt8 = 0
        var highBit = false
        for digit in self {
            if let hex = digit.hexDigitValue {
                value = (value << 4) + UInt8(hex)
                if highBit {
                    result.append(value)
                    highBit = false
                    value = 0
                } else {
                    highBit = true
                }
            } else {
                return nil
            }
        }
        
        return result
    }

}

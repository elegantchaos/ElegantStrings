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
    
    init(hex bytes: [UInt8], digitCase: HexMode = .upper, tagMode: HexMode = .none) {
        let format = digitCase.format
        let hex = bytes.map({ String(format: format, $0)}).joined(separator: "")
        self.init(tagMode.tagged(hex))
    }

    init(hex data: Data, digitCase: HexMode = .upper, tagMode: HexMode = .none) {
        let format = digitCase.format
        let hex =  data.map({ String(format: format, $0)}).joined(separator: "")
        self.init(tagMode.tagged(hex))
    }

    var hexValue: Int? {
        return hexValue(ignoringExtraCharacters: false)
    }
    
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
}

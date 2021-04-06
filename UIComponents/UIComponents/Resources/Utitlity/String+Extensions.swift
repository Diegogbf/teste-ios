//
//  String+Extensions.swift
//  UIComponents
//
//  Created by Diego Gomes on 04/04/21.
//

import Foundation

public extension String {
    var toDouble: Double {
        (self as NSString).doubleValue
    }

    var currencyFormatted: String {
        let value = self.numbers.toDouble / 100
        return value.toBRLFormatted
    }

    var numbers: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}

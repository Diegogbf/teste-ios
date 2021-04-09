//
//  Float+Extension.swift
//  UIComponents
//
//  Created by Diego Gomes on 04/04/21.
//

import Foundation

public extension Double {
    var toBRLFormatted: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .ptBr
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }

    var percentage: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = .ptBr
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self/100)) ?? ""
    }
}

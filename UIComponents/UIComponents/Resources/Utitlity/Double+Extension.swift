//
//  Float+Extension.swift
//  UIComponents
//
//  Created by Diego Gomes on 04/04/21.
//

import Foundation

extension Double {
    var toBRLFormatted: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

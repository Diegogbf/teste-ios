//
//  Date+Extensions.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 04/04/21.
//

import Foundation

extension Date {
    func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

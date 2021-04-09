//
//  Date+Extensions.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 04/04/21.
//

import Foundation

public enum DateFormat: String {
    /// 27/11/1997
    case ddMMyyyy = "dd/MM/yyyy"
    /// 2023-03-03
    case yyyyMMdd = "yyyy-MM-dd"
    /// 2018-09-12T14:11:54
    case full = "yyyy-MM-dd'T'HH:mm:ss"
}

public extension Date {
    func formatted(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}

//
//  LocalizableStringsManager.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 04/04/21.
//

import Foundation

extension String {
    static func localize(for key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}

//
//  JsonHelper.swift
//  Teste-iOSTests
//
//  Created by Diego Gomes on 08/04/21.
//

import Foundation

class JSONDecoderHelper {
    static func decodeJsonFile<T: Decodable>(output: T.Type, fileName: String) -> T {
        guard let path = Bundle(for: self).path(forResource: fileName, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError()
        }

        if let decodedData = try? JSONDecoder().decode(output, from: jsonData) {
            return decodedData
        } else {
            fatalError()
        }
    }
}

//
//  DateTests.swift
//  Teste-iOSTests
//
//  Created by Diego Gomes on 08/04/21.
//

import XCTest
@testable import UIComponents

class DateTests: XCTestCase {

    func testDateFormat() {
        XCTAssertNotNil("27/11/2020".date(format: .ddMMyyyy))
        XCTAssertNotNil("2018-11-20".date(format: .yyyyMMdd))
        XCTAssertNotNil("2023-03-03T00:00:00".date(format: .full))
    }
}

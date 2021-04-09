//
//  SimulationResultTests.swift
//  Teste-iOSTests
//
//  Created by Diego Gomes on 09/04/21.
//

import XCTest
@testable import Teste_iOS

class SimulationResultViewModelTests: XCTestCase {

    var sut: SimulationResultViewModel!
    let mock = JSONDecoderHelper.decodeJsonFile(
        output: SimulationResultDataModel.self,
        fileName: "SimulationResultMock"
    )

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SimulationResultViewModel(simulationResult: mock, coordinatorDelegate: nil)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testValuesAttribution() {
        XCTAssertEqual(mock.investmentParameter.investedAmount.toBRLFormatted, sut.investedAmount.value)
        XCTAssertEqual(mock.grossAmount.toBRLFormatted, sut.grossAmount.value)
        XCTAssertEqual(mock.grossAmountProfit.toBRLFormatted, sut.grossAmountProfit.value)
        XCTAssertEqual(mock.taxesRate, sut.taxesRate)
        XCTAssertEqual(mock.taxesAmount, sut.taxesAmount)
        XCTAssertEqual(mock.netAmount.toBRLFormatted, sut.profitNetAmount.value)
        XCTAssertEqual(
            mock.investmentParameter.maturityDate.date(format: .full)?.formatted(.ddMMyyyy),
            sut.maturityDate.value
        )
        XCTAssertEqual(mock.investmentParameter.maturityTotalDays, Int(sut.totalDays.value))
        XCTAssertEqual(mock.monthlyGrossRateProfit.percentage, sut.grossRateMonthly.value)
        XCTAssertEqual(mock.investmentParameter.rate.percentage, sut.rate.value)
        XCTAssertEqual(mock.rateProfit.percentage, sut.rateProfit.value)
        XCTAssertEqual(2, sut.informationData.count)
    }

}

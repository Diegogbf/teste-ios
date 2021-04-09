//
//  SimulationTests.swift
//  Teste-iOSTests
//
//  Created by Diego Gomes on 08/04/21.
//

import XCTest
@testable import Teste_iOS

class SimulationViewModelTests: XCTestCase {

    var sut: SimulationViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SimulationViewModel(repository: SimulationRepositoryStub(), coordinatorDelegate: nil)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testFormSuccessValidation() {
        sut.rate = "123"
        sut.expirationDate = "12/11/2039"
        sut.investmentAmount = "R$ 1250,00"

        XCTAssertTrue(sut.isValidInvestmentAmount)
        XCTAssertTrue(sut.isValidRate)
        XCTAssertTrue(sut.isValidExpirationDate)
    }

    func testFormErrorValidation() {
        sut.rate = "0"
        XCTAssertFalse(sut.isValidRate)

        sut.expirationDate = "12/11/2010"
        XCTAssertFalse(sut.isValidExpirationDate, "Expiration date has to be in the future")

        sut.expirationDate = Date().formatted(.ddMMyyyy)
        XCTAssertFalse(sut.isValidExpirationDate, "Expiration date should not be today")

        sut.investmentAmount = "R$ 0,00"
        XCTAssertFalse(sut.isValidInvestmentAmount)
    }

    func testDataFetch() {
        let successExpectation = expectation(description: "Data Loaded")
        let repositoryStub = SimulationRepositoryStub { _ in
            successExpectation.fulfill()
        }

        sut = SimulationViewModel(repository: repositoryStub, coordinatorDelegate: nil)
        sut.rate = "123"
        sut.expirationDate = "12/11/2039"
        sut.investmentAmount = "R$ 1250,00"
        sut.simulateTapped()

        waitForExpectations(timeout: 0.3, handler: nil)
    }
}

class SimulationRepositoryStub: SimulationRepositoryProtocol {

    let successAction: ((SimulationResultDataModel) -> Void)?

    init(successAction: ((SimulationResultDataModel) -> Void)? = nil) {
        self.successAction = successAction
    }

    func simulate(
        data: SimulationDataModel,
        onSuccess: @escaping ((SimulationResultDataModel) -> Void),
        onError: @escaping ((String) -> Void)
    ) {
        let mock = JSONDecoderHelper.decodeJsonFile(
            output: SimulationResultDataModel.self,
            fileName: "SimulationResultMock"
        )
        onSuccess(mock)
        self.successAction?(mock)
    }
}

//
//  SimulationDataModel.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import Foundation

struct SimulationDataModel: Encodable {
    let investedAmount: Double?
    let index: String = "CDI"
    let rate: Int?
    let isTaxFree: Bool = false
    let maturityDate: String?
}

// MARK: - SimulationDataModel
struct SimulationResultDataModel: Decodable {
    let investmentParameter: InvestmentDataModel
    let grossAmount, taxesAmount, netAmount, grossAmountProfit: Double
    let netAmountProfit, annualGrossRateProfit, monthlyGrossRateProfit, dailyGrossRateProfit: Double
    let taxesRate: Double
    let rateProfit, annualNetRateProfit: Double
}

// MARK: - InvestmentParameter
struct InvestmentDataModel: Decodable {
    let investedAmount: Double
    let yearlyInterestRate: Double
    let maturityTotalDays, maturityBusinessDays: Int
    let maturityDate: String
    let rate: Double
    let isTaxFree: Bool
}

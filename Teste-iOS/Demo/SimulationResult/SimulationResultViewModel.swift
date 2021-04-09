//
//  SimulationResultViewModel.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 07/04/21.
//

import Foundation
import UIComponents

protocol SimulationResultViewModelCoordinatorProtocol: class {
    func simulateAgain()
}

protocol SimulationResultViewModelProtocol {
    var title: String { get }
    var amount: String { get }
    var profitText: String { get }
    var informationData: [SimulationResultView.Section] { get }

    func simulateAgainTapped()
}

class SimulationResultViewModel {

    // MARK: - Properties

    private var coordinatorDelegate: SimulationResultViewModelCoordinatorProtocol?
    private let simulationResult: SimulationResultDataModel

    // MARK: - Initializer

    init(
        simulationResult: SimulationResultDataModel,
        coordinatorDelegate: SimulationResultViewModelCoordinatorProtocol?
    ) {
        self.coordinatorDelegate = coordinatorDelegate
        self.simulationResult = simulationResult
    }

    var investedAmount: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.invested.amount.field"),
            value: simulationResult.investmentParameter.investedAmount.toBRLFormatted
        )
    }

    var grossAmount: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.gross.amount.field"),
            value: simulationResult.grossAmount.toBRLFormatted
        )
    }

    var grossAmountProfit: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.profit.amount.field"),
            value: simulationResult.grossAmountProfit.toBRLFormatted
        )
    }

    var taxes: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.taxes.field"),
            value: "\(taxesAmount.toBRLFormatted)(\(taxesRate.percentage))"
        )
    }

    var taxesRate: Double {
        simulationResult.taxesRate
    }

    var taxesAmount: Double {
        simulationResult.taxesAmount
    }

    var profitNetAmount: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.profit.net.amount.field"),
            value: simulationResult.netAmount.toBRLFormatted
        )
    }

    var maturityDate: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.redemption.date.field"),
            value: simulationResult.investmentParameter.maturityDate.date(format: .full)?.formatted(.ddMMyyyy) ?? ""
        )
    }

    var totalDays: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.total.days.field"),
            value: "\(simulationResult.investmentParameter.maturityTotalDays)"
        )
    }

    var grossRateMonthly: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.monthly.profit.rate.field"),
            value: simulationResult.monthlyGrossRateProfit.percentage
        )
    }

    var rate: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.cdi.rate.field"),
            value: simulationResult.investmentParameter.rate.percentage
        )
    }

    var rateProfit: InformationView.Data {
        .init(
            placeholder: .localize(for: "simulation.result.profit.rate.field"),
            value: simulationResult.rateProfit.percentage
        )
    }
}

// MARK: - SimulationResultViewModelProtocol

extension SimulationResultViewModel: SimulationResultViewModelProtocol {
    var title: String {
        .localize(for: "simulation.result.title")
    }

    var amount: String {
        simulationResult.grossAmount.toBRLFormatted
    }

    var profitText: String {
        String.localize(
            for: "simulation.result.profit.field"
        ).replacingOccurrences(
            of: "%@",
            with: simulationResult.rateProfit.toBRLFormatted
        )
    }

    var informationData: [SimulationResultView.Section] {
        [
            SimulationResultView.Section(
                rows: [
                    investedAmount,
                    grossAmount,
                    grossAmountProfit,
                    taxes,
                    profitNetAmount
                ]
            ),
            SimulationResultView.Section(
                rows: [
                    maturityDate,
                    totalDays,
                    grossRateMonthly,
                    rate,
                    rateProfit
                ]
            )
        ]
    }

    func simulateAgainTapped() {
        coordinatorDelegate?.simulateAgain()
    }
}

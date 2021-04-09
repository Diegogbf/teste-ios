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
    var informationData: [InformationView.Data] { get }

    func simulateAgainTapped()
}

class SimulationResultViewModel {

    // MARK: - Properties

    private let coordinatorDelegate: SimulationResultViewModelCoordinatorProtocol
    private let simulationResult: SimulationResultDataModel

    // MARK: - Initializer

    init(
        simulationResult: SimulationResultDataModel,
        coordinatorDelegate: SimulationResultViewModelCoordinatorProtocol
    ) {
        self.coordinatorDelegate = coordinatorDelegate
        self.simulationResult = simulationResult
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

    var informationData: [InformationView.Data] {
        [
            .init(
                placeholder: .localize(for: "simulation.result.invested.amount.field"),
                value: simulationResult.investmentParameter.investedAmount.toBRLFormatted
            ),
            .init(
                placeholder: .localize(for: "simulation.result.gross.amount.field"),
                value: simulationResult.grossAmount.toBRLFormatted
            ),
            .init(
                placeholder: .localize(for: "simulation.result.profit.amount.field"),
                value: simulationResult.rateProfit.toBRLFormatted
            ),
            .init(
                placeholder: .localize(for: "simulation.result.taxes.field"),
                value: "\(simulationResult.taxesAmount.toBRLFormatted)(\(simulationResult.taxesRate.percentage))"
            ),
            .init(
                placeholder: .localize(for: "simulation.result.profit.net.amount.field"),
                value: simulationResult.netAmount.toBRLFormatted
            ),
            .init(
                placeholder: .localize(for: "simulation.result.redemption.date.field"),
                value: simulationResult.investmentParameter.maturityDate.date(format: .full)?.formatted(.ddMMyyyy) ?? ""
            ),
            .init(
                placeholder: .localize(for: "simulation.result.total.days.field"),
                value: "\(simulationResult.investmentParameter.maturityTotalDays)"
            ),
            .init(
                placeholder: .localize(for: "simulation.result.monthly.profit.rate.field"),
                value: simulationResult.monthlyGrossRateProfit.percentage
            ),
            .init(
                placeholder: .localize(for: "simulation.result.cdi.rate.field"),
                value: simulationResult.investmentParameter.rate.percentage
            ),
            .init(
                placeholder: .localize(for: "simulation.result.profit.rate.field"),
                value: simulationResult.rateProfit.percentage
            )
        ]
    }

    func simulateAgainTapped() {
        coordinatorDelegate.simulateAgain()
    }
}

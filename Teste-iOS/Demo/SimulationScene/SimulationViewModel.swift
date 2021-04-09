//
//  SimulationViewModel.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import Foundation
import UIComponents

protocol SimulationViewModelCoordinatorProtocol: class {
    func simulationResult(result: SimulationResultDataModel)
}

protocol SimulationViewModelProtocol {
    var delegate: SimulationViewModelFeedBack? { get set }
    var investmentAmount: String? { get set }
    var rate: String? { get set }
    var expirationDate: String? { get set }

    func simulateTapped()
}

protocol SimulationViewModelFeedBack: class {
    func loader(show: Bool)
    func displayError(message: String)
}

class SimulationViewModel {

    // MARK: - Properties

    private let repository: SimulationRepositoryProtocol
    private let coordinatorDelegate: SimulationViewModelCoordinatorProtocol?
    weak var delegate: SimulationViewModelFeedBack?
    var investmentAmount: String?
    var rate: String?
    var expirationDate: String?

    // MARK: - Initializer

    init(repository: SimulationRepositoryProtocol, coordinatorDelegate: SimulationViewModelCoordinatorProtocol?) {
        self.repository = repository
        self.coordinatorDelegate = coordinatorDelegate
    }
}

// MARK: - SimulationViewModelProtocol

extension SimulationViewModel: SimulationViewModelProtocol {
    func simulateTapped() {
        guard let investmentAmount = investmentAmount?.numbers.toDouble,
              investmentAmount != .zero,
              let rateString = rate,
              let rate = Int(rateString),
              let expirationDate = expirationDate?.date(format: .ddMMyyyy)?.formatted(.yyyyMMdd) else {
            delegate?.displayError(message: .localize(for: "missing.data"))
            return
        }

        delegate?.loader(show: true)
        repository.simulate(
            data: .init(
                investedAmount: investmentAmount,
                rate: rate,
                maturityDate: expirationDate
            ), onSuccess: { [weak self] response in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.coordinatorDelegate?.simulationResult(result: response)
            }, onError: { [weak self] error in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.delegate?.displayError(message: error)
            })
    }
}

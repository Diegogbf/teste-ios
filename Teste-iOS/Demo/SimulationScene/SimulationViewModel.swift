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

    func simulateTapped(value: String, date: String, rate: String)
}

protocol SimulationViewModelFeedBack: class {
    func loader(show: Bool)
}

class SimulationViewModel {

    // MARK: - Properties

    private let repository: SimulationRepositoryFactory
    private let coordinatorDelegate: SimulationViewModelCoordinatorProtocol
    weak var delegate: SimulationViewModelFeedBack?

    // MARK: - Initializer

    init(repository: SimulationRepositoryFactory, coordinatorDelegate: SimulationViewModelCoordinatorProtocol) {
        self.repository = repository
        self.coordinatorDelegate = coordinatorDelegate
    }
}

// MARK: - SimulationViewModelProtocol

extension SimulationViewModel: SimulationViewModelProtocol {
    func simulateTapped(value: String, date: String, rate: String) {
        delegate?.loader(show: true)
        repository.simulate(
            data: .init(
                investedAmount: value.numbers.toDouble,
                rate: Int(rate) ?? 0,
                maturityDate: date
            ), onSuccess: { [weak self] response in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.coordinatorDelegate.simulationResult(result: response)
            }, onError: { [weak self] error in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
            })
    }
}

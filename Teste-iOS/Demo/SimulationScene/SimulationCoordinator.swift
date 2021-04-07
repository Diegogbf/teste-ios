//
//  SimulationCoordinator.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import UIKit

protocol SimulationCoordinatorProtocol: class {
    func showSimulationResult(result: SimulationResultDataModel)
}

class SimulationCoordinator {

    // MARK: - Properties

    private weak var delegate: SimulationCoordinatorProtocol?
    private let navigationController: UINavigationController

    // MARK: - Initializer

    init(delegate: SimulationCoordinatorProtocol, navigationController: UINavigationController) {
        self.delegate = delegate
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = SimulationViewModel(repository: SimulationRepository(), coordinatorDelegate: self)
        let controller = SimulationViewController(viewModel: viewModel)
        navigationController.viewControllers = [controller]
    }
}

// MARK: - SimulationViewModelCoordinatorProtocol

extension SimulationCoordinator: SimulationViewModelCoordinatorProtocol {
    func simulationResult(result: SimulationResultDataModel) {
        delegate?.showSimulationResult(result: result)
    }
}
